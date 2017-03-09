//
//  TopPlaceImageVC.m
//  FlickrRESTPractice
//
//  Created by Daniel Springer on 3/8/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

#import "TopPlaceImageVC.h"
#import "FetchTopPlaces.h"

@interface TopPlaceImageVC () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (nonatomic) UIImage *image;



@end

@implementation TopPlaceImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.scrollView addSubview:self.imageView];
   
    FetchTopPlaces *fetch = [[FetchTopPlaces alloc] init];
    [fetch fetchPhotoAt:self.imageURLToDisplay callback:^(NSData *photo) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = [[UIImage alloc] initWithData:photo];
        });
    }];
}
- (UIImageView *)imageView
{
    if (!_imageView) _imageView = [[UIImageView alloc] init];
    return _imageView;
}

-(void)setImage:(UIImage *)image
{
    self.scrollView.zoomScale = 1.0;
    self.imageView.image = image;
    self.imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    self.scrollView.contentSize = self.image ?self.image.size : CGSizeZero;
}

- (UIImage *)image
{
    return self.imageView.image;
}

-(void)setScrollView:(UIScrollView *)scrollView
{
    //needs these to zoom
    _scrollView = scrollView;
    _scrollView.minimumZoomScale = 0.2;
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.delegate = self;
    self.scrollView.contentSize = self.image ?self.image.size : CGSizeZero;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
