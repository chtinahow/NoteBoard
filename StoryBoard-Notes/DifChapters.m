//
//  DifChapters.m
//  StoryBoard-Notes
//
//  Created by Student on 6/22/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "DifChapters.h"
#import "ShuffleNotes.h"

@interface DifChapters()

@property BOOL created;

@end

@implementation DifChapters{
    SKSpriteNode *outline;
    SKSpriteNode *outline2;
    SKSpriteNode *outline3;
    SKSpriteNode *outline4;
}

- (void)didMoveToView: (SKView *) view{
    if (!self.created) {
        [self createSceneContents];
        self.created = YES;
    }
}

- (void)createSceneContents{
    self.backgroundColor = [SKColor grayColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    
    outline = [self outlineNode];
    outline2 = [self outlineNode];
    [outline2 setColor:[SKColor redColor]];
    outline3 = [self outlineNode];
    [outline3 setColor:[SKColor blueColor]];
    outline4 = [self outlineNode];
    [outline4 setColor:[SKColor greenColor]];
    
    SKSpriteNode *pap = [self paperNode];
    pap.position = CGPointMake(CGRectGetMidX(outline.frame), CGRectGetMidY(outline.frame));
    [outline addChild:pap];
    
    SKSpriteNode *pap2 = [self paperNode];
    pap2.position = CGPointMake(CGRectGetMidX(outline2.frame), CGRectGetMidY(outline2.frame));
    [outline2 addChild:pap2];
    
    SKSpriteNode *pap3 = [self paperNode];
    pap3.position = CGPointMake(CGRectGetMidX(outline3.frame), CGRectGetMidY(outline3.frame));
    [outline3 addChild:pap3];
    
    SKSpriteNode *pap4 = [self paperNode];
    pap4.position = CGPointMake(CGRectGetMidX(outline4.frame), CGRectGetMidY(outline4.frame));
    [outline4 addChild:pap4];
    
    //add date
    SKLabelNode *date = [self dateNode];
    date.position = CGPointMake(0,0);
    date.text = @"Chapter 1";
    
    SKTexture *tex = [self.scene.view textureFromNode:outline];
    SKSpriteNode *newNode = [SKSpriteNode spriteNodeWithTexture:tex];
    newNode.name = @"newNode";
    newNode.position = CGPointMake(CGRectGetMidX(self.frame)-200, CGRectGetMidY(self.frame)+150);
    [newNode addChild:date];
    
    SKLabelNode *title = [self dateNode];
    title.position = CGPointMake(0, 0);
    title.text = @"Chapter 2";
    
    SKTexture *tex2 = [self.scene.view textureFromNode:outline2];
    SKSpriteNode *newNode2 = [SKSpriteNode spriteNodeWithTexture:tex2];
    newNode2.name = @"newNode2";
    newNode2.position = CGPointMake(CGRectGetMidX(self.frame)+200, CGRectGetMidY(self.frame)+150);
    [newNode2 addChild:title];
    
    SKLabelNode *title2 = [self dateNode];
    title2.position = CGPointMake(0, 0);
    title2.text = @"Chapter 3";
    
    SKTexture *tex3 = [self.scene.view textureFromNode:outline3];
    SKSpriteNode *newNode3 = [SKSpriteNode spriteNodeWithTexture:tex3];
    newNode3.name = @"newNode3";
    newNode3.position = CGPointMake(CGRectGetMidX(self.frame)-200, CGRectGetMidY(self.frame)-150);
    [newNode3 addChild:title2];
    
    SKLabelNode *title3 = [self dateNode];
    title3.position = CGPointMake(0, 0);
    title3.text = @"Chapter 4";
    
    SKTexture *tex4 = [self.scene.view textureFromNode:outline4];
    SKSpriteNode *newNode4 = [SKSpriteNode spriteNodeWithTexture:tex4];
    newNode4.name = @"newNode4";
    newNode4.position = CGPointMake(CGRectGetMidX(self.frame)+200, CGRectGetMidY(self.frame)-150);
    [newNode4 addChild:title3] ;
    
    [self addChild:newNode];
    [self addChild:newNode2];
    [self addChild:newNode3];
    [self addChild:newNode4];
}

#pragma mark

- (SKSpriteNode *)paperNode{
    SKSpriteNode *paper = [[SKSpriteNode alloc] initWithColor:[SKColor whiteColor] size:CGSizeMake(300, 200)];
    paper.name = @"paper";
    
    return paper;
}

#pragma mark

- (SKSpriteNode *)outlineNode{
    SKSpriteNode *outliney = [[SKSpriteNode alloc] initWithColor:[SKColor blackColor] size:CGSizeMake(325, 225)];
    outliney.name = @"outline";
    
    return outliney;
}

#pragma mark

- (SKLabelNode *)dateNode{
    SKLabelNode *date = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    date.name = @"folder";
    date.fontSize = 20;
    date.fontColor = [SKColor blackColor];
    return date;
}

#pragma mark

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for(UITouch *touch in touches){
        CGPoint location = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:location];
        if([node.name isEqualToString:@"newNode"] || [node.name isEqualToString:@"folder"]){
            ShuffleNotes *nn = [[ShuffleNotes alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:nn transition:doors];
        }
        if([node.name isEqualToString:@"newNode2"] || [node.name isEqualToString:@"folder"]){
            ShuffleNotes *nn = [[ShuffleNotes alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:nn transition:doors];
        }
        if([node.name isEqualToString:@"newNode3"] || [node.name isEqualToString:@"folder"]){
            ShuffleNotes *nn = [[ShuffleNotes alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:nn transition:doors];
        }
        if([node.name isEqualToString:@"newNode4"] || [node.name isEqualToString:@"folder"]){
            ShuffleNotes *nn = [[ShuffleNotes alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:nn transition:doors];
        }
    }
}


@end
