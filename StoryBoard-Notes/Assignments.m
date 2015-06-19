//
//  Assignments.m
//  StoryBoard-Notes
//
//  Created by Student on 6/17/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "Assignments.h"

@interface Assignments()

@property BOOL created;

@property UIScrollView *scrollView;

@property UITableView *table;

@end

@implementation Assignments{
    UIButton *button;
    UIButton *b;
    UIButton *b2;
}

#pragma mark

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        CGSize layerSize        = CGSizeMake(768, 300);
        CGSize tableSize = CGSizeMake(768, 2400);
        CGPoint layerPosition   = CGPointMake(20, 450);
        CGPoint tablePosition = CGPointMake(0, 0);
        CGRect viewFrame = CGRectMake(layerPosition.x, layerPosition.y, layerSize.width-50, layerSize.height);
        CGRect tableFrame = CGRectMake(tablePosition.x, tablePosition.y, tableSize.width-50, tableSize.height);
        _scrollView = [[UIScrollView alloc] initWithFrame:viewFrame];
        _table = [[UITableView alloc] initWithFrame:tableFrame];
        _scrollView.contentSize                     = CGSizeMake(120, 2000);
        _scrollView.scrollEnabled                   = YES;
        _scrollView.backgroundColor                 = [UIColor grayColor];
        
        b = [self makeButton];
        b.frame = CGRectMake(610, 50, 30, 30);
        [b addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [_table addSubview:b];
        
        b2 = [self makeButton];
        b2.frame = CGRectMake(610, 100, 30, 30);
        [b2 addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [_table addSubview:b2];
    }
    
    return self;
}

- (void) didMoveToView:(SKView *)view{
    if(!self.created){
        [self createScene];
        self.created = YES;
    }
    [_scrollView addSubview:_table];
    [self.view addSubview:_scrollView];
}

- (void)willMoveFromView:(SKView *)view
{
    [super willMoveFromView:view];
    
    [_scrollView removeFromSuperview];
}

- (void)createScene{
    self.backgroundColor = [SKColor grayColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    SKSpriteNode *pap = [self paperNode];
    pap.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
    //add date
    SKLabelNode *date = [self dateNode];
    date.position = CGPointMake(-470, 340);
    [pap addChild:date];
    
    //title of page
    SKLabelNode *up = [self upcoming];
    up.position = CGPointMake(0, 230);
    [pap addChild:up];
    
    //assignments title
    SKLabelNode *assign = [self assignmentsTitle];
    assign.position = CGPointMake(-350, 130);
    [pap addChild:assign];
    
    //due date
    SKLabelNode *due = [self dueDate];
    due.position = CGPointMake(350, 130);
    [pap addChild:due];
    
    [self addChild:pap];
}

#pragma mark

- (SKSpriteNode *)paperNode{
    SKSpriteNode *paper = [[SKSpriteNode alloc] initWithColor:[SKColor whiteColor] size:CGSizeMake(1024, 768)];
    
    return paper;
}

#pragma mark

- (SKLabelNode *)dateNode{
    SKLabelNode *date = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    date.name = @"date";
    date.text = @"Date: ";
    date.fontSize = 30;
    date.fontColor = [SKColor blackColor];
    return date;
}

#pragma mark

- (SKLabelNode *)upcoming{
    SKLabelNode *up = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    up.name = @"up";
    up.text = @"Upcoming Due Dates";
    up.fontSize = 40;
    up.fontColor = [SKColor blackColor];
    return up;
}

#pragma mark

- (SKLabelNode *) assignmentsTitle{
    SKLabelNode *assign = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    assign.name = @"assign";
    assign.text = @"Assignments";
    assign.fontSize = 35;
    assign.fontColor = [SKColor blackColor];
    return assign;
}

#pragma mark

- (SKLabelNode *) dueDate{
    SKLabelNode *due = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    due.name = @"due";
    due.text = @"Due Dates";
    due.fontColor = [SKColor blackColor];
    due.fontSize = 35;
    return due;
}

#pragma mark

-(UIButton *) makeButton{
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.backgroundColor = [UIColor redColor];
    return button;
}

-(IBAction)clicked: (UIButton *) pressed{
    if(pressed == b){
        [b setTitle:@"X" forState:UIControlStateNormal];
        [b setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [b addTarget:self action:@selector(clickedAgain:) forControlEvents:UIControlEventTouchUpInside];
    }
    if(pressed == b2) {
        [b2 setTitle:@"X" forState:UIControlStateNormal];
        [b2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [b2 addTarget:self action:@selector(clickedAgain:) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(IBAction)clickedAgain: (UIButton *) pressed{
    if(pressed == b){
        b = [self makeButton];
        b.frame = CGRectMake(610, 50, 30, 30);
        [b addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [_table addSubview:b];
    }
    if(pressed == b2){
        b2 = [self makeButton];
        b2.frame = CGRectMake(610, 100, 30, 30);
        [b2 addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [_table addSubview:b2];
    }
}

@end
