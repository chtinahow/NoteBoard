//
//  MediaFormulaViewController.m
//  LandScapeV2
//
//  Created by Student on 6/22/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "MediaFormulaViewController.h"

@interface MediaFormulaViewController ()

@end

@implementation MediaFormulaViewController

/*
General outline for initalizing the movieplayer along with the alloted formats that are allowed under the framework.
Sets the size and where it is located along with autoplayer and the source types that are allowed;
 
 
think about a picker that brings up the camera roll or local files accosiated with the ipad or device itself
 */


- (void)viewDidLoad
{
    [super viewDidLoad];
    _moviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:@"http://nordenmovil.com/urrea/InstalaciondelavaboURREAbaja.mp4"]];
    _moviePlayer.view.frame = CGRectMake(300, 0, 400, 400);
    _moviePlayer.moviePlayer.shouldAutoplay=YES;
    
    
    _moviePlayer.moviePlayer.movieSourceType= MPMovieSourceTypeFile;
    [_moviePlayer.moviePlayer setControlStyle:MPMovieControlStyleDefault];
    
    [self.view addSubview:_moviePlayer.view];
    
    [_moviePlayer.moviePlayer play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
