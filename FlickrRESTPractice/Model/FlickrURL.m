//
//  FlickrURL.m
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/3/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

#import "FlickrURL.h"

@implementation FlickrURL

#define FLICKR_API_KEY @"3a757e4a4a5f16397e6b0f10ba725813"



+ (NSURL *)genericURLForQuery:(NSString *)query
{
    query = [NSString stringWithFormat:@"%@&format=json&nojsoncallback=1&api_key=%@", query, FLICKR_API_KEY];
    query = [query stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    return [NSURL URLWithString:query];
}

+ (NSURL *)URLforTopPlacesList

{
    return [self genericURLForQuery:@"https://api.flickr.com/services/rest/?method=flickr.places.getTopPlacesList&place_type_id=7"];
}

+ (NSURL *)URLforPhoto:(NSDictionary *)photo format:(FlickrPhotoFormat)format;
{
    return [NSURL URLWithString:[self urlStringForPhoto:photo format:format]];
}

+ (NSString *)urlStringForPhoto:(NSDictionary *)photo format:(FlickrPhotoFormat)format
{
    id farm = [photo objectForKey:@"farm"];
    id server = [photo objectForKey:@"server"];
    id photo_id = [photo objectForKey:@"id"];
    id secret = [photo objectForKey:@"secret"];
    if (format == FlickrPhotoFormatOriginal) secret = [photo objectForKey:@"originalsecret"];
    
    NSString *fileType = @"jpg";
    if (format == FlickrPhotoFormatOriginal) fileType = [photo objectForKey:@"originalformat"];
    
    if (!farm || !server || !photo_id || !secret) return nil;
    
    NSString *formatString = @"s";
    switch (format) {
        case FlickrPhotoFormatSquare:    formatString = @"s"; break;
        case FlickrPhotoFormatLarge:     formatString = @"b"; break;
        case FlickrPhotoFormatOriginal:  formatString = @"o"; break;
    }
    
    return [NSString stringWithFormat:@"https://farm%@.static.flickr.com/%@/%@_%@_%@.%@", farm, server, photo_id, secret, formatString, fileType];
}

@end
