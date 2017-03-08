//
//  Importer.m
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/8/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

#import "Importer.h"
#import "FetchData.h"

@interface Importer ()

@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) FetchData *fetch;

@end

@implementation Importer

- (id)initWithContext:(NSManagedObjectContext *)context
                fetch:(FetchData *)fetch {
    self = [super init];
    if (self) {
        self.context = context;
        self.fetch = fetch;
    }
    return self;
}

-(void)import {
    [self.webservice fetchAllPods:^(NSArray *pods)
     {
         [self.context performBlock:^
          {
              for(NSDictionary *podSpec in pods) { //This is called everytime a page is loaded up.
                  NSString *identifier = [podSpec[@"name"] stringByAppendingString:podSpec[@"version"]];
                  Pod *pod = [Pod findOrCreatePodWithIdentifier:identifier inContext:self.context];
                  [pod loadFromDictionary:podSpec];
              }
              self.batchCount++;
              if (self.batchCount % 10 == 0) { //Save every 10 pages
                  NSError *error = nil;
                  [self.context save:&error];
                  if (error) {
                      NSLog(@"Error: %@", error.localizedDescription);
                  }
              }
          }];
     }];
}

@end
