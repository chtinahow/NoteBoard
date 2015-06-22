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
@synthesize moviePlayer;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *url = [[NSURL alloc]initWithString:@"https://www.youtube.com/watch?v=JC82Il2cjqA"];
    
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    [moviePlayer.view setFrame:CGRectMake(20, 100, 280, 150)];
    [self.view addSubview:moviePlayer.view];
    
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
