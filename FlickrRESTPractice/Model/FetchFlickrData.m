//
//  FetchFlickrData.m
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/6/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

#import "FetchFlickrData.h"
#import "FlickrKeys.h"
#import "FlickrURL.h"

@implementation FetchFlickrData
-(void)fetchFlickrJSONDataAt:(NSURL *)url
{
    //Get places, extract place name, place id, 
    dispatch_queue_t fetchFlickrJSONData = dispatch_queue_create("fetch Flickr JSON", NULL);
    dispatch_async(fetchFlickrJSONData, ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        NSArray *places = [results valueForKeyPath:FLICKR_RESULTS_PLACES];
        for (NSDictionary *place in places) {
           NSURL *photoURL = [FlickrURL URLforPhotosInPlace:[place valueForKey:FLICKR_PHOTO_PLACE_ID] maxResults:1];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate finished:self withJSON:places];
        });
    });
}


@end
