//
//  ViewController.m
//  StoryBoard-Notes
//
//  Created by Student on 6/16/15.
//  Copyright (c) 2015 Student. All rights reserved.
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

-(void)willLayoutSubviews
{
    if(!self.didPresentScene)
    {
        // Present scene here
        self.didPresentScene = YES;
    }
}

-(void)viewWillAppear:(BOOL)animated{
    MainPage *math = [[MainPage alloc] initWithSize:CGSizeMake(1024, 768)];
    SKView *view = (SKView *) self.view;
    [view presentScene:math];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
