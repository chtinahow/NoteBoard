//
//  Definitions.m
//  StoryBoard-Notes
//
//  Created by Student on 6/17/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "Definitions.h"
#import "NotesSection.h"
#import "Formulas.h"
#import "Assignments.h"

@interface Definitions()

@property BOOL created;

@property UIScrollView *scrollView;

@property UITextView *label;


@end

@implementation Definitions{
    SKSpriteNode *assignButton;
    SKSpriteNode *fLink;
    SKSpriteNode *nLink;
    UIButton *button;
    UIButton *seeMore;
    UIView *view;
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
        
        //text to go with example
        UITextView *text = [self makeText];
        text.text = @"Proof by Contradiction: fdsjkgvkjebdfgkjvbkdfg sdvjnlsd sdjnfjwegjb sdbjwbrgsnf osdbf";
        text.scrollEnabled = NO;
        [_scrollView addSubview:text];
        
        
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
    _label.font = [UIFont systemFontOfSize:18];
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

- (UITextView *) seeMoreText{
    CGRect frame = CGRectMake(0, 0, 200, 70);
    UITextView *text = [[UITextView alloc] initWithFrame:frame];
    text.text = @"establishes the truth of validity of a proposition";
    text.font = [UIFont systemFontOfSize:15];
    return text;
}

-(IBAction)seeMoreB{
    [self seeMoreText];
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

