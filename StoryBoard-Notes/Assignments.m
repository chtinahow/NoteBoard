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

@implementation Assignments

#pragma mark

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        CGSize layerSize        = CGSizeMake(768, 200);
        CGSize tableSize = CGSizeMake(768, 1200);
        CGPoint layerPosition   = CGPointMake(20, 500);
        CGPoint tablePosition = CGPointMake(0, 50);
        CGRect viewFrame = CGRectMake(layerPosition.x, layerPosition.y, layerSize.width-50, layerSize.height);
        CGRect tableFrame = CGRectMake(tablePosition.x, tablePosition.y, tableSize.width-50, tableSize.height);
        _scrollView = [[UIScrollView alloc] initWithFrame:viewFrame];
        _table = [[UITableView alloc] initWithFrame:tableFrame];
        _scrollView.contentSize                     = CGSizeMake(120, 2000);
        _scrollView.scrollEnabled                   = YES;
        _scrollView.showsVerticalScrollIndicator  = YES;
        _scrollView.backgroundColor                 = [UIColor grayColor];
        _table.contentSize = CGSizeMake(120, 2000);
        _table.scrollEnabled = YES;
        _table.showsVerticalScrollIndicator = YES;
        _table.backgroundColor = [UIColor blueColor];

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

/*-(id) initWithSize:(CGSize)size{
    if(self = [super initWithSize:size]){
        CGSize layerSize = CGSizeMake(500, 600);
        CGPoint layerPosition = CGPointMake(20, 500);
        CGRect viewFrame = CGRectMake(layerPosition.x, layerPosition.y, layerSize.width, layerSize.height);
        _table = [[UITableView alloc] initWithFrame:viewFrame];
        _table.contentSize = CGSizeMake(120, 2000);
        _table.scrollEnabled = YES;
        _table.showsVerticalScrollIndicator = YES;
        _table.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void) didMoveToView:(SKView *)view{
    if(!self.created){
        [self createScene];
        self.created = YES;
    }
    [self.view addSubview:_table];
}

- (void)willMoveFromView:(SKView *)view
{
    [super willMoveFromView:view];
    
    [_table removeFromSuperview];
}*/

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



@end
