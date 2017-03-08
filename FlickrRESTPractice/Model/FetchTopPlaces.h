//
//  FetchTopPlaces.h
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/8/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FetchTopPlaces : NSObject

- (void)fetchAllPlaces:(void (^)(NSArray *places))callback;
- (void)fetchPhotoDataForPlace:(NSDictionary *)place callback:(void (^)(NSData *place))callback;

@end
