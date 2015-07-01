//
//  ShuffleNotes.m
//  StoryBoard-Notes
//  Section 3 View - Green
//  Created by Kimberly Sookoo on 6/16/15.
//  Copyright (c) 2015 Kimberly Sookoo. All rights reserved.
//

#import "ShuffleNotesGreen.h"
#import "NotesSection.h"

@interface ShuffleNotesGreen()

@property BOOL created;

@property BOOL tappedTwice;

@property SKSpriteNode *activeDragNode;

@property BOOL didChange;

@end

@implementation ShuffleNotesGreen{
    SKSpriteNode *outline;
    SKSpriteNode *outline1;
    SKSpriteNode *outline2;
    SKSpriteNode *outline3;
    SKSpriteNode *newNode;
    SKSpriteNode *newNode2;
    SKSpriteNode *newNode3;
    
    SKSpriteNode *backButton;
    SKSpriteNode *opt;
    
    SKSpriteNode *image;
    SKSpriteNode *image2;
    SKSpriteNode *image3;
    
    //UIView section
    UIView *viewy;
    UIButton *image1;
}

static const int outline1Category = 1;
static const int outline2Category = 2;
static const int outline3Category = 3;

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        viewy = [[UIView alloc] initWithFrame:CGRectMake(500, 50, 200, 700)];
        viewy.backgroundColor = [UIColor blueColor];
    }
    
    return self;
}

- (void)didMoveToView: (SKView *) view{
    if (!self.created) {
        [self createSceneContents];
        self.created = YES;
    }
}

- (void)willMoveFromView:(SKView *)view{
    [super willMoveFromView:view];
    [viewy removeFromSuperview];
}

//Creates the SKScene
- (void)createSceneContents{
    self.backgroundColor = [SKColor grayColor];
    self.scaleMode = SKSceneScaleModeFill;
    
    outline1 = [self outlineNode];
    outline2 = [self outlineNode];
    outline3 = [self outlineNode];
    
    SKSpriteNode *pap = [self paperNode];
    pap.position = CGPointMake(CGRectGetMidX(outline1.frame), CGRectGetMidY(outline1.frame));
    [outline1 addChild:pap];
    
    //add date
    SKLabelNode *date = [self dateNode];
    date.position = CGPointMake(-105, 70);
    
    //creates images and places uibuttons on them to make them clickable.
    image2 = [SKSpriteNode spriteNodeWithImageNamed:@"IS787-189.jpg"];
    image2.size = CGSizeMake(100, 50);
    image2.position = CGPointMake(0, 0);
    image2.name = @"image2";
    
    image3 = [SKSpriteNode spriteNodeWithImageNamed:@"IS787-191.jpg"];
    image3.size = CGSizeMake(100, 50);
    image3.position = CGPointMake(0, -100);
    image3.name = @"image3";
    
    SKTexture *tex = [self.scene.view textureFromNode:outline1];
    newNode = [SKSpriteNode spriteNodeWithTexture:tex];
    newNode.name = @"newNode";
    newNode.position = CGPointMake(CGRectGetMidX(self.frame)-200, CGRectGetMidY(self.frame)+250);
    [newNode addChild:date];
    
    SKSpriteNode *paper = [self paperNode];
    paper.position = CGPointMake(CGRectGetMidX(outline2.frame), CGRectGetMidY(outline2.frame));
    [outline2 addChild:paper];
    
    SKTexture *tex2 = [self.scene.view textureFromNode:outline2];
    newNode2 = [SKSpriteNode spriteNodeWithTexture:tex2];
    newNode2.name = @"newNode2";
    newNode2.position = CGPointMake(CGRectGetMidX(self.frame)-195, CGRectGetMidY(self.frame)+240);
    
    SKSpriteNode *paper2 = [self paperNode];
    paper2.position = CGPointMake(CGRectGetMidX(outline3.frame), CGRectGetMidY(outline3.frame));
    [outline3 addChild:paper2];
    
    SKTexture *tex3 = [self.scene.view textureFromNode:outline3];
    newNode3 = [SKSpriteNode spriteNodeWithTexture:tex3];
    newNode3.name = @"newNode3";
    newNode3.position = CGPointMake(CGRectGetMidX(self.frame)-190, CGRectGetMidY(self.frame)+230);
    
    SKSpriteNode *background = [self backGroundColor];
    SKLabelNode *bText = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    bText.text = @"+";
    bText.fontColor = [SKColor whiteColor];
    bText.fontSize = 20;
    bText.position = CGPointMake(0, -8);
    [background addChild:bText];
    SKTexture *tex4 = [self.scene.view textureFromNode:background];
    backButton = [SKSpriteNode spriteNodeWithTexture:tex4];
    backButton.name = @"Background";
    backButton.position = CGPointMake(112, -90);
    
    //[newNode3 addChild:backButton];
    //[newNode2 addChild:backButton];
    [newNode addChild:backButton];
    
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
    
    if((firstBody.categoryBitMask == (outline2Category | outline3Category)) || (secondBody.categoryBitMask == (outline2Category | outline3Category))){
    }
}

#pragma mark

- (SKSpriteNode *)paperNode{
    SKSpriteNode *paper = [[SKSpriteNode alloc] initWithColor:[SKColor greenColor] size:CGSizeMake(300, 200)];
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

#pragma mark
//creates the button that links to the available background images.
-(SKSpriteNode *)backGroundColor{
    SKSpriteNode *bc = [[SKSpriteNode alloc] initWithColor:[SKColor blueColor] size:CGSizeMake(75, 30)];
    
    return bc;
}

-(SKSpriteNode *)optionsView{
    SKSpriteNode *opt2 = [[SKSpriteNode alloc] initWithColor:[SKColor blackColor] size:CGSizeMake(200, self.frame.size.height+2)];
    opt2.position = CGPointMake(950, 383);
    return opt2;
}

//in this section, the nodes' backgrounds will be able to by customized by the students using Access Math
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //SKSpriteNode *layer;
    _tappedTwice = NO;
    UITouch *touch = [touches anyObject];
    CGPoint scenePosition = [touch locationInNode:self];
    
    SKNode *checkNode = [self nodeAtPoint:scenePosition];
    
    if(checkNode && ([checkNode.name hasPrefix:@"newNode"])){
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
    else if(checkNode && ([checkNode.name hasPrefix:@"Background"])){
        /*layer = [[SKSpriteNode alloc] initWithColor:[SKColor clearColor] size:CGSizeMake(checkNode.frame.size.width, checkNode.frame.size.height)];
        [checkNode addChild:layer];*/
        checkNode.userInteractionEnabled = NO;
        opt = [self optionsView];
        [opt addChild:image2];
        [opt addChild:image3];
        
        SKSpriteNode *less = [self backGroundColor];
        SKLabelNode *bText = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
        bText.text = @"-";
        bText.fontColor = [SKColor whiteColor];
        bText.fontSize = 20;
        bText.position = CGPointMake(0, -5);
        [less addChild:bText];
        SKTexture *texLess = [self.scene.view textureFromNode:less];
        SKSpriteNode *lessN = [SKSpriteNode spriteNodeWithTexture:texLess];
        lessN.position = CGPointMake(30, -365);
        lessN.name = @"lessN";
        
        [opt addChild:lessN];
        [self addChild:opt];
    }
    //finally! code to get background image changed!
    else if(checkNode && ([checkNode.name hasPrefix:@"image"])){
        SKTexture *tex = [self.scene.view textureFromNode:checkNode];
        SKAction* changeFace = [SKAction setTexture:tex];
        for(SKNode *check in self.children){
            if([check.name hasPrefix:@"newNode"]){
                [self runAction:changeFace];
                [check runAction:changeFace];
            }
        }
    }
    else if(checkNode && ([checkNode.name isEqualToString:@"lessN"])){
        [opt removeFromParent];
        for(SKNode *check in self.children){
            if([check.name hasPrefix:@"Background"]){
                check.userInteractionEnabled = YES;
            }
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
