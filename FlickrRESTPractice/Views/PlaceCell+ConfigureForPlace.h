//
//  PlaceCell+ConfigureForPlace.h
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/8/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

#import "PlaceCell.h"

@class Place;

@interface PlaceCell (ConfigureForPlace)

- (void)configureForPlace:(Place *)place;

@end
