//
//  LandScapeCalcNotes.m
//  LandScapeV2
//
//  Created by Student on 6/16/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "LandScapeCalcNotes.h"
#import "ViewController.h"

@interface LandScapeCalcNotes()

@property BOOL created;

@property BOOL tappedTwice;

@property SKSpriteNode *activeDragNode;

@property SKSpriteNode *outlineDragNode;


@end

static const int outline1Category = 1;
static const int outline2Category = 2;
static const int outline3Category = 3;

@implementation LandScapeCalcNotes

- (void)didMoveToView: (SKView *) view
{
    if (!self.created) {
        [self createSceneContents];
        self.created = YES;
    }
}

//Note! We need to give the papers outlines in this portion or it'll look like a deformed paper monster!
//Also, I made the papers that we won't be clicking red just to be able to tell the difference for now.
- (void)createSceneContents
{
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
    date.position = CGPointMake(-130, 80);
    
    SKTexture *tex = [self.scene.view textureFromNode:outline];
    SKSpriteNode *newNode = [SKSpriteNode spriteNodeWithTexture:tex];
    newNode.name = @"newNode";
    newNode.position = CGPointMake(CGRectGetMidX(self.frame)-150, CGRectGetMidY(self.frame)+150);
    [newNode addChild:date];
    
    SKSpriteNode *paper = [self paperNode];
    paper.position = CGPointMake(CGRectGetMidX(outline2.frame), CGRectGetMidY(outline2.frame));
    [outline2 addChild:paper];
    
    SKTexture *tex2 = [self.scene.view textureFromNode:outline2];
    SKSpriteNode *newNode2 = [SKSpriteNode spriteNodeWithTexture:tex2];
    newNode2.name = @"newNode2";
    newNode2.position = CGPointMake(CGRectGetMidX(self.frame)-75, CGRectGetMidY(self.frame)+75);
    
    SKSpriteNode *paper2 = [self paperNode];
    paper2.position = CGPointMake(CGRectGetMidX(outline3.frame), CGRectGetMidY(outline3.frame));
    [outline3 addChild:paper2];
    
    SKTexture *tex3 = [self.scene.view textureFromNode:outline3];
    SKSpriteNode *newNode3 = [SKSpriteNode spriteNodeWithTexture:tex3];
    newNode3.name = @"newNode3";
    newNode3.position = CGPointMake(CGRectGetMidX(self.frame)+150, CGRectGetMidY(self.frame)-200);
    
    //newNode1 physics body
    newNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(20, 20)];
    newNode.physicsBody.categoryBitMask = outline1Category;
    newNode.physicsBody.contactTestBitMask = outline2Category | outline3Category;
    newNode.physicsBody.collisionBitMask = outline2Category | outline3Category;
    newNode.physicsBody.affectedByGravity = NO;
    newNode.physicsBody.allowsRotation = NO;
    
    //newNode2 physics body
    newNode2.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(20, 20)];
    newNode2.physicsBody.categoryBitMask = outline2Category;
    newNode2.physicsBody.contactTestBitMask = outline1Category | outline3Category;
    newNode2.physicsBody.collisionBitMask = outline1Category | outline3Category;
    newNode2.physicsBody.affectedByGravity = NO;
    newNode2.physicsBody.allowsRotation = NO;
    
    //newNode3
    newNode3.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(20, 20)];
    newNode3.physicsBody.categoryBitMask = outline3Category;
    newNode3.physicsBody.contactTestBitMask = outline2Category | outline1Category;
    newNode3.physicsBody.collisionBitMask = outline2Category | outline1Category;
    newNode3.physicsBody.affectedByGravity = NO;
    newNode3.physicsBody.allowsRotation = NO;
    
    [self addChild:newNode3];
    
    [self addChild:newNode2];
    
    [self addChild:newNode];
}

-(void)didBeginContact:(SKPhysicsContact *)contact
{
    SKPhysicsBody *firstBody, *secondBody;
    
    firstBody = contact.bodyA;
    secondBody = contact.bodyB;
    
    if((firstBody.categoryBitMask == (outline2Category | outline3Category)) || (secondBody.categoryBitMask == (outline2Category | outline3Category)))
    {
        
    }
}

#pragma mark

- (SKSpriteNode *)paperNode
{
    SKSpriteNode *paper = [[SKSpriteNode alloc] initWithColor:[SKColor redColor] size:CGSizeMake(300, 200)];
    paper.name = @"paper";
    _activeDragNode = nil;
    
    return paper;
}

#pragma mark

//papers that are not currently clickable
- (SKSpriteNode *)paperNode2
{
    SKSpriteNode *paper = [[SKSpriteNode alloc] initWithColor:[SKColor whiteColor] size:CGSizeMake(300, 200)];
    
    return paper;
}

- (SKSpriteNode *)outlineNode
{
    SKSpriteNode *outline = [[SKSpriteNode alloc] initWithColor:[SKColor blackColor] size:CGSizeMake(325, 225)];
    outline.name = @"outline";
    
    return outline;
}

#pragma mark

- (SKLabelNode *)dateNode
{
    SKLabelNode *date = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    date.name = @"date";
    date.text = @"Date: ";
    date.fontSize = 15;
    date.fontColor = [SKColor blackColor];
    return date;
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    _tappedTwice = NO;
    UITouch *touch = [touches anyObject];
    
    CGPoint scenePosition = [touch locationInNode:self];
    
    SKNode *checkNode = [self nodeAtPoint:scenePosition];
    
    if(checkNode && ([checkNode.name hasPrefix:@"newNode"] || [checkNode.name hasPrefix:@"newNode2"] || [checkNode.name hasPrefix:@"newNode3"])){
        if([touch tapCount] == 2){
            _tappedTwice = YES;
            //notifier to go to Notes Section
            [[NSNotificationCenter defaultCenter] postNotificationName:@"gotoNotes" object:nil];
            
        } else if([touch tapCount] == 1 && !_tappedTwice) {
            _activeDragNode = (SKSpriteNode *)checkNode;
            [checkNode removeFromParent];
            [self addChild:checkNode];
        }
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(_activeDragNode != nil){
        UITouch *touch = [touches anyObject];
        CGPoint scenePosition = [touch locationInNode:self];
        CGPoint lastPos = [touch previousLocationInNode:self];
        
        CGPoint newLoc = CGPointMake(_activeDragNode.position.x + (scenePosition.x - lastPos.x), _activeDragNode.position.y + (scenePosition.y - lastPos.y));
        
        _activeDragNode.position = newLoc;
    }
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    _activeDragNode = nil;
}

@end


