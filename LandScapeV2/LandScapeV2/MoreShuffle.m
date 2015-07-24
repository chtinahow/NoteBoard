//
//  MoreShuffle.m
//  LandScapeV2
//
//  Created by Student on 7/24/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "MoreShuffle.h"
#import "saveData.h"
#import "backgroundImages.h"

@interface MoreShuffle()

@property BOOL created; //checks to see if scene is created

@property BOOL tappedTwice; //checks to see is node is tapped twice

@property SKSpriteNode *activeDragNode; //sets the node to be dragged

@end


@implementation MoreShuffle {
    //original center
    CGPoint _originalCenter;
    
    //date node
    SKLabelNode *date;
    
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
    
    //reset button
    UIButton *reset;
    
    //update date and texture
    SKTexture *curr;
    SKLabelNode *dateColor;
    
    UISwipeGestureRecognizer *leftSwipe;
    
    UIPanGestureRecognizer *panRecognizer;
    
    //zoom
    UIPinchGestureRecognizer *zoomIn;
}

//paper nodes physics categories
static const int outline1Category = 1;
static const int outline2Category = 2;
static const int outline3Category = 3;

//instantiates save button
- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        stackButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        stackButton.backgroundColor = [UIColor darkGrayColor];
        stackButton.frame = CGRectMake(890, 655, 100, 20);
        [stackButton setTitle:@"Stack Papers" forState:UIControlStateNormal];
        [stackButton addTarget:self action:@selector(stackPapers:) forControlEvents:UIControlEventTouchUpInside];
        
        newPaper = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        newPaper.backgroundColor = [UIColor darkGrayColor];
        newPaper.frame = CGRectMake(890, 740, 100, 20);
        [newPaper setTitle:@"Make More" forState:UIControlStateNormal];
        [newPaper addTarget:self action:@selector(newPaper) forControlEvents:UIControlEventTouchUpInside];
        
        reset = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        reset.backgroundColor = [UIColor darkGrayColor];
        reset.frame = CGRectMake(750, 740, 100, 20);
        [reset setTitle:@"Reset" forState:UIControlStateNormal];
        [reset addTarget:self action:@selector(resetButton) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

- (void)didMoveToView: (SKView *) view{
    if (!self.created) {
        [self createScene];
        self.created = YES;
    }
    [view addSubview:newPaper];
    [view addSubview:reset];
    [view addSubview:stackButton];
    
    //swipes to show backgrounds
    leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action: @selector(leftFlip:)];
    [leftSwipe setDirection:UISwipeGestureRecognizerDirectionLeft];
    [view addGestureRecognizer:leftSwipe];
    
    zoomIn = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGesture:)];
    [view addGestureRecognizer:zoomIn];
    
    panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [panRecognizer setMinimumNumberOfTouches:2];
    [panRecognizer setMaximumNumberOfTouches:3];
    [view addGestureRecognizer:panRecognizer];
}

- (void)willMoveFromView:(SKView *)view
{
    [super willMoveFromView:view];
    
    self.created = NO;
    
    [newPaper removeFromSuperview];
    [reset removeFromSuperview];
    [stackButton removeFromSuperview];
    
    [view removeGestureRecognizer:leftSwipe];
    [view removeGestureRecognizer:panRecognizer];
    [view removeGestureRecognizer:zoomIn];
    [self removeAllChildren];
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)panGesture {
    CGPoint translation = [panGesture translationInView:panGesture.view.superview];
    _originalCenter = panRecognizer.view.center;
    if (UIGestureRecognizerStateBegan == panGesture.state ||UIGestureRecognizerStateChanged == panGesture.state) {
        panGesture.view.center = CGPointMake(panGesture.view.center.x + translation.x,
                                             panGesture.view.center.y + translation.y);
        // Reset translation, so we can get translation delta's (i.e. change in translation)
        [panGesture setTranslation:CGPointZero inView:self.view];
    }
    else if (panGesture.state == UIGestureRecognizerStateEnded) {
        
        CGPoint velocity = [panGesture velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 200; //original divider 200
        
        float slideFactor = 0.1 * slideMult /4; // Increase for more of a slide (original doesn't have a divider)
        CGPoint finalPoint = CGPointMake(panGesture.view.center.x + (velocity.x * slideFactor),
                                         panGesture.view.center.y + (velocity.y * slideFactor));
        finalPoint.x = MIN(MAX(finalPoint.x, 70), self.view.bounds.size.width-70);
        finalPoint.y = MIN(MAX(finalPoint.y, 100), self.view.bounds.size.height-100);
        
        [UIView animateWithDuration:slideFactor*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            panGesture.view.center = finalPoint;
        } completion:nil];
    }
    // Don't need any logic for ended/failed/canceled states
}

- (void)handlePinchGesture:(UIPinchGestureRecognizer *)pinchGesture {
    
    if (UIGestureRecognizerStateBegan == pinchGesture.state ||
        UIGestureRecognizerStateChanged == pinchGesture.state) {
        
        // Use the x or y scale, they should be the same for typical zooming (non-skewing)
        float currentScale = [[pinchGesture.view.layer valueForKeyPath:@"transform.scale.x"] floatValue];
        
        // Variables to adjust the max/min values of zoom
        float minScale = 1.0;
        float maxScale = 3.0;
        float zoomSpeed = .5;
        
        float deltaScale = pinchGesture.scale;
        
        // You need to translate the zoom to 0 (origin) so that you
        // can multiply a speed factor and then translate back to "zoomSpace" around 1
        deltaScale = ((deltaScale - 1) * zoomSpeed) + 1;
        
        // Limit to min/max size (i.e maxScale = 2, current scale = 2, 2/2 = 1.0)
        //  A deltaScale is ~0.99 for decreasing or ~1.01 for increasing
        //  A deltaScale of 1.0 will maintain the zoom size
        deltaScale = MIN(deltaScale, maxScale / currentScale);
        deltaScale = MAX(deltaScale, minScale / currentScale);
        
        CGAffineTransform zoomTransform = CGAffineTransformScale(pinchGesture.view.transform, deltaScale, deltaScale);
        pinchGesture.view.transform = zoomTransform;
        
        // Reset to 1 for scale delta's
        //  Note: not 0, or we won't see a size: 0 * width = 0
        pinchGesture.scale = 1;
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES; // Works for most use cases of pinch + zoom + pan
}

/*
 Checks to see if the change background button has been clicked, and opens the menu to choose the
 available backgrounds from.
 */
- (void)leftFlip:(id)sender{
    [self.view setCenter:CGPointMake(512, 384)];
    [self.view removeGestureRecognizer:zoomIn];
    [self.view removeGestureRecognizer:leftSwipe];
    [self.view removeGestureRecognizer:panRecognizer];
    backgroundImages *backy = [[backgroundImages alloc] initWithSize:CGSizeMake(1024, 768)];
    SKView *view = (SKView *) self.view;
    [view presentScene:backy];
    //[self.view removeGestureRecognizer:leftSwipe];
}

//generates more nodes
-(IBAction)newPaper{
    SKSpriteNode *newPap;
    if ([saveData sharedData].current != nil) {
        newPap = [[SKSpriteNode alloc] initWithTexture:[saveData sharedData].current];
    } else {
        SKSpriteNode *pap = [self paperNode];
        pap.position = CGPointMake(CGRectGetMidX(outline1.frame), CGRectGetMidY(outline1.frame));
        
        outline1 = [self outlineNode];
        [outline1 addChild:pap];
        
        SKTexture *tex = [self.scene.view textureFromNode:outline1];
        newPap = [[SKSpriteNode alloc] initWithTexture:tex];
    }
    // get the screensize
    CGSize scr = self.scene.frame.size;
    // setup a position constraint
    SKConstraint *c = [SKConstraint positionX:[SKRange rangeWithLowerLimit:150 upperLimit:(scr.width-150)] Y:[SKRange rangeWithLowerLimit:200 upperLimit:(scr.height-100)]];
    
    newPap.position = CGPointMake(450, 500);
    newPap.name = @"newNodeX";
    newPap.constraints = @[c];
    
    newPap.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(20, 20)];
    newPap.physicsBody.categoryBitMask = outline1Category;
    newPap.physicsBody.contactTestBitMask = outline2Category | outline3Category;
    newPap.physicsBody.collisionBitMask = outline2Category | outline3Category;
    newPap.physicsBody.affectedByGravity = NO;
    newPap.physicsBody.allowsRotation = NO;
    
    /*
     Creating more nodes that have their physicsBodies instantiated and can adapt to changes in texture like those in
     the original stack can be stored and saved via the NSMutableArray.
     */
    [saveData sharedData].node = newPap;
    [[saveData sharedData].array addObject:newPap];
    [[saveData sharedData] save];
    
    [self addChild:newPap];
}

- (IBAction)resetButton{
    [self removeAllChildren];
    [[saveData sharedData] reset];
    [[saveData sharedData] save];
    [self createScene];
}

//saves the texture of the nodes and keeps it; also used to keep the nodes in their specific positions
- (IBAction)saveButton:(UIButton *)pressed{
}

//action to stack papers
-(IBAction)stackPapers:(UIButton *)pressed{
    [saveData sharedData].isStacked = YES;
    
    for (SKSpriteNode *node in self.children) {
        if ([node.name isEqualToString:@"newNode"]) {
            newNode.position = CGPointMake(1000, 600);
            [saveData sharedData].statPos = newNode.position;
        }
        if ([node.name isEqualToString:@"newNode2"]) {
            newNode2.position = CGPointMake(1000, 600);
            [saveData sharedData].statPos2 = newNode2.position;
        }
        if ([node.name isEqualToString:@"newNode3"]) {
            newNode3.position = CGPointMake(1000, 600);
            [saveData sharedData].statPos3 = newNode3.position;
        }
        if ([saveData sharedData].array != nil) {
            for (SKSpriteNode *sprite in [saveData sharedData].array) {
                sprite.position = CGPointMake(1000, 600);
            }
        }
    }
    
    [[saveData sharedData] save];
}

//creates the initial SKScene
-(void)createScene{
    self.backgroundColor = [SKColor grayColor];
    self.scaleMode = SKSceneScaleModeFill;
    
    //[self sceneBoundaries];
    
    // setup a position constraint
    
    // get the screensize
    CGSize scr = self.scene.frame.size;
    // setup a position constraint
    SKConstraint *c = [SKConstraint positionX:[SKRange rangeWithLowerLimit:150 upperLimit:(scr.width-150)] Y:[SKRange rangeWithLowerLimit:200 upperLimit:(scr.height-100)]];
    
    if ([saveData sharedData].date != nil) {
        date = [saveData sharedData].date;
        [date removeFromParent];
    }
    else{
        date = [self dateNode];
    }
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
        newNode = [[SKSpriteNode alloc] initWithTexture:[saveData sharedData].current];
        newNode.name = @"newNode";
        newNode.constraints = @[c];
        [newNode addChild:date];
        
        newNode2 = [[SKSpriteNode alloc] initWithTexture:[saveData sharedData].current];
        newNode2.name = @"newNode2";
        newNode2.constraints = @[c];
        
        newNode3 = [[SKSpriteNode alloc] initWithTexture:[saveData sharedData].current];
        newNode3.name = @"newNode3";
        newNode3.constraints = @[c];
    }
    
    for (SKSpriteNode *sprite in [saveData sharedData].array) {
        if ([saveData sharedData].array != nil) {
            sprite.name = @"newNodeX";
            if ([saveData sharedData].current != nil) {
                sprite.texture = [saveData sharedData].current;
            } else {
                SKSpriteNode *outliner = [self outlineNode];
                
                SKSpriteNode *pap = [self paperNode];
                pap.position = CGPointMake(CGRectGetMidX(outliner.frame), CGRectGetMidY(outliner.frame));
                
                [outliner addChild:pap];
                
                SKTexture *texSoft = [self.scene.view textureFromNode:outliner];
                sprite.texture = texSoft;
            }
            sprite.constraints = @[c];
            [self addChild:sprite];
        }
    }
    
    if ([saveData sharedData].isStacked == NO) {
        if ([saveData sharedData].isSet == YES) {
            newNode.position = [saveData sharedData].pos1;
        }
        else{
            newNode.position =  CGPointMake(CGRectGetMidX(self.frame)-200, CGRectGetMidY(self.frame)+250);
        }
        
        if ([saveData sharedData].isSet2 == YES) {
            newNode2.position = [saveData sharedData].pos2;
        }
        else{
            newNode2.position = CGPointMake(CGRectGetMidX(self.frame)-195, CGRectGetMidY(self.frame)+240);
        }
        
        if ([saveData sharedData].isSet3 == YES) {
            newNode3.position = [saveData sharedData].pos3;
        }
        else{
            newNode3.position = CGPointMake(CGRectGetMidX(self.frame)-190, CGRectGetMidY(self.frame)+230);
        }
    } else{
        newNode.position = [saveData sharedData].statPos;
        newNode2.position = [saveData sharedData].statPos2;
        newNode3.position = [saveData sharedData].statPos3;
    }
    
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
    
    //Change the color of the text
    SKSpriteNode *color1 = [[SKSpriteNode alloc] initWithColor:[SKColor blackColor] size:CGSizeMake(120, 60)];
    color1.position = CGPointMake(-240, 0);
    color1.name = @"color1";
    
    SKSpriteNode *color2 = [[SKSpriteNode alloc] initWithColor:[SKColor darkGrayColor] size:CGSizeMake(120, 60)];
    color2.position = CGPointMake(-120, 0);
    color2.name = @"color2";
    
    SKSpriteNode *color3 = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(120, 60)];
    color3.position = CGPointMake(0, 0);
    color3.name = @"color3";
    
    SKSpriteNode *color4 = [[SKSpriteNode alloc] initWithColor:[SKColor lightGrayColor] size:CGSizeMake(120, 60)];
    color4.position = CGPointMake(120, 0);
    color4.name = @"color4";
    
    SKSpriteNode *color5 = [[SKSpriteNode alloc] initWithColor:[SKColor whiteColor] size:CGSizeMake(120, 60)];
    color5.position = CGPointMake(240, 0);
    color5.name = @"color5";
    
    changeText = [[SKSpriteNode alloc] initWithColor:[SKColor blueColor] size:CGSizeMake(612, 66)];
    changeText.position = CGPointMake(325, 40);
    [changeText addChild:color1];
    [changeText addChild:color2];
    [changeText addChild:color3];
    [changeText addChild:color4];
    [changeText addChild:color5];
    [self addChild:changeText];
    
    [[saveData sharedData] save];
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
    SKLabelNode *datey = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    datey.name = @"date";
    datey.text = @"Date: ";
    datey.fontSize = 35;
    datey.fontColor = [SKColor whiteColor];
    return datey;
}

#pragma mark
-(SKSpriteNode *)optionsView{
    SKSpriteNode *opt2 = [[SKSpriteNode alloc] initWithColor:[SKColor lightGrayColor] size:CGSizeMake(300, 2600)];
    opt2.position = CGPointMake(CGRectGetMaxX(self.frame)-100, CGRectGetMaxY(self.frame)-500);
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
            /*NotesSection *nn = [[NotesSection alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:nn transition:doors];*/
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"gotoNotes" object:nil];
        }
        else if([touch tapCount] == 1 && !_tappedTwice){
            _activeDragNode = (SKSpriteNode *)checkNode;
            [checkNode removeFromParent];
            [self addChild:checkNode];
            [self.view removeGestureRecognizer:leftSwipe];
        }
        //changes the color of the text and stores it.
    }
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
    [[saveData sharedData] save];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint scenePosition = [touch locationInNode:self];
    
    SKNode *checkNode = [self nodeAtPoint:scenePosition];
    
    if(_activeDragNode != nil){
        UITouch *touch = [touches anyObject];
        CGPoint scenePosition = [touch locationInNode:self];
        CGPoint lastPos = [touch previousLocationInNode:self];
        
        CGPoint newLoc = CGPointMake(_activeDragNode.position.x + (scenePosition.x - lastPos.x), _activeDragNode.position.y + (scenePosition.y - lastPos.y));
        
        _activeDragNode.position = newLoc;
        
        if ([checkNode.name isEqualToString:@"newNode"]) {
            [saveData sharedData].pos1 = newLoc;
            [saveData sharedData].isSet = YES;
        }
        if ([checkNode.name isEqualToString:@"newNode2"]) {
            [saveData sharedData].pos2 = newLoc;
            [saveData sharedData].isSet2 = YES;
        }
        if ([checkNode.name isEqualToString:@"newNode3"]) {
            [saveData sharedData].pos3 = newLoc;
            [saveData sharedData].isSet3 = YES;
        }
        
        [saveData sharedData].isStacked = NO;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [[saveData sharedData] save];
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
