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
- (void)fetchPhotoDataForPlace:(NSDictionary *)place callback:(void (^)(NSData *place, NSString *fullSizePhotoURL))callback;
- (void)fetchPhotoAt:(NSString *)photoURL callback:(void (^)(NSData *photo))callback;

@end
