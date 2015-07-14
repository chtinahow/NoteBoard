//
//  Stacked Notes.m
//  StoryBoard-Notes
//
//  Stacked Notes represent different topics in each chapter; clickable but not stackable
//  Created by Kimberly Sookoo on 6/23/15.
//  Copyright (c) 2015 Kimberly Sookoo. All rights reserved.
//

#import "Stacked Notes.h"
#import "ShuffleNotes.h"
#import "ShuffleNotesBlue.h"
#import "ShuffleNotesGreen.h"
#import "MoreShuffle.h"

@interface Stacked_Notes()

@property BOOL created;

@end

@implementation Stacked_Notes{
    //borders for paper nodes
    SKSpriteNode *outline;
    SKSpriteNode *outline1;
    SKSpriteNode *outline2;
    SKSpriteNode *outline3;
    SKSpriteNode *outline4;
    SKSpriteNode *outline5;
    SKSpriteNode *outline6;
    SKSpriteNode *outline7;
    SKSpriteNode *outline8;
    SKSpriteNode *outline9;
    
    SKSpriteNode *changeText;
}

- (void)didMoveToView: (SKView *) view{
    if (!self.created) {
        [self createSceneContents];
        self.created = YES;
    }
}

//Textures help with merging the border and paper nodes into one object
- (void)createSceneContents{
    self.backgroundColor = [SKColor grayColor];
    self.scaleMode = SKSceneScaleModeFill;
    
    //stack 1
    outline1 = [self outlineNode];
    outline2 = [self outlineNode];
    outline3 = [self outlineNode];
    
    SKSpriteNode *pap = [self paperNode];
    pap.position = CGPointMake(CGRectGetMidX(outline1.frame), CGRectGetMidY(outline1.frame));
    [outline1 addChild:pap];
    
    //add text
    SKLabelNode *text1 = [self textNode];
    text1.text = @"Section 1";
    
    SKTexture *tex = [self.scene.view textureFromNode:outline1];
    SKSpriteNode *newNode = [SKSpriteNode spriteNodeWithTexture:tex];
    newNode.name = @"red";
    newNode.position = CGPointMake(CGRectGetMidX(self.frame)-300, CGRectGetMidY(self.frame)+250);
    [newNode addChild:text1];
    
    
    SKSpriteNode *paper = [self paperNode];
    paper.position = CGPointMake(CGRectGetMidX(outline2.frame), CGRectGetMidY(outline2.frame));
    [outline2 addChild:paper];
    
    SKTexture *tex2 = [self.scene.view textureFromNode:outline2];
    SKSpriteNode *newNode2 = [SKSpriteNode spriteNodeWithTexture:tex2];
    newNode2.position = CGPointMake(CGRectGetMidX(self.frame)-295, CGRectGetMidY(self.frame)+240);
    
    SKSpriteNode *paper2 = [self paperNode];
    paper2.position = CGPointMake(CGRectGetMidX(outline3.frame), CGRectGetMidY(outline3.frame));
    [outline3 addChild:paper2];
    
    SKTexture *tex3 = [self.scene.view textureFromNode:outline3];
    SKSpriteNode *newNode3 = [SKSpriteNode spriteNodeWithTexture:tex3];
    newNode3.position = CGPointMake(CGRectGetMidX(self.frame)-290, CGRectGetMidY(self.frame)+230);
    
    [self addChild:newNode3];
    
    [self addChild:newNode2];
    
    [self addChild:newNode];
    
    //stack 2
    outline4 = [self outlineNode];
    outline5 = [self outlineNode];
    outline6 = [self outlineNode];
    
    SKLabelNode *text2 = [self textNode];
    text2.text = @"Section 2";
    
    SKSpriteNode *pap2 = [self paperNode2];
    pap.position = CGPointMake(CGRectGetMidX(outline4.frame), CGRectGetMidY(outline4.frame));
    [outline4 addChild:pap2];
    
    SKTexture *tex4 = [self.scene.view textureFromNode:outline4];
    SKSpriteNode *newNode4 = [SKSpriteNode spriteNodeWithTexture:tex4];
    newNode4.name = @"blue";
    newNode4.position = CGPointMake(CGRectGetMidX(self.frame)+300, CGRectGetMidY(self.frame)+250);
    [newNode4 addChild:text2];
    
    SKSpriteNode *paper3 = [self paperNode2];
    paper3.position = CGPointMake(CGRectGetMidX(outline5.frame), CGRectGetMidY(outline5.frame));
    [outline5 addChild:paper3];
    
    SKTexture *tex5 = [self.scene.view textureFromNode:outline5];
    SKSpriteNode *newNode5 = [SKSpriteNode spriteNodeWithTexture:tex5];
    newNode5.position = CGPointMake(CGRectGetMidX(self.frame)+305, CGRectGetMidY(self.frame)+240);
    
    SKSpriteNode *paper4 = [self paperNode2];
    paper4.position = CGPointMake(CGRectGetMidX(outline6.frame), CGRectGetMidY(outline6.frame));
    [outline6 addChild:paper4];
    
    SKTexture *tex6 = [self.scene.view textureFromNode:outline6];
    SKSpriteNode *newNode6 = [SKSpriteNode spriteNodeWithTexture:tex6];
    newNode6.position = CGPointMake(CGRectGetMidX(self.frame)+310, CGRectGetMidY(self.frame)+230);
    
    [self addChild:newNode6];
    
    [self addChild:newNode5];
    
    [self addChild:newNode4];
    
    //stack 3
    outline7 = [self outlineNode];
    outline8 = [self outlineNode];
    outline9 = [self outlineNode];
    
    SKLabelNode *text3 = [self textNode];
    text3.text = @"Section 3";
    
    SKSpriteNode *pap3 = [self paperNode3];
    pap.position = CGPointMake(CGRectGetMidX(outline7.frame), CGRectGetMidY(outline7.frame));
    [outline7 addChild:pap3];
    
    SKTexture *tex7 = [self.scene.view textureFromNode:outline7];
    SKSpriteNode *newNode7 = [SKSpriteNode spriteNodeWithTexture:tex7];
    newNode7.name = @"green";
    newNode7.position = CGPointMake(CGRectGetMidX(self.frame)-300, CGRectGetMidY(self.frame)-200);
    [newNode7 addChild:text3];
    
    SKSpriteNode *paper5 = [self paperNode3];
    paper3.position = CGPointMake(CGRectGetMidX(outline8.frame), CGRectGetMidY(outline8.frame));
    [outline8 addChild:paper5];
    
    SKTexture *tex8 = [self.scene.view textureFromNode:outline8];
    SKSpriteNode *newNode8 = [SKSpriteNode spriteNodeWithTexture:tex8];
    newNode8.position = CGPointMake(CGRectGetMidX(self.frame)-295, CGRectGetMidY(self.frame)-210);
    
    SKSpriteNode *paper6 = [self paperNode3];
    paper4.position = CGPointMake(CGRectGetMidX(outline9.frame), CGRectGetMidY(outline9.frame));
    [outline9 addChild:paper6];
    
    SKTexture *tex9 = [self.scene.view textureFromNode:outline9];
    SKSpriteNode *newNode9 = [SKSpriteNode spriteNodeWithTexture:tex9];
    newNode9.position = CGPointMake(CGRectGetMidX(self.frame)-290, CGRectGetMidY(self.frame)-220);
    
    [self addChild:newNode9];
    
    [self addChild:newNode8];
    
    [self addChild:newNode7];
    
    //Change the color of the text
    SKSpriteNode *color1 = [[SKSpriteNode alloc] initWithColor:[SKColor blackColor] size:CGSizeMake(30, 30)];
    color1.position = CGPointMake(-60, 0);
    color1.name = @"color1";
    
    SKSpriteNode *color2 = [[SKSpriteNode alloc] initWithColor:[SKColor darkGrayColor] size:CGSizeMake(30, 30)];
    color2.position = CGPointMake(-30, 0);
    color2.name = @"color2";
    
    SKSpriteNode *color3 = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(30, 30)];
    color3.position = CGPointMake(0, 0);
    color3.name = @"color3";
    
    SKSpriteNode *color4 = [[SKSpriteNode alloc] initWithColor:[SKColor lightGrayColor] size:CGSizeMake(30, 30)];
    color4.position = CGPointMake(30, 0);
    color4.name = @"color4";
    
    SKSpriteNode *color5 = [[SKSpriteNode alloc] initWithColor:[SKColor whiteColor] size:CGSizeMake(30, 30)];
    color5.position = CGPointMake(60, 0);
    color5.name = @"color5";
    
    changeText = [[SKSpriteNode alloc] initWithColor:[SKColor blueColor] size:CGSizeMake(153, 33)];
    changeText.position = CGPointMake(850, 30);
    [changeText addChild:color1];
    [changeText addChild:color2];
    [changeText addChild:color3];
    [changeText addChild:color4];
    [changeText addChild:color5];
    [self addChild:changeText];
}

#pragma mark

- (SKSpriteNode *)paperNode{
    SKSpriteNode *paper = [[SKSpriteNode alloc] initWithColor:[SKColor redColor] size:CGSizeMake(300, 200)];
    paper.name = @"paper";
    
    return paper;
}

- (SKSpriteNode *)paperNode2{
    SKSpriteNode *paper = [[SKSpriteNode alloc] initWithColor:[SKColor blueColor] size:CGSizeMake(300, 200)];
    paper.name = @"paper";
    
    return paper;
}

- (SKSpriteNode *)paperNode3{
    SKSpriteNode *paper = [[SKSpriteNode alloc] initWithColor:[SKColor greenColor] size:CGSizeMake(300, 200)];
    paper.name = @"paper";
    
    return paper;
}

#pragma mark

- (SKSpriteNode *)outlineNode{
    outline = [[SKSpriteNode alloc] initWithColor:[SKColor blackColor] size:CGSizeMake(325, 225)];
    outline.name = @"outline";
    
    return outline;
}

#pragma mark

- (SKLabelNode *)textNode{
    SKLabelNode *text = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    text.name = @"text";
    text.fontSize = 40;
    text.fontColor = [SKColor whiteColor];
    return text;
}

//sends me to shuffle notes
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint scenePosition = [touch locationInNode:self];
    
    SKNode *checkNode = [self nodeAtPoint:scenePosition];
    
    if(checkNode && [checkNode.name hasPrefix:@"red"]){
        if([touch tapCount] == 2){
            ShuffleNotes *ss = [[ShuffleNotes alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:ss transition:doors];
        }
    }
    else if(checkNode && [checkNode.name hasPrefix:@"blue"]){
        if([touch tapCount] == 2){
            ShuffleNotesBlue *ss = [[ShuffleNotesBlue alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:ss transition:doors];
        }
    }
    else if(checkNode && [checkNode.name hasPrefix:@"green"]){
        if([touch tapCount] == 2){
            /*ShuffleNotesGreen *ss = [[ShuffleNotesGreen alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:ss transition:doors];*/
            
            MoreShuffle *stack = [[MoreShuffle alloc] initWithSize:CGSizeMake(2000, 1768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:stack transition:doors];
        }
    }
    else if (checkNode && [checkNode.name hasPrefix:@"color"]){
        for(SKNode *check in self.children){
            if([check.name isEqualToString:@"red"] || [check.name isEqualToString:@"blue"] || [check.name isEqualToString:@"green"]){
                for(SKLabelNode *label in check.children){
                    if([checkNode.name isEqualToString:@"color1"]){
                        label.fontColor = [SKColor blackColor];
                    }
                    if([checkNode.name isEqualToString:@"color2"]){
                        label.fontColor = [SKColor darkGrayColor];
                    }
                    if([checkNode.name isEqualToString:@"color3"]){
                        label.fontColor = [SKColor grayColor];
                    }
                    if([checkNode.name isEqualToString:@"color4"]){
                        label.fontColor = [SKColor lightGrayColor];
                    }
                    if([checkNode.name isEqualToString:@"color5"]){
                        label.fontColor = [SKColor whiteColor];
                    }
                }
            }
        }
    }
}
@end
