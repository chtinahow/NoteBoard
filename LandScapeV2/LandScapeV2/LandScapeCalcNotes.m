//
//  LandScapeCalcNotes.m
//  LandScapeV2
//
//  Created by Student on 6/16/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "LandScapeCalcNotes.h"

@interface LandScapeCalcNotes()

@property BOOL created;

@end

@implementation LandScapeCalcNotes

- (void)didMoveToView: (SKView *) view{
    if (!self.created) {
        [self createSceneContents];
        self.created = YES;
    }
}

//Note! We need to give the papers outlines in this portion or it'll look like a deformed paper monster!
//Also, I made the papers that we won't be clicking red just to be able to tell the difference for now.
- (void)createSceneContents{
    self.backgroundColor = [SKColor grayColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    SKSpriteNode *pap = [self paperNode];
    pap.position = CGPointMake(CGRectGetMidX(self.frame)-150, CGRectGetMidY(self.frame)+150);
    
    SKSpriteNode *paper = [self paperNode2];
    paper.position = CGPointMake(CGRectGetMidX(self.frame)-75, CGRectGetMidY(self.frame)+75);
    
    SKSpriteNode *paper2 = [self paperNode2];
    paper2.position = CGPointMake(CGRectGetMidX(self.frame)-150, CGRectGetMidY(self.frame)-200);
    
    //add date
    SKLabelNode *date = [self dateNode];
    date.position = CGPointMake(-180, 235);
    [pap addChild:date];
    
    [self addChild:paper2];
    [self addChild:paper];
    [self addChild:pap];
}

#pragma mark

- (SKSpriteNode *)paperNode{
    SKSpriteNode *paper = [[SKSpriteNode alloc] initWithColor:[SKColor whiteColor] size:CGSizeMake(400, 500)];
    paper.name = @"paper";
    
    return paper;
}

#pragma mark

//papers that are not currently clickable
- (SKSpriteNode *)paperNode2{
    SKSpriteNode *paper = [[SKSpriteNode alloc] initWithColor:[SKColor redColor] size:CGSizeMake(400, 500)];
    
    return paper;
}

#pragma mark

- (SKLabelNode *)dateNode{
    SKLabelNode *date = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    date.name = @"date";
    date.text = @"Date: ";
    date.fontSize = 15;
    date.fontColor = [SKColor blackColor];
    return date;
}

@end

