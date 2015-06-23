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
    UIButton *b3;
    UIButton *b4;
    UIButton *b5;
    UIButton *b6;
    UIButton *b7;
    
    UIView *viewy;
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
        _scrollView.backgroundColor                 = [UIColor whiteColor];
        
        viewy = [[UIView alloc] initWithFrame:CGRectMake(0, 225, 1024, 40)];
        viewy.backgroundColor = [UIColor clearColor];
        
        b = [self makeButton];
        b.frame = CGRectMake(610, 50, 30, 30);
        [b addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [_table addSubview:b];
        
        b2 = [self makeButton];
        b2.frame = CGRectMake(610, 95, 30, 30);
        [b2 addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [_table addSubview:b2];
        
        b3 = [self makeButton];
        b3.frame = CGRectMake(610, 140, 30, 30);
        [b3 addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [_table addSubview:b3];
        
        b4 = [self makeButton];
        b4.frame = CGRectMake(610, 185, 30, 30);
        [b4 addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [_table addSubview:b4];
        
        b5 = [self makeButton];
        b5.frame = CGRectMake(610, 230, 30, 30);
        [b5 addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [_table addSubview:b5];
        
        b6 = [self makeButton];
        b6.frame = CGRectMake(610, 275, 30, 30);
        [b6 addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [_table addSubview:b6];
        
        b7 = [self makeButton];
        b7.frame = CGRectMake(610, 320, 30, 30);
        [b7 addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [_table addSubview:b7];
        
        //date
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *now = [[NSDate alloc] init];
        NSString *theDate = [dateFormat stringFromDate:now];
        
        UITextField *date = [[UITextField alloc] initWithFrame:CGRectMake(5, 0, 100, 40)];
        date.backgroundColor = [UIColor clearColor];
        date.userInteractionEnabled = NO;
        [date setText:[NSString stringWithFormat:@"%@", theDate]];
        date.textColor = [UIColor blueColor];
        [viewy addSubview:date];
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
    [self.view addSubview:viewy];
}

- (void)willMoveFromView:(SKView *)view
{
    [super willMoveFromView:view];
    
    [_scrollView removeFromSuperview];
    [viewy removeFromSuperview];
}

- (void)createScene{
    self.backgroundColor = [SKColor grayColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    SKSpriteNode *pap = [self paperNode];
    pap.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
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
    due.position = CGPointMake(0, 130);
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
    else if(pressed == b2) {
        [b2 setTitle:@"X" forState:UIControlStateNormal];
        [b2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [b2 addTarget:self action:@selector(clickedAgain:) forControlEvents:UIControlEventTouchUpInside];
    }
    else if(pressed == b3) {
        [b3 setTitle:@"X" forState:UIControlStateNormal];
        [b3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [b3 addTarget:self action:@selector(clickedAgain:) forControlEvents:UIControlEventTouchUpInside];
    }
    else if(pressed == b4) {
        [b4 setTitle:@"X" forState:UIControlStateNormal];
        [b4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [b4 addTarget:self action:@selector(clickedAgain:) forControlEvents:UIControlEventTouchUpInside];
    }
    else if(pressed == b5) {
        [b5 setTitle:@"X" forState:UIControlStateNormal];
        [b5 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [b5 addTarget:self action:@selector(clickedAgain:) forControlEvents:UIControlEventTouchUpInside];
    }
    else if(pressed == b6) {
        [b6 setTitle:@"X" forState:UIControlStateNormal];
        [b6 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [b6 addTarget:self action:@selector(clickedAgain:) forControlEvents:UIControlEventTouchUpInside];
    }
    else if(pressed == b7) {
        [b7 setTitle:@"X" forState:UIControlStateNormal];
        [b7 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [b7 addTarget:self action:@selector(clickedAgain:) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(IBAction)clickedAgain: (UIButton *) pressed{
    if(pressed == b){
        b = [self makeButton];
        b.frame = CGRectMake(610, 50, 30, 30);
        [b addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [_table addSubview:b];
    }
    else if(pressed == b2){
        b2 = [self makeButton];
        b2.frame = CGRectMake(610, 95, 30, 30);
        [b2 addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [_table addSubview:b2];
    }
    else if(pressed == b3){
        b3 = [self makeButton];
        b3.frame = CGRectMake(610, 140, 30, 30);
        [b3 addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [_table addSubview:b3];
    }
    else if(pressed == b4){
        b4 = [self makeButton];
        b4.frame = CGRectMake(610, 185, 30, 30);
        [b4 addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [_table addSubview:b4];
    }
    else if(pressed == b5){
        b5 = [self makeButton];
        b5.frame = CGRectMake(610, 230, 30, 30);
        [b5 addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [_table addSubview:b5];
    }
    else if(pressed == b6){
        b6 = [self makeButton];
        b6.frame = CGRectMake(610, 275, 30, 30);
        [b6 addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [_table addSubview:b6];
    }
    else if(pressed == b7){
        b7 = [self makeButton];
        b7.frame = CGRectMake(610, 320, 30, 30);
        [b7 addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [_table addSubview:b7];
    }
}

@end
