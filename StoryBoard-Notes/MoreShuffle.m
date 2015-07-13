//
//  MoreShuffle.m
//  StoryBoard-Notes
//
//  Created by Student on 7/10/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "MoreShuffle.h"
#import "NotesSection.h"
#import "saveData.h"

@interface MoreShuffle()

@property BOOL created; //checks to see if scene is created

@property BOOL tappedTwice; //checks to see is node is tapped twice

@property SKSpriteNode *activeDragNode; //sets the node to be dragged

@end

@implementation MoreShuffle{
    //black outlines for the nodes
    SKSpriteNode *outline;
    SKSpriteNode *outline1;
    SKSpriteNode *outline2;
    SKSpriteNode *outline3;
    
    //the nodes themselves
    SKSpriteNode *newNode;
    SKSpriteNode *newNode2;
    SKSpriteNode *newNode3;
    
    //button to expand the backgrounds for nodes
    SKSpriteNode *backButton;
    SKSpriteNode *opt;
    
    //background images
    SKSpriteNode *image;
    SKSpriteNode *image2;
    SKSpriteNode *image3;
    SKSpriteNode *image4;
    SKSpriteNode *image5;
    SKSpriteNode *image6;
    SKSpriteNode *image7;
    SKSpriteNode *image8;
    
    //arrow to traverse pages
    SKSpriteNode *arrow;
    
    //changes color of text
    SKSpriteNode *changeText;
    
    //Save Button
    UIButton *save;
    
    //stack button
    UIButton *stackButton;
    
    //generate new node
    UIButton *newPaper;
    
    //update date and texture
    SKTexture *curr;
    SKLabelNode *dateColor;
    
    UISwipeGestureRecognizer *leftSwipe;
    UISwipeGestureRecognizer *closeSwipe;
}

//paper nodes physics categories
static const int outline1Category = 1;
static const int outline2Category = 2;
static const int outline3Category = 3;

//instantiates save button
- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        save = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        save.backgroundColor = [UIColor darkGrayColor];
        save.frame = CGRectMake(890, 625, 50, 20);
        [save setTitle:@"Save" forState:UIControlStateNormal];
        [save addTarget:self action:@selector(saveButton:) forControlEvents:UIControlEventTouchUpInside];
        
        stackButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        stackButton.backgroundColor = [UIColor darkGrayColor];
        stackButton.frame = CGRectMake(890, 655, 100, 20);
        [stackButton setTitle:@"Stack Papers" forState:UIControlStateNormal];
        [stackButton addTarget:self action:@selector(stackPapers:) forControlEvents:UIControlEventTouchUpInside];
        
        newPaper = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        newPaper.backgroundColor = [UIColor darkGrayColor];
        newPaper.frame = CGRectMake(890, 655, 100, 20);
        [newPaper setTitle:@"Make More" forState:UIControlStateNormal];
        [newPaper addTarget:self action:@selector(newPaper) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

- (void)didMoveToView: (SKView *) view{
    if (!self.created) {
        if ([saveData sharedData].current != nil) {
            [self createScene];
            self.created = YES;
        }
    }
    [self.view addSubview:newPaper];
    
    //swipes to show backgrounds
    leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action: @selector(leftFlip:)];
    [leftSwipe setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:leftSwipe];
    
}

- (void)willMoveFromView:(SKView *)view
{
    [super willMoveFromView:view];
    
    [save removeFromSuperview];
    [stackButton removeFromSuperview];
    [newPaper removeFromSuperview];
    
    [self.view removeGestureRecognizer:leftSwipe];
    [self.view removeGestureRecognizer:closeSwipe];
}

/*
 Checks to see if the change background button has been clicked, and opens the menu to choose the
 available backgrounds from.
 */
- (void)leftFlip:(id)sender{
    opt = [self optionsView];
    [opt addChild:image2];
    [opt addChild:image3];
    [opt addChild:image4];
    [opt addChild:image5];
    [opt addChild:image6];
    [opt addChild:image7];
    [opt addChild:image8];
    [opt addChild:arrow];
    arrow.name = @"arrow2";
    
    [self addChild:opt];
    [self.view addSubview:save];
    [self.view addSubview:stackButton];
    [self.view removeGestureRecognizer:leftSwipe];
    
    closeSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action: @selector(rightFlip:)];
    [closeSwipe setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:closeSwipe];
}

//removes the change background menu
-(void)rightFlip:(id)sender{
    [opt removeFromParent];
    [save removeFromSuperview];
    [stackButton removeFromSuperview];
    [self.view removeGestureRecognizer:closeSwipe];
    [self.view addGestureRecognizer:leftSwipe];
}

//generates more nodes
-(IBAction)newPaper{
    SKSpriteNode *newPap = [[SKSpriteNode alloc] initWithTexture:[saveData sharedData].current];
    newPap.position = CGPointMake(450, 500);
    newPap.name = @"newNodeX";
    
    newPap.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(20, 20)];
    newPap.physicsBody.categoryBitMask = outline1Category;
    newPap.physicsBody.contactTestBitMask = outline2Category | outline3Category;
    newPap.physicsBody.collisionBitMask = outline2Category | outline3Category;
    newPap.physicsBody.affectedByGravity = NO;
    newPap.physicsBody.allowsRotation = NO;
    
    [saveData sharedData].node = newPap;
    [[saveData sharedData].array addObject:newPap];
    NSLog(@"%d", [[saveData sharedData].array count]);
    [[saveData sharedData] save];
    
    [self addChild:[saveData sharedData].node];
}

//saves the texture of the nodes and keeps it; also used to keep the nodes in their specific positions
- (IBAction)saveButton:(UIButton *)pressed{
}

//action to stack papers
-(IBAction)stackPapers:(UIButton *)pressed{
}

//creates the initial SKScene
-(void)createScene{
    self.backgroundColor = [SKColor grayColor];
    self.scaleMode = SKSceneScaleModeFill;
    
    //[self sceneBoundaries];
    // get the screensize
    CGSize scr = self.scene.frame.size;
    
    // setup a position constraint
    SKConstraint *c = [SKConstraint
                       positionX:[SKRange rangeWithLowerLimit:150 upperLimit:(scr.width-150)]
                       Y:[SKRange rangeWithLowerLimit:100 upperLimit:(scr.height-100)]];
    
    SKLabelNode *date = [self dateNode];
    date.position = CGPointMake(-110, 70);
    
    if ([saveData sharedData].current == nil) {
        //for the following nodes, the ability to return to default needs to be instantiated
        SKSpriteNode *pap = [self paperNode];
        pap.position = CGPointMake(CGRectGetMidX(outline1.frame), CGRectGetMidY(outline1.frame));
        
        outline1 = [self outlineNode];
        [outline1 addChild:pap];
        
        SKTexture *tex = [self.scene.view textureFromNode:outline1];
        newNode = [SKSpriteNode spriteNodeWithTexture:tex];
        newNode.name = @"newNode";
        newNode.constraints = @[c];
        [newNode addChild:date];
        
        SKSpriteNode *pap2 = [self paperNode];
        pap2.position = CGPointMake(CGRectGetMidX(outline2.frame), CGRectGetMidY(outline2.frame));
        
        outline2 = [self outlineNode];
        [outline2 addChild:pap2];
        
        SKTexture *tex2 = [self.scene.view textureFromNode:outline2];
        
        newNode2 = [SKSpriteNode spriteNodeWithTexture:tex2];
        newNode2.name = @"newNode2";
        newNode2.constraints = @[c];
        
        SKSpriteNode *pap3 = [self paperNode];
        pap3.position = CGPointMake(CGRectGetMidX(outline3.frame), CGRectGetMidY(outline3.frame));
        
        outline3 = [self outlineNode];
        [outline3 addChild:pap3];
        
        SKTexture *tex3 = [self.scene.view textureFromNode:outline3];
        
        newNode3 = [SKSpriteNode spriteNodeWithTexture:tex3];
        newNode3.name = @"newNode3";
        newNode3.constraints = @[c];
    }
    else {
        newNode = [SKSpriteNode spriteNodeWithTexture:[saveData sharedData].current];
        newNode.name = @"newNode";
        newNode.constraints = @[c];
        [newNode addChild:date];
        
        newNode2 = [SKSpriteNode spriteNodeWithTexture:[saveData sharedData].current];
        newNode2.name = @"newNode2";
        newNode2.constraints = @[c];
        
        newNode3 = [SKSpriteNode spriteNodeWithTexture:[saveData sharedData].current];
        newNode3.name = @"newNode3";
        newNode3.constraints = @[c];
    }
    
    for (SKSpriteNode *sprite in [saveData sharedData].array) {
        if ([saveData sharedData].array != nil) {
            sprite.texture = [saveData sharedData].current;
            [self addChild:sprite];
        }
    }
    
    newNode.position = CGPointMake(500, 500);
    newNode2.position = CGPointMake(CGRectGetMidX(self.frame)-195, CGRectGetMidY(self.frame)+240);
    newNode3.position = CGPointMake(CGRectGetMidX(self.frame)-190, CGRectGetMidY(self.frame)+230);
    
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
    
    //creates clickable background images
    image = [SKSpriteNode spriteNodeWithColor:[SKColor yellowColor] size:CGSizeMake(150, 75)];
    image.position = CGPointMake(-15, 300);
    image.name = @"image1";
    
    image2 = [SKSpriteNode spriteNodeWithImageNamed:@"IS787-189.jpg"];
    image2.size = CGSizeMake(150, 75);
    image2.position = CGPointMake(-15, 300);
    image2.name = @"image2";
    
    image3 = [SKSpriteNode spriteNodeWithImageNamed:@"IS787-191.jpg"];
    image3.size = CGSizeMake(150, 75);
    image3.position = CGPointMake(-15, 220);
    image3.name = @"image3";
    
    image4 = [SKSpriteNode spriteNodeWithColor:[SKColor greenColor] size:CGSizeMake(150, 75)];
    image4.position = CGPointMake(-15, 140);
    image4.name = @"image4";
    
    image5 = [SKSpriteNode spriteNodeWithColor:[SKColor orangeColor] size:CGSizeMake(150, 75)];
    image5.size = CGSizeMake(150, 75);
    image5.position = CGPointMake(-15, 60);
    image5.name = @"image5";
    
    image6 = [SKSpriteNode spriteNodeWithColor:[SKColor purpleColor] size:CGSizeMake(150, 75)];
    image6.size = CGSizeMake(150, 75);
    image6.position = CGPointMake(-15, -20);
    image6.name = @"image6";
    
    image7 = [SKSpriteNode spriteNodeWithColor:[SKColor brownColor] size:CGSizeMake(150, 75)];
    image7.position = CGPointMake(-15, -100);
    image7.name = @"image7";
    
    image8 = [SKSpriteNode spriteNodeWithImageNamed:@"notebook-page.jpg"];
    image8.size = CGSizeMake(150, 75);
    image8.position = CGPointMake(-15, -180);
    image8.name = @"image8";
    
    //arrow to go cycle through backgrounds
    arrow = [SKSpriteNode spriteNodeWithImageNamed:@"transparent-arrow-th.png"];
    arrow.size = CGSizeMake(100, 30);
    arrow.position = CGPointMake(-15, -350);
    arrow.name = @"arrow";
    
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
    changeText.position = CGPointMake(850, 100);
    [changeText addChild:color1];
    [changeText addChild:color2];
    [changeText addChild:color3];
    [changeText addChild:color4];
    [changeText addChild:color5];
    [self addChild:changeText];
}

//detects if contact is made
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
-(SKSpriteNode *)optionsView{
    SKSpriteNode *opt2 = [[SKSpriteNode alloc] initWithColor:[SKColor lightGrayColor] size:CGSizeMake(200, self.frame.size.height+2)];
    opt2.position = CGPointMake(950, 383);
    return opt2;
}

//in this section, the nodes' backgrounds will be able to by customized by the students using Access Math
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    _tappedTwice = NO;
    UITouch *touch = [touches anyObject];
    CGPoint scenePosition = [touch locationInNode:self];
    
    SKNode *checkNode = [self nodeAtPoint:scenePosition];
    /*
     The following section is divided into cycling through nodes with different names.
     Each has different properties.
     The first if checks to see if the node being clicked is the SKSpriteNode for the paper itself, and thus checks to see if
     it is being dragged or being double clicked to transition to another page.
     */
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
            [self.view removeGestureRecognizer:leftSwipe];
        }
    }
    //finally! code to get background image changed! outline is kept
    else if(checkNode && ([checkNode.name hasPrefix:@"image"])){
        SKTexture *tex = [self.scene.view textureFromNode:checkNode];
        SKSpriteNode *paper = [[SKSpriteNode alloc] initWithTexture:tex];
        paper.size = CGSizeMake(300, 200);
        
        SKSpriteNode *outliner = [self outlineNode];
        [outliner addChild:paper];
        
        SKTexture *newTex = [self.scene.view textureFromNode:outliner];
        [saveData sharedData].current = newTex;
        
        SKAction* changeFace = [SKAction setTexture:[saveData sharedData].current];
        
        for(SKNode *check in self.children){
            if([check.name hasPrefix:@"newNode"]){
                [self runAction:changeFace];
                [check runAction:changeFace];
                [[saveData sharedData] save];
            }
        }
        
    }
    /*The following ifs (where the names are exactly "arrow" or "arrow2" cycles through the pages of available backgrounds*/
    else if(checkNode && [checkNode.name isEqualToString:@"arrow"]){
        [opt removeFromParent];
        [image removeFromParent];
        [arrow removeFromParent];
        
        [opt addChild:image2];
        [opt addChild:image3];
        [opt addChild:image4];
        [opt addChild:image5];
        [opt addChild:image6];
        [opt addChild:image7];
        [opt addChild:image8];
        [opt addChild:arrow];
        arrow.name = @"arrow2";
        
        [self addChild:opt];
    }
    else if(checkNode && [checkNode.name isEqualToString:@"arrow2"]){
        [opt removeFromParent];
        [arrow removeFromParent];
        
        opt = [self optionsView];
        [opt addChild:image];
        [opt addChild:arrow];
        arrow.name = @"arrow";
        
        [self addChild:opt];
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
    UITouch *touch = [touches anyObject];
    CGPoint scenePosition = [touch locationInNode:self];
    
    SKNode *checkNode = [self nodeAtPoint:scenePosition];
    
    _activeDragNode = nil;
    
    //stops the swipe gesture from crashing
    if ([checkNode.name hasPrefix:@"newNode"]) {
        [self.view addGestureRecognizer:leftSwipe];
    }
}

@end
