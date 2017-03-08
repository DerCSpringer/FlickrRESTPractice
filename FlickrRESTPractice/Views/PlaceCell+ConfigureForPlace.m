//
//  PlaceCell+ConfigureForPlace.m
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/8/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

#import "PlaceCell+ConfigureForPlace.h"
#import "Place+CoreDataProperties.h"

@implementation PlaceCell (ConfigureForPlace)

- (void)configureForPlace:(Place *)place {
    self.placeName.text = place.name;
    self.placeSampleImage.image = [UIImage imageWithData:place.thumbnailData];
}

@end
