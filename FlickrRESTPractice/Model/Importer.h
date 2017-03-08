//
//  Importer.h
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/8/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@class FetchData;


@interface Importer : NSObject

- (id)initWithContext:(NSManagedObjectContext *)context
                fetch:(FetchData *)fetch;
-(void)import;

@end
