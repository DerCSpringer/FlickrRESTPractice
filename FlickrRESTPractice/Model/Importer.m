//
//  Importer.m
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/8/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

#import "Importer.h"
#import "FetchTopPlaces.h"
#import "Place+CoreDataClass.h"

@interface Importer ()

@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) FetchTopPlaces *fetch;

@end

@implementation Importer

- (id)initWithContext:(NSManagedObjectContext *)context
                fetch:(FetchTopPlaces *)fetch {
    self = [super init];
    if (self) {
        self.context = context;
        self.fetch = fetch;
    }
    return self;
}

-(void)import {
    [self.fetch fetchAllPlaces:^(NSArray *places)
     {
         [self.context performBlock:^
          {
              for(NSDictionary *place in places) {
                  [self.fetch fetchPhotoDataForPlace:place callback:^(NSData *place) {
                      Place 
                  }];

              }
                  NSError *error = nil;
                  [self.context save:&error];
                  if (error) {
                      NSLog(@"Error: %@", error.localizedDescription);
                  }
              
          }];
     }];
}

@end
