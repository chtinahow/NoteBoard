//
//  CalculusNotes.m
//  Notes
//
//  Created by Student on 6/10/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "CalculusNotes.h"
#import "notes.h"

@interface CalculusNotes()

@property BOOL created;

@property SKSpriteNode *activeDragNode;

@property SKSpriteNode *outlineDragNode;

@end

@implementation CalculusNotes

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
    
    SKSpriteNode *outline = [self outlineNode];
    SKSpriteNode *outline2 = [self outlineNode];
    SKSpriteNode *outline3 = [self outlineNode];
    
    SKSpriteNode *pap = [self paperNode];
    pap.position = CGPointMake(CGRectGetMidX(outline.frame), CGRectGetMidY(outline.frame));
    [outline addChild:pap];
    
    //add date
    SKLabelNode *date = [self dateNode];
    date.position = CGPointMake(-180, 235);
    
    SKTexture *tex = [self.scene.view textureFromNode:outline];
    SKSpriteNode *newNode = [SKSpriteNode spriteNodeWithTexture:tex];
    newNode.name = @"newNode";
    newNode.position = CGPointMake(CGRectGetMidX(self.frame)-150, CGRectGetMidY(self.frame)+150);
    [newNode addChild:date];
    
    SKSpriteNode *paper = [self paperNode2];
    paper.position = CGPointMake(CGRectGetMidX(outline2.frame), CGRectGetMidY(outline2.frame));
    [outline2 addChild:paper];
    
    SKTexture *tex2 = [self.scene.view textureFromNode:outline2];
    SKSpriteNode *newNode2 = [SKSpriteNode spriteNodeWithTexture:tex2];
    newNode2.name = @"newNode2";
    newNode2.position = CGPointMake(CGRectGetMidX(self.frame)-75, CGRectGetMidY(self.frame)+75);
    
    SKSpriteNode *paper2 = [self paperNode2];
    paper2.position = CGPointMake(CGRectGetMidX(outline3.frame), CGRectGetMidY(outline3.frame));
    [outline3 addChild:paper2];
    
    SKTexture *tex3 = [self.scene.view textureFromNode:outline3];
    SKSpriteNode *newNode3 = [SKSpriteNode spriteNodeWithTexture:tex3];
    newNode3.name = @"newNode3";
    newNode3.position = CGPointMake(CGRectGetMidX(self.frame)+150, CGRectGetMidY(self.frame)-200);
    
    [self addChild:newNode3];
    
    [self addChild:newNode2];
    
    [self addChild:newNode];
}

#pragma mark

- (SKSpriteNode *)paperNode{
    SKSpriteNode *paper = [[SKSpriteNode alloc] initWithColor:[SKColor whiteColor] size:CGSizeMake(400, 500)];
    paper.name = @"paper";
    _activeDragNode = nil;
    
    return paper;
}

#pragma mark

//papers that are not currently clickable
- (SKSpriteNode *)paperNode2{
    SKSpriteNode *paper = [[SKSpriteNode alloc] initWithColor:[SKColor whiteColor] size:CGSizeMake(400, 500)];
    
    return paper;
}

- (SKSpriteNode *)outlineNode{
    SKSpriteNode *outline = [[SKSpriteNode alloc] initWithColor:[SKColor blackColor] size:CGSizeMake(425, 525)];
    outline.name = @"outline";
    
    return outline;
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


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    CGPoint scenePosition = [touch locationInNode:self];
    
    SKNode *checkNode = [self nodeAtPoint:scenePosition];
    
    if(checkNode && ([checkNode.name hasPrefix:@"newNode"] || [checkNode.name hasPrefix:@"newNode2"] || [checkNode.name hasPrefix:@"newNode3"])){
        _activeDragNode = (SKSpriteNode *)checkNode;
    }
    
    /*for(UITouch *touch in touches){
        CGPoint location = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:location];
        
        if([node.name isEqualToString:@"paper"]){
            notes *nn = [[notes alloc] initWithSize:CGSizeMake(768, 1024)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:nn transition:doors];

            
        }
    }*/
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if(_activeDragNode != nil){
        UITouch *touch = [touches anyObject];
        CGPoint scenePosition = [touch locationInNode:self];
        CGPoint lastPos = [touch previousLocationInNode:self];
    
        CGPoint newLoc = CGPointMake(_activeDragNode.position.x + (scenePosition.x - lastPos.x), _activeDragNode.position.y + (scenePosition.y - lastPos.y));
    
        _activeDragNode.position = newLoc;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    _activeDragNode = nil;
}

@end
