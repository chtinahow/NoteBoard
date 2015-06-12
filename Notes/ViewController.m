//
//  ViewController.m
//  Notes
//
//  Created by Kimberly Sookoo on 6/9/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "ViewController.h"
#import "SpriteKit/SpriteKit.h"
#import "definitions.h"
#import "formulas.h"
#import "notes.h"
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
    /*definitions* def = [[definitions alloc] initWithSize:CGSizeMake(768,1024)];
    SKView *spriteView = (SKView *) self.view;
    [spriteView presentScene: def];*/
    
    /*formulas *form = [[formulas alloc] initWithSize:CGSizeMake(768,1024)];
    SKView *view = (SKView *) self.view;
    [view presentScene:form];*/
    
    /*notes *n = [[notes alloc] initWithSize:CGSizeMake(768,1024)];
    SKView *view = (SKView *) self.view;
    [view presentScene:n];*/
    
    MathClasses *math = [[MathClasses alloc] initWithSize:CGSizeMake(768, 1024)];
    SKView *view = (SKView *) self.view;
    [view presentScene:math];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
