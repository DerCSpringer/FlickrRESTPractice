//
//  FetchData.m
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/3/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

#import "FetchData.h"

@implementation FetchData

-(void)fetchDataAt:(NSURL *)url {
    dispatch_queue_t fetchData = dispatch_queue_create("fetch data", NULL);
    dispatch_sync(fetchData, ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self.delegate finished:self with:data];
        });
    });
    
}

-(void)fetchJSONDataAt:(NSURL *)url {
    dispatch_queue_t fetchJSONData = dispatch_queue_create("fetch JSON", NULL);
    dispatch_async(fetchJSONData, ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate finished:self withJSON:results];
        });
    });
}

@end
