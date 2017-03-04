//
//  FlickrURL.h
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/3/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrURL : NSObject

typedef enum {
    FlickrPhotoFormatSquare = 1,    // thumbnail
    FlickrPhotoFormatLarge = 2,     // normal size
    FlickrPhotoFormatOriginal = 64  // high resolution
} FlickrPhotoFormat;


+ (NSURL *)URLforTopPlacesList;

+ (NSURL *)URLforPhoto:(NSDictionary *)photo format:(FlickrPhotoFormat)format;

@end
