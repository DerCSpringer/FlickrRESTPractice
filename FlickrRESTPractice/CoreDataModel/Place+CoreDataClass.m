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

+ (void)insertNewObjectsFromFlickr:(NSDictionary *)results intoContext:(NSManagedObjectContext *)context {
    NSArray *places = [results valueForKeyPath:FLICKR_RESULTS_PLACES];
    for (NSDictionary *place in  places) {
        Place *placeInDB = [self insertNewObjectIntoContext:context];
        placeInDB.name = [place valueForKey:FLICKR_RESULTS_PLACES_NAME];
    }
}


@end
