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
#import "FlickrKeys.h"

@interface TopPlacesTVC ()<FetchedResultsControllerDataSourceDelegate>

@property NSDictionary* data;
@property NSManagedObjectContext *context;

@end

@implementation TopPlacesTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //might wanna create a seperate store class to avoid this
    AppDelegate<UIApplicationDelegate> *application = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.context = application.persistentContainer.viewContext;

    
    NSURL *flickrurl = [FlickrURL URLforTopPlacesList];
    FetchData *fetch = [[FetchData alloc] init];
    fetch.delegate = self;
    [fetch fetchJSONDataAt:flickrurl];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)finished:(FetchData *)fetch withJSON:(NSDictionary *)data {
    self.data = data;
//    FetchData *aFetch = [[FetchData alloc] init];
//    aFetch.delegate = self;
//    NSArray *places = [self.data valueForKeyPath:FLICKR_RESULTS_PLACES];
//    NSURL *photoURL = [FlickrURL URLforPhotosInPlace:[places[0] valueForKeyPath:FLICKR_PHOTO_PLACE_ID] maxResults:1];
//    [aFetch fetchJSONDataAt:photoURL];
    //Fetches the photo dictionary I send to the flickr URL. use valueforkeypath "photo" to get dictionary for photo
    
    [Place insertNewObjectsFromFlickr:data intoContext:self.context];
    
}

-(void)configureCell:(id)theCell withObject:(id)object {
    PlaceCell *pCell = theCell;
    
}

#pragma mark - Table view data source


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
