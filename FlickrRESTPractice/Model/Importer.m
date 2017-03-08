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
    
}

@end
