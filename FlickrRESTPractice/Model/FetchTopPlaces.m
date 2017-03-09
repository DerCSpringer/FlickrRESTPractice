//
//  FetchTopPlaces.m
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/8/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

#import "FetchTopPlaces.h"
#import "FlickrURL.h"
#import "FlickrKeys.h"

@implementation FetchTopPlaces


- (void)fetchAllPlaces:(void (^)(NSArray *places))callback {
    NSURL *url = [FlickrURL URLforTopPlacesList];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:
      ^(NSData *data, NSURLResponse *response, NSError *error) {
          if (error) {
              NSLog(@"error: %@", error.localizedDescription);
              callback(nil);
              return;
          }
          NSError *jsonError = nil;
          id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
          if ([result isKindOfClass:[NSDictionary class]]) {
              NSArray *places = [result valueForKeyPath:FLICKR_RESULTS_PLACES];
              callback(places);
              
          }
      }] resume];
}

- (void)fetchPhotoDataForPlace:(NSDictionary *)place callback:(void (^)(NSData *place, NSString *fullSizePhotoURL))callback {
    NSURL *photoDictionaryURL = [FlickrURL URLforPhotosInPlace:[place valueForKey:FLICKR_PHOTO_PLACE_ID] maxResults:1];
    [[[NSURLSession sharedSession] dataTaskWithURL:photoDictionaryURL completionHandler:
      ^(NSData *data, NSURLResponse *response, NSError *error) {
          if (error) {
              NSLog(@"error: %@", error.localizedDescription);
              callback(nil, nil);
              return;
          }
          NSError *jsonError = nil;
          id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
          if ([result isKindOfClass:[NSDictionary class]]) {
              NSArray *photos = [result valueForKeyPath:FLICKR_RESULTS_PHOTOS];
              NSURL *photoURL = [FlickrURL URLforPhoto:photos[0] format:FlickrPhotoFormatSquare];
              NSString *fullSizePhotoURL = [[FlickrURL URLforPhoto:photos[0] format:FlickrPhotoFormatLarge] absoluteString];
              [[[NSURLSession sharedSession] dataTaskWithURL:photoURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                  if (error) {
                      NSLog(@"error: %@", error.localizedDescription);
                      callback(nil, nil);
                      return;
                  }
                  callback(data, fullSizePhotoURL);
              }] resume];
          }
      }] resume];
}

- (void)fetchPhotoAt:(NSString *)photoURL callback:(void (^)(NSData *photo))callback {
    NSURL *url = [NSURL URLWithString:photoURL];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:
      ^(NSData *data, NSURLResponse *response, NSError *error) {
          if (error) {
              NSLog(@"error: %@", error.localizedDescription);
              callback(nil);
              return;
          }
              callback(data);
      }] resume];
}


@end
