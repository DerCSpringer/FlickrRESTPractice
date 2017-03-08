//
//  PlaceCell.h
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/3/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *placeName;
@property (weak, nonatomic) IBOutlet UIImageView *placeSampleImage;


+ (UINib *)nib;

@end
