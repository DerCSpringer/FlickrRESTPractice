//
//  Importer.h
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/8/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class FetchTopPlaces;

@interface Importer : NSObject

- (id)initWithContext:(NSManagedObjectContext *)context
                fetch:(FetchTopPlaces *)fetch;
-(void)import;

@end
