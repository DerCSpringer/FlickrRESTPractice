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
              NSArray *places = result[@"result"];
              callback(places);
              
          }
      }] resume];
}

- (void)fetchPhotoDataForPlace:(NSDictionary *)place callback:(void (^)(NSData *place))callback {
    NSURL *photoURL = [FlickrURL URLforPhotosInPlace:[place valueForKey:FLICKR_PHOTO_PLACE_ID] maxResults:1];
    [[[NSURLSession sharedSession] dataTaskWithURL:photoURL completionHandler:
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
