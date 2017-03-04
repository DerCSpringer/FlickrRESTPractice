//
//  Place+CoreDataClass.h
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/3/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Place : NSManagedObject
+ (instancetype)insertNewObjectIntoContext:(NSManagedObjectContext *)context;
+ (void)insertNewObjectsFromFlickr:(NSDictionary *)results intoContext:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "Place+CoreDataProperties.h"
