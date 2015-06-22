//
//  ExampleViewController.m
//  LandScapeV2
//
//  Created by Student on 6/22/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "ExampleViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "ViewController.h"

@interface ExampleViewController ()

@end

@implementation ExampleViewController
@synthesize myWebView;
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *embedCode = @"<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/JC82Il2cjqA\" frameborder=\"0\" allowfullscreen></iframe>";
    [[self myWebView]loadHTMLString:embedCode baseURL:nil];

    
    
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
