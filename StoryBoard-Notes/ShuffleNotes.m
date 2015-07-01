//
//  ShuffleNotes.m
//  StoryBoard-Notes
//  Section 1 View - Red
//  Created by Kimberly Sookoo on 6/16/15.
//  Copyright (c) 2015 Kimberly Sookoo. All rights reserved.
//

#import "ShuffleNotes.h"
#import "NotesSection.h"
#import "ENHGlowFilter.h"

@interface ShuffleNotes()

@property BOOL created;

@property BOOL tappedTwice;

@property SKSpriteNode *activeDragNode;

@end

@implementation ShuffleNotes{
    SKSpriteNode *outline;
    SKSpriteNode *outline1;
    SKSpriteNode *outline2;
    SKSpriteNode *outline3;
    SKTexture *tex;
    SKEffectNode *effectNode;
}

static const int outline1Category = 1;
static const int outline2Category = 2;
static const int outline3Category = 3;

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        //sets up physicsWorld delegate
        self.physicsWorld.contactDelegate = self;
        
        //sets up glow effect on node
        [self setAnchorPoint:(CGPoint){0.5, 0.5}];
        self.backgroundColor = [SKColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        
        effectNode = [[SKEffectNode alloc] init];
        ENHGlowFilter *glowFilter = [[ENHGlowFilter alloc] init];
        [glowFilter setGlowColor:[[UIColor whiteColor] colorWithAlphaComponent:0.5]];
        [effectNode setShouldRasterize:YES];
        [effectNode setFilter:glowFilter];
        effectNode.name = @"newNode";
        
    }
    return self;
}

- (void)didMoveToView: (SKView *) view{
    if (!self.created) {
        [self createSceneContents];
        self.created = YES;
    }
}

//create SKScene
- (void)createSceneContents{
    self.backgroundColor = [SKColor darkGrayColor];
    self.scaleMode = SKSceneScaleModeFill;
    
    outline1 = [self outlineNode];
    outline2 = [self outlineNode];
    outline3 = [self outlineNode];
    
    SKSpriteNode *pap = [self paperNode];
    pap.position = CGPointMake(CGRectGetMidX(outline1.frame), CGRectGetMidY(outline1.frame));
    [outline1 addChild:pap];
    
    //add date
    SKLabelNode *date = [self dateNode];
    date.position = CGPointMake(-100, 67);
    
    [effectNode addChild:outline1];
    tex = [self.scene.view textureFromNode:effectNode];
    SKSpriteNode *newNode = [SKSpriteNode spriteNodeWithTexture:tex];
    newNode.name = @"newNode";
    newNode.position = CGPointMake(CGRectGetMidX(self.frame)-200, CGRectGetMidY(self.frame)+250);
    [newNode addChild:date];
    
    SKSpriteNode *paper = [self paperNode];
    paper.position = CGPointMake(CGRectGetMidX(outline2.frame), CGRectGetMidY(outline2.frame));
    [outline2 addChild:paper];
    
    SKTexture *tex2 = [self.scene.view textureFromNode:outline2];
    SKSpriteNode *newNode2 = [SKSpriteNode spriteNodeWithTexture:tex2];
    newNode2.name = @"newNode2";
    newNode2.position = CGPointMake(CGRectGetMidX(self.frame)-195, CGRectGetMidY(self.frame)+240);
    //[newNode2 addChild:effectNode];
    
    SKSpriteNode *paper2 = [self paperNode];
    paper2.position = CGPointMake(CGRectGetMidX(outline3.frame), CGRectGetMidY(outline3.frame));
    [outline3 addChild:paper2];
    
    SKTexture *tex3 = [self.scene.view textureFromNode:outline3];
    SKSpriteNode *newNode3 = [SKSpriteNode spriteNodeWithTexture:tex3];
    newNode3.name = @"newNode3";
    newNode3.position = CGPointMake(CGRectGetMidX(self.frame)-190, CGRectGetMidY(self.frame)+230);
    //[newNode3 addChild:effectNode];
    
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

//determines if physics bodies made contact
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

- (SKSpriteNode *)paperNode{
    SKSpriteNode *paper = [[SKSpriteNode alloc] initWithColor:[SKColor redColor] size:CGSizeMake(300, 200)];
    paper.name = @"paper";
    _activeDragNode = nil;
    
    return paper;
}

#pragma mark

- (SKSpriteNode *)outlineNode{
    outline = [[SKSpriteNode alloc] initWithColor:[SKColor blackColor] size:CGSizeMake(325, 225)];
    outline.name = @"outline";
    
    return outline;
}

#pragma mark

- (SKLabelNode *)dateNode{
    SKLabelNode *date = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    date.name = @"date";
    date.text = @"Date: ";
    date.fontSize = 35;
    date.fontColor = [SKColor whiteColor];
    return date;
}

//papers are both draggable and clickable; the glow effect is continuous in this view, but the radius of the glow poses a problem for the textures
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    _tappedTwice = NO;
    UITouch *touch = [touches anyObject];
    CGPoint scenePosition = [touch locationInNode:self];
    
    SKNode *checkNode = [self nodeAtPoint:scenePosition];
    
    if(checkNode && ([checkNode.name hasPrefix:@"newNode"] || [checkNode.name hasPrefix:@"newNode2"] || [checkNode.name hasPrefix:@"newNode3"])){
        if([touch tapCount] == 2){
            _tappedTwice = YES;
            NotesSection *nn = [[NotesSection alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:nn transition:doors];
        }
        else if([touch tapCount] == 1 && !_tappedTwice){
            _activeDragNode = (SKSpriteNode *)checkNode;
            [checkNode removeFromParent];
            [self addChild:checkNode];
        }
    }
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
