//
//  FetchData.h
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/3/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FetchData;

//Must subscribe to protocol if the data from the fetch is to be used

@protocol didFinishFetch <NSObject>

@optional
-(void)finished:(FetchData *)fetch with:(NSData *)data;
-(void)finished:(FetchData *)fetch withJSON:(NSDictionary *)data;

@end

@interface FetchData : NSObject

-(void)fetchDataAt:(NSURL *)url;
-(void)fetchJSONDataAt:(NSURL *)url;

@property (nonatomic, weak) id <didFinishFetch> delegate;

@end
