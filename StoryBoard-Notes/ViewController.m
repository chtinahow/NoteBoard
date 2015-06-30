//
//  ViewController.m
//  StoryBoard-Notes
//
//  Created by Kimberly Sookoo on 6/16/15.
//  Copyright (c) 2015 Kimberly Sookoo. All rights reserved.
//

#import "ViewController.h"
#import "MainPage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//shows UIView
-(void)willLayoutSubviews
{
    if(!self.didPresentScene)
    {
        // Present scene here
        self.didPresentScene = YES;
    }
}

//shows SKView
-(void)viewWillAppear:(BOOL)animated{
    MainPage *math = [[MainPage alloc] initWithSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)];
    SKView *view = (SKView *) self.view;
    [view presentScene:math];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
