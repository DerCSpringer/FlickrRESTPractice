//
//  FetchFlickrData.h
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/6/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

#import "FetchData.h"

@interface FetchFlickrData : FetchData

-(void)fetchFlickrJSONDataAt:(NSURL *)url;


@end
