//
//  Place+CoreDataProperties.h
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/3/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Place+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Place (CoreDataProperties)

+ (NSFetchRequest<Place *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *fullSizePhotoURL;
@property (nullable, nonatomic, copy) NSData *thumbnailData;


@end

NS_ASSUME_NONNULL_END
