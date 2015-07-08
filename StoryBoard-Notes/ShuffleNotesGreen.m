//
//  ShuffleNotes.m
//  StoryBoard-Notes
//  Section 3 View - Green
//  Created by Kimberly Sookoo on 6/16/15.
//  Copyright (c) 2015 Kimberly Sookoo. All rights reserved.
//

#import "ShuffleNotesGreen.h"
#import "NotesSection.h"
#import "saveData.h"

@interface ShuffleNotesGreen()

@property BOOL created; //checks to see if scene is created

@property BOOL tappedTwice; //checks to see is node is tapped twice

@property SKSpriteNode *activeDragNode; //sets the node to be dragged

@end

@implementation ShuffleNotesGreen{
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
    
    //update date and texture
    SKTexture *curr;
    SKLabelNode *dateColor;
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
        save.frame = CGRectMake(600, 300, 50, 20);
        [save setTitle:@"Save" forState:UIControlStateNormal];
        [save addTarget:self action:@selector(saveButton:) forControlEvents:UIControlEventTouchUpInside];
        
        stackButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        stackButton.backgroundColor = [UIColor darkGrayColor];
        stackButton.frame = CGRectMake(400, 300, 100, 20);
        [stackButton setTitle:@"Stack Papers" forState:UIControlStateNormal];
        [stackButton addTarget:self action:@selector(stackPapers:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

- (void)didMoveToView: (SKView *) view{
    if (!self.created) {
        [self loadScene];
        self.created = YES;
    }
    [self.view addSubview:save];
    [self.view addSubview:stackButton];

}

- (void)willMoveFromView:(SKView *)view
{
    [super willMoveFromView:view];
    
    [save removeFromSuperview];
    [stackButton removeFromSuperview];
}

//saves the texture of the nodes and keeps it; also used to keep the nodes in their specific positions
- (IBAction)saveButton:(UIButton *)pressed{
    [saveData sharedData].isStacked = NO;
    if(save == pressed){
        dateColor = [saveData sharedData].date;
        dateColor.position = CGPointMake(-100, 67);
        
        [[saveData sharedData] save];
        [newNode removeFromParent];
        [newNode2 removeFromParent];
        [newNode3 removeFromParent];
        
        curr = [saveData sharedData].current;
        newNode = [SKSpriteNode spriteNodeWithTexture:curr];
        newNode.name = @"newNode";
        newNode.position = [saveData sharedData].pos1; //used to keep the current position
        [newNode addChild:dateColor];
        
        newNode2 = [SKSpriteNode spriteNodeWithTexture:curr];
        newNode2.name = @"newNode2";
        newNode2.position = [saveData sharedData].pos2;
        
        newNode3 = [SKSpriteNode spriteNodeWithTexture:curr];
        newNode3.name = @"newNode3";
        newNode3.position = [saveData sharedData].pos3;
        
        //re-instantiate the physics of the nodes
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
}

//action to stack papers
-(IBAction)stackPapers:(UIButton *)pressed{
    [saveData sharedData].isStacked = YES;
    if(pressed == stackButton){
        dateColor = [saveData sharedData].date;
        dateColor.position = CGPointMake(-100, 67);
    
        [[saveData sharedData] save];
        [newNode removeFromParent];
        [newNode2 removeFromParent];
        [newNode3 removeFromParent];
    
        curr = [saveData sharedData].current;
        newNode = [SKSpriteNode spriteNodeWithTexture:curr];
        newNode.name = @"newNode";
        newNode.position = [saveData sharedData].statPos;
        [newNode addChild:dateColor];
    
        newNode2 = [SKSpriteNode spriteNodeWithTexture:curr];
        newNode2.name = @"newNode2";
        newNode2.position = [saveData sharedData].statPos2;
    
        newNode3 = [SKSpriteNode spriteNodeWithTexture:curr];
        newNode3.name = @"newNode3";
        newNode3.position = [saveData sharedData].statPos3;
    
        //re-instantiate the physics of the nodes
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
}

//creates the SKScene
-(void)loadScene{
    self.backgroundColor = [SKColor grayColor];
    self.scaleMode = SKSceneScaleModeFill;
    [self sceneBoundaries];
    
    dateColor = [saveData sharedData].date;
    dateColor.position = CGPointMake(-100, 67);
    
    [[saveData sharedData] save];
    [newNode removeFromParent];
    [newNode2 removeFromParent];
    [newNode3 removeFromParent];
    
    //for the following nodes, the ability to return to default needs to be instantiated
    curr = [saveData sharedData].current;
    newNode = [SKSpriteNode spriteNodeWithTexture:curr];
    newNode.name = @"newNode";
    [newNode addChild:dateColor];
    
    newNode2 = [SKSpriteNode spriteNodeWithTexture:curr];
    newNode2.name = @"newNode2";
    
    newNode3 = [SKSpriteNode spriteNodeWithTexture:curr];
    newNode3.name = @"newNode2";
    
    if([saveData sharedData].isStacked == YES){
        newNode.position = [saveData sharedData].statPos;
        newNode2.position = [saveData sharedData].statPos2;
        newNode3.position = [saveData sharedData].statPos3;
    } else{
        newNode.position = [saveData sharedData].pos1;
        newNode2.position = [saveData sharedData].pos2;
        newNode3.position = [saveData sharedData].pos3;
    }
    
    //newNode1 physics body
    newNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(20, 20)];
    newNode.physicsBody.categoryBitMask = outline1Category;
    newNode.physicsBody.contactTestBitMask = outline2Category | outline3Category;
    newNode.physicsBody.collisionBitMask = outline2Category | outline3Category;
    newNode.physicsBody.affectedByGravity = NO;
    newNode.physicsBody.allowsRotation = NO;
    newNode.physicsBody.friction = 0.0f;
    newNode.physicsBody.restitution = 1.0f;
    newNode.physicsBody.linearDamping = 0.0f;
    
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
    arrow.position = CGPointMake(-15, -325);
    arrow.name = @"arrow";
    
    //sets up button to open background menu
    SKSpriteNode *background = [[SKSpriteNode alloc] initWithColor:[SKColor blueColor] size:CGSizeMake(250, 40)];
    SKLabelNode *bText = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    bText.text = @"Change BackGround";
    bText.fontColor = [SKColor whiteColor];
    bText.fontSize = 25;
    bText.position = CGPointMake(0, -8);
    [background addChild:bText];
    SKTexture *tex4 = [self.scene.view textureFromNode:background];
    backButton = [SKSpriteNode spriteNodeWithTexture:tex4];
    backButton.name = @"Background";
    backButton.position = CGPointMake(850, 40);
    
    [self addChild:backButton];
    
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

-(void)sceneBoundaries{
    SKSpriteNode *bound1 = [[SKSpriteNode alloc] initWithColor:[SKColor clearColor] size:CGSizeMake(100, 700)];
    bound1.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(250, 750)];
    bound1.physicsBody.affectedByGravity = NO;
    bound1.physicsBody.allowsRotation = NO;
    bound1.physicsBody.dynamic = NO;
    bound1.position = CGPointMake(0, 400);
    
    SKSpriteNode *bound2 = [[SKSpriteNode alloc] initWithColor:[SKColor clearColor] size:CGSizeMake(100, 750)];
    bound2.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(250, 700)];
    bound2.physicsBody.affectedByGravity = NO;
    bound2.physicsBody.allowsRotation = NO;
    bound2.physicsBody.dynamic = NO;
    bound2.position = CGPointMake(1000, 400);
    
    SKSpriteNode *bound3 = [[SKSpriteNode alloc] initWithColor:[SKColor clearColor] size:CGSizeMake(900, 100)];
    bound3.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(1000, 250)];
    bound3.physicsBody.affectedByGravity = NO;
    bound3.physicsBody.allowsRotation = NO;
    bound3.physicsBody.dynamic = NO;
    bound3.position = CGPointMake(500, 30);
    
    SKSpriteNode *bound4 = [[SKSpriteNode alloc] initWithColor:[SKColor clearColor] size:CGSizeMake(900, 100)];
    bound4.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(1000, 250)];
    bound4.physicsBody.affectedByGravity = NO;
    bound4.physicsBody.allowsRotation = NO;
    bound4.physicsBody.dynamic = NO;
    bound4.position = CGPointMake(500, 800);
    
    [self addChild:bound1];
    [self addChild:bound2];
    [self addChild:bound3];
    [self addChild:bound4];
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
//creates the button that links to the available background images.
-(SKSpriteNode *)backGroundColor{
    SKSpriteNode *bc = [[SKSpriteNode alloc] initWithColor:[SKColor blueColor] size:CGSizeMake(150, 30)];
    
    return bc;
}

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
        }
    }
    /*
     Checks to see if the change background button has been clicked, and opens the menu to choose the
     available backgrounds from.
     */
    else if(checkNode && ([checkNode.name hasPrefix:@"Background"])){
        [checkNode removeFromParent];
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
        
        SKSpriteNode *less = [self backGroundColor];
        SKLabelNode *bText = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
        bText.text = @"Close";
        bText.fontColor = [SKColor whiteColor];
        bText.fontSize = 20;
        bText.position = CGPointMake(0, -5);
        [less addChild:bText];
        SKTexture *texLess = [self.scene.view textureFromNode:less];
        SKSpriteNode *lessN = [SKSpriteNode spriteNodeWithTexture:texLess];
        lessN.position = CGPointMake(-15, -365);
        lessN.name = @"lessN";
        
        [opt addChild:lessN];
        [self addChild:opt];
    }
    //finally! code to get background image changed! outline is kept
    else if(checkNode && ([checkNode.name hasPrefix:@"image"])){
        SKTexture *tex = [self.scene.view textureFromNode:checkNode];
        SKSpriteNode *paper = [[SKSpriteNode alloc] initWithTexture:tex];
        paper.size = CGSizeMake(300, 200);
        
        SKSpriteNode *outliner = [self outlineNode];
        [outliner addChild:paper];
        
        SKTexture *newTex = [self.scene.view textureFromNode:outliner];
        
        SKAction* changeFace = [SKAction setTexture:newTex];
        
        for(SKNode *check in self.children){
            if([check.name hasPrefix:@"newNode"]){
                [self runAction:changeFace];
                [check runAction:changeFace];
            }
        }
        [[saveData sharedData] save];
        [saveData sharedData].current = newTex; //saves the texture

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
        
        SKSpriteNode *less = [self backGroundColor];
        SKLabelNode *bText = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
        bText.text = @"Close";
        bText.fontColor = [SKColor whiteColor];
        bText.fontSize = 20;
        bText.position = CGPointMake(0, -5);
        [less addChild:bText];
        SKTexture *texLess = [self.scene.view textureFromNode:less];
        SKSpriteNode *lessN = [SKSpriteNode spriteNodeWithTexture:texLess];
        lessN.position = CGPointMake(-15, -365);
        lessN.name = @"lessN";
        
        [opt addChild:lessN];
        [self addChild:opt];
    }
    else if(checkNode && [checkNode.name isEqualToString:@"arrow2"]){
        [opt removeFromParent];
        [arrow removeFromParent];
        
        opt = [self optionsView];
        [opt addChild:image];
        [opt addChild:arrow];
        arrow.name = @"arrow";
        
        SKSpriteNode *less = [self backGroundColor];
        SKLabelNode *bText = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
        bText.text = @"Close";
        bText.fontColor = [SKColor whiteColor];
        bText.fontSize = 20;
        bText.position = CGPointMake(0, -5);
        [less addChild:bText];
        SKTexture *texLess = [self.scene.view textureFromNode:less];
        SKSpriteNode *lessN = [SKSpriteNode spriteNodeWithTexture:texLess];
        lessN.position = CGPointMake(-15, -365);
        lessN.name = @"lessN";
        
        [opt addChild:lessN];
        [self addChild:opt];
    }
    //removes the change background menu
    else if(checkNode && ([checkNode.name isEqualToString:@"lessN"])){
        [opt removeFromParent];
        [self addChild:backButton];
    }
    //changes the color of the text and stores it.
    else if (checkNode && [checkNode.name hasPrefix:@"color"]){
        for(SKNode *check in self.children){
            if([check.name hasPrefix:@"newNode"]){
                for(SKLabelNode *label in check.children){
                    if([checkNode.name isEqualToString:@"color1"]){
                        label.fontColor = [SKColor blackColor];
                        [saveData sharedData].date = label;
                    }
                    if([checkNode.name isEqualToString:@"color2"]){
                        label.fontColor = [SKColor darkGrayColor];
                        [saveData sharedData].date = label;
                    }
                    if([checkNode.name isEqualToString:@"color3"]){
                        label.fontColor = [SKColor grayColor];
                        [saveData sharedData].date = label;
                    }
                    if([checkNode.name isEqualToString:@"color4"]){
                        label.fontColor = [SKColor lightGrayColor];
                        [saveData sharedData].date = label;
                    }
                    if([checkNode.name isEqualToString:@"color5"]){
                        label.fontColor = [SKColor whiteColor];
                        [saveData sharedData].date = label;
                    }
                }
            }
        }
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint scenePosition = [touch locationInNode:self];
    
    SKNode *checkNode = [self nodeAtPoint:scenePosition];
    
    if(_activeDragNode != nil){
        UITouch *touch = [touches anyObject];
        CGPoint scenePosition = [touch locationInNode:self];
        CGPoint lastPos = [touch previousLocationInNode:self];
        
        if(((_activeDragNode.position.x + (scenePosition.x - lastPos.x)) > CGRectGetMinX(self.view.frame)+100) || ((_activeDragNode.position.x + (scenePosition.x - lastPos.x)) < CGRectGetMaxX(self.view.frame)) || ((_activeDragNode.position.y + (scenePosition.y - lastPos.y)) > CGRectGetMinY(self.view.frame)+100) || ((_activeDragNode.position.y + (scenePosition.y - lastPos.y)) < CGRectGetMaxY(self.view.frame)+100)){
            CGPoint newLoc = CGPointMake(_activeDragNode.position.x + (scenePosition.x - lastPos.x), _activeDragNode.position.y + (scenePosition.y - lastPos.y));
            
            _activeDragNode.position = newLoc;
            
            //saves the current position of the node
            if(checkNode == newNode){
                [saveData sharedData].pos1 = newLoc;
                [saveData sharedData].statPos = CGPointMake(CGRectGetMidX(self.frame)-200, CGRectGetMidY(self.frame)+250);
            }
            else if(checkNode == newNode2){
                [saveData sharedData].pos2 = newLoc;
                [saveData sharedData].statPos2 = CGPointMake(CGRectGetMidX(self.frame)-195, CGRectGetMidY(self.frame)+240);
            }
            else if(checkNode == newNode3){
                [saveData sharedData].pos3 = newLoc;
                [saveData sharedData].statPos3 = CGPointMake(CGRectGetMidX(self.frame)-190, CGRectGetMidY(self.frame)+230);
            }

        }
    }
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    _activeDragNode = nil;
}

@end
