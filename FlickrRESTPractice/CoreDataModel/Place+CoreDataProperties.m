//
//  Place+CoreDataProperties.m
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/3/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Place+CoreDataProperties.h"

@implementation Place (CoreDataProperties)

+ (NSFetchRequest<Place *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Place"];
}

@dynamic name;

@end
