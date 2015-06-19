//
//  Definitions.m
//  StoryBoard-Notes
//
//  Created by Student on 6/17/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "DefinitionsV2.h"
#import "NotesSection.h"
#import "Formulas.h"
#import "Assignments.h"

@interface DefinitionsV2()

@property BOOL created;

@property UIScrollView *scrollView;

@property UITextView *label;

@property UIView *largeView;


@end

@implementation DefinitionsV2{
    SKSpriteNode *assignButton; //link to assignments page
    SKSpriteNode *fLink; //link to formulas page
    SKSpriteNode *nLink; //link to notes page
    UIButton *button; //used to make generic buttons
    UIButton *cLess; //see less button
    UIButton *cMore; //see more button
    UIButton *enlarge; //button to enlarge text view
    UIButton *shrink; //button to return to regular view
    UIView *bView; //border for view
}

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        //The UIScroll section
        CGSize layerSize        = CGSizeMake(768, 300);
        CGPoint layerPosition   = CGPointMake(20, 400);
        CGRect viewFrame = CGRectMake(layerPosition.x, layerPosition.y, layerSize.width-50, layerSize.height);
        _scrollView = [[UIScrollView alloc] initWithFrame:viewFrame];
        _scrollView.contentSize                     = CGSizeMake(120, 2000);
        _scrollView.scrollEnabled                   = YES;
        _scrollView.showsVerticalScrollIndicator  = YES;
        _scrollView.backgroundColor                 = [UIColor whiteColor];
        
        //make an example button
        UIButton *b = [self makeButton];
        b.frame = CGRectMake(500, 20, 160, 40);
        [b addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        [b setTitle:@"Example 1" forState:UIControlStateNormal];
        [_scrollView addSubview:b];
        
        UITextView *textTitle = [self makeText];
        textTitle.text = @"Proof by Contradiction";
        textTitle.font = [UIFont systemFontOfSize:18];
        [textTitle setUserInteractionEnabled:NO];
        [_scrollView addSubview:textTitle];
        
        //see more button
         cMore = [self makeButton];
         cMore.frame = CGRectMake(0, 40, 50, 20);
         [cMore addTarget:self action:@selector(seeMoreB) forControlEvents:UIControlEventTouchUpInside];
         [cMore setTitle:@"More" forState:UIControlStateNormal];
         [_scrollView addSubview:cMore];
    }
    
    return self;
}

- (void) didMoveToView:(SKView *)view{
    if(!self.created){
        [self createScene];
        self.created = YES;
    }
    [self.view addSubview:_scrollView];
}

- (void)willMoveFromView:(SKView *)view
{
    [super willMoveFromView:view];
    
    [_scrollView removeFromSuperview];
}

#pragma mark

- (void)createScene{
    self.backgroundColor = [SKColor grayColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    SKSpriteNode *pap = [self paperNode];
    pap.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
    //add date
    SKLabelNode *date = [self dateNode];
    date.position = CGPointMake(-470, 340);
    [pap addChild:date];
    
    //due date button
    assignButton = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(325, 30)];
    assignButton.position = CGPointMake(-345, 315);
    assignButton.name = @"assign";
    [pap addChild:assignButton];
    
    //add due date
    SKLabelNode *assign = [self assignmentDueDate];
    assign.position = CGPointMake(-350,305);
    [pap addChild:assign];
    
    //add title
    SKLabelNode *title = [self dueTitle];
    title.position = CGPointMake(0, 230);
    [pap addChild:title];
    
    //add first Link (to formula section)
    fLink = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(350, 30)];
    fLink.position = CGPointMake(-250, -340);
    [pap addChild:fLink];
    
    //Formulas title
    SKLabelNode *form = [self formula];
    form.position = CGPointMake(-250, -350);
    form.name = @"form";
    [pap addChild:form];
    
    //add second Link (to notes section)
    nLink = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(350, 30)];
    nLink.position = CGPointMake(250, -340);
    [pap addChild:nLink];
    
    //Notes title
    SKLabelNode *notes = [self note];
    notes.position = CGPointMake(250, -350);
    notes.name = @"n";
    [pap addChild:notes];
    
    [self addChild:pap];
}
#pragma mark

- (SKSpriteNode *)paperNode{
    SKSpriteNode *paper = [[SKSpriteNode alloc] initWithColor:[SKColor whiteColor] size:CGSizeMake(1024, 768)];
    
    return paper;
}

#pragma mark

- (SKLabelNode *)dateNode{
    SKLabelNode *date = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    date.name = @"date";
    date.text = @"Date: ";
    date.fontSize = 30;
    date.fontColor = [SKColor blackColor];
    return date;
}

#pragma mark

- (SKLabelNode *)assignmentDueDate{
    SKLabelNode *assign = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    assign.name = @"assign";
    assign.text = @"Assignment Due Date: ";
    assign.fontSize = 30;
    assign.fontColor = [SKColor blackColor];
    return assign;
}

#pragma mark

- (SKLabelNode *) dueTitle{
    SKLabelNode * title = [SKLabelNode labelNodeWithFontNamed: @"Arial-BoldMT"];
    title.name = @"title";
    title.text = @"Definitions";
    title.fontSize = 40;
    title.fontColor = [SKColor blackColor];
    return title;
}

#pragma mark
//make text
-(UITextView *)makeText{
    CGRect frame = CGRectMake(0, 0, 200, 70);
    _label = [[UITextView alloc] initWithFrame:frame];
    return _label;
}

#pragma mark
//make actual button
-(UIButton *)makeButton{
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.backgroundColor = [UIColor grayColor];
    
    return button;
}

-(IBAction)buttonClick{
    NotesSection *nn = [[NotesSection alloc] initWithSize:CGSizeMake(1024, 768)];
    SKView *view = (SKView *) self.view;
    SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
    [view presentScene:nn transition:doors];
}
 
 -(IBAction)seeMoreB{
     _label = [[UITextView alloc] initWithFrame:CGRectMake(0, 30, 150, 100)];
     [_label setFont:[UIFont fontWithName:@"Enriqueta" size:15]];
     [_label setScrollEnabled:NO];
     [_label setUserInteractionEnabled:NO];
     [_label setText:@"establishes the truth of validity of a proposition kfhbvek fkbskdfjcbsd fkwvdscbks caekhfvekhsd vkebvsb fskuhcsdkjf sdifukhcsfkjg idsfgcuishdf sidgficskhdfouh"];
     [cMore removeFromSuperview];
     
     enlarge = [self makeButton];
     enlarge.frame = CGRectMake(0, 150, 80, 20);
     [enlarge setTitle:@"Enlarge" forState:UIControlStateNormal];
     [enlarge addTarget:self action:@selector(enlargeB) forControlEvents:UIControlEventTouchUpInside];
     
     cLess = [self makeButton];
     cLess.frame = CGRectMake(160, 150, 50, 20);
     [cLess setTitle:@"Less" forState:UIControlStateNormal];
     [cLess addTarget:self action:@selector(seeLessB) forControlEvents:UIControlEventTouchUpInside];
     
     [_scrollView addSubview:enlarge];
     [_scrollView addSubview:cLess];
     [_scrollView addSubview:_label];
     [_label sizeToFit];
 }

-(IBAction)seeLessB{
    cMore = [self makeButton];
    cMore.frame = CGRectMake(0, 40, 50, 20);
    [cMore addTarget:self action:@selector(seeMoreB) forControlEvents:UIControlEventTouchUpInside];
    [cMore setTitle:@"More" forState:UIControlStateNormal];
    [cLess removeFromSuperview];
    [_label removeFromSuperview];
    [enlarge removeFromSuperview];
    [_scrollView addSubview:cMore];
}

//"zooms in on text
-(IBAction)enlargeB{
    CGRect borderF = CGRectMake(100, 100, 470, 170);
    bView = [[UIView alloc] initWithFrame:borderF];
    bView.backgroundColor = [UIColor blackColor];
    
    CGRect zoomFrame = CGRectMake(10, 10, 450, 150);
    _largeView = [[UIView alloc] initWithFrame:zoomFrame];
    _largeView.backgroundColor = [UIColor whiteColor];
    
    CGRect textFrame = CGRectMake(0, 0, 450, 150);
    UITextView *text = [[UITextView alloc] initWithFrame:textFrame];
    [text setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
    [text setUserInteractionEnabled:NO];
     [text setText:@"establishes the truth of validity of a proposition kfhbvek fkbskdfjcbsd fkwvdscbks caekhfvekhsd vkebvsb fskuhcsdkjf sdifukhcsfkjg idsfgcuishdf sidgficskhdfouh"];
    
    shrink = [self makeButton];
    shrink.frame = CGRectMake(350, 120, 50, 20);
    [shrink addTarget:self action:@selector(shrinkB) forControlEvents:UIControlEventTouchUpInside];
    [shrink setTitle:@"Shrink" forState:UIControlStateNormal];
    
    [_largeView addSubview:shrink];
    [_largeView addSubview:text];
    [bView addSubview:_largeView];
    [_scrollView addSubview:bView];
    [text sizeToFit];
}

//goes back to original page
-(IBAction)shrinkB{
    [bView removeFromSuperview];
}

#pragma mark

//example definitions

- (SKNode *) exDef1{
    SKNode *nerdText = [SKNode node];
    SKLabelNode *a = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    a.fontSize = 15;
    a.fontColor = [SKColor blackColor];
    SKLabelNode *b = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    b.fontSize = 12;
    b.fontColor = [SKColor blackColor];
    NSString *st1 = @"Proof by Contradiction";
    NSString *st2 = @"establishes the truth of validity of a proposition";
    b.position = CGPointMake(b.position.x, b.position.y - 20);
    a.text = st1;
    b.text = st2;
    [nerdText addChild:a];
    [nerdText addChild:b];
    nerdText.position = CGPointMake(150.0, 250.0);
    
    return nerdText;
}

- (SKNode *) exDef2{
    SKNode *nerdText = [SKNode node];
    SKLabelNode *a = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    a.fontSize = 15;
    a.fontColor = [SKColor blackColor];
    SKLabelNode *b = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    b.fontSize = 12;
    b.fontColor = [SKColor blackColor];
    NSString *st1 = @"Proof by Induction";
    NSString *st2 = @"when n=1, n=k, therefore, n = k + 1";
    b.position = CGPointMake(b.position.x, b.position.y - 20);
    a.text = st1;
    b.text = st2;
    [nerdText addChild:a];
    [nerdText addChild:b];
    nerdText.position = CGPointMake(150.0, 250.0);
    
    return nerdText;
}

#pragma mark

- (SKLabelNode *) formula{
    SKLabelNode *form = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    form.name = @"form";
    form.text = @"Formulas";
    form.fontSize = 33;
    form.fontColor = [SKColor redColor];
    return form;
}

#pragma mark

- (SKLabelNode *) note{
    SKLabelNode *n = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    n.name = @"n";
    n.text = @"Notes";
    n.fontColor = [SKColor redColor];
    n.fontSize = 33;
    return n;
}

#pragma mark

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for(UITouch *touch in touches){
        CGPoint location = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:location];
        
        if([node.name isEqualToString:@"n"]){
            nLink.alpha = 0.5;
        }
        if([node.name isEqualToString:@"form"]){
            fLink.alpha = 0.5;
        }
        if([node.name isEqualToString:@"assign"]){
            assignButton.alpha = 0.5;
        }
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for(UITouch *touch in touches){
        CGPoint location = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:location];
        if(nLink.alpha == 0.5 && [node.name isEqualToString:@"n"]){
            nLink.alpha = 1.0;
            NotesSection *nn = [[NotesSection alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:nn transition:doors];
        }
        if(fLink.alpha == 0.5 && [node.name isEqualToString:@"form"]){
            fLink.alpha = 1.0;
            Formulas *ff = [[Formulas alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:ff transition:doors];
        }
        if(assignButton.alpha == 0.5 && [node.name isEqualToString:@"assign"]){
            assignButton.alpha = 1.0;
            Assignments *aa = [[Assignments alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:aa transition:doors];
        }
    }
}
@end

