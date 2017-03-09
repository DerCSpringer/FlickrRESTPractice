//
//  Place+CoreDataClass.m
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/3/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Place+CoreDataClass.h"
#import "FlickrKeys.h"
#import "FlickrURL.h"


@implementation Place

+ (NSString *)entityName
{
    return @"Place";
}

+ (instancetype)insertNewObjectIntoContext:(NSManagedObjectContext *)context
{
    return [NSEntityDescription insertNewObjectForEntityForName:[self entityName]
                                         inManagedObjectContext:context];
}

+ (void)insertNewObjectsFromFlickr:(NSDictionary *)results andPhotoData:(NSData *)data withPhotoURL:(NSString *)urlString intoContext:(NSManagedObjectContext *)context{
        Place *placeInDB = [self insertNewObjectIntoContext:context];
        placeInDB.name = [results valueForKey:FLICKR_RESULTS_PLACES_NAME];
        placeInDB.fullSizePhotoURL = urlString;
        placeInDB.thumbnailData  = data;
}


@end
