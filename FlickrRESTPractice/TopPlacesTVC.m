//
//  TopPlacesTVC.m
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/3/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

#import "TopPlacesTVC.h"
#import "FlickrURL.h"
#import "Place+CoreDataClass.h"
#import "AppDelegate.h"
#import "FetchedResultsControllerDataSource.h"
#import "PlaceCell.h"
#import "PlaceCell+ConfigureForPlace.h"
#import "FlickrKeys.h"
#import "TopPlaceImageVC.h"
#import "TopPlaceImageVC.h"

static NSString *const PlaceCellIdentifier = @"PhotoCell";


@interface TopPlacesTVC ()<FetchedResultsControllerDataSourceDelegate, UITableViewDelegate>

@property NSDictionary* data;
@property NSManagedObjectContext *managedObjectContext;
@property (nonatomic) FetchedResultsControllerDataSource *dataSource;

@end

@implementation TopPlacesTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[PlaceCell nib] forCellReuseIdentifier:PlaceCellIdentifier];
    //might wanna create a seperate store class to avoid this
    AppDelegate<UIApplicationDelegate> *application = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.managedObjectContext = application.persistentContainer.viewContext;

    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Place"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    self.dataSource = [[FetchedResultsControllerDataSource alloc] initWithTableView:self.tableView];
    self.dataSource.delegate = self;
    self.dataSource.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    self.dataSource.reuseIdentifier = PlaceCellIdentifier;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)configureCell:(PlaceCell *)theCell withObject:(Place *)object {
    [theCell configureForPlace:object];
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"Photo" sender:indexPath];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSIndexPath *)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"Photo"]) {
        TopPlaceImageVC *tpivc = [segue destinationViewController];
        Place *place = [self.dataSource.fetchedResultsController objectAtIndexPath:sender];
        tpivc.imageURLToDisplay = place.fullSizePhotoURL;
    }
    
}

@end
