//
//  ViewController.m
//  Notes-landscape
//
//  Created by Student on 6/12/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "ViewController.h"
#import "SpriteKit/SpriteKit.h"
#import "MathClasses.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SKView *spriteView = (SKView *) self.view;
    spriteView.showsDrawCount = YES;
    spriteView.showsNodeCount = YES;
    spriteView.showsFPS = YES;
}

- (void)viewWillAppear:(BOOL)animated{
    MathClasses *math = [[MathClasses alloc] initWithSize:CGSizeMake(1024, 768)];
    SKView *view = (SKView *) self.view;
    [view presentScene:math];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
