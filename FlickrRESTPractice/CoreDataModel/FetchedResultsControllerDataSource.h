//
//  NSFetchedResultsControllerDataSource.h
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/6/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class NSFetchedResultsController;

@protocol FetchedResultsControllerDataSourceDelegate
- (void)configureCell:(id)cell withObject:(id)object;

@optional
//- (void)deleteObject:(id)object;

@end

@interface FetchedResultsControllerDataSource : NSObject <UITableViewDataSource, NSFetchedResultsControllerDelegate>

@property (nonatomic, weak) id<FetchedResultsControllerDataSourceDelegate> delegate;
@property (nonatomic, strong) NSFetchedResultsController* fetchedResultsController;
@property (nonatomic, copy) NSString* reuseIdentifier;

@end
