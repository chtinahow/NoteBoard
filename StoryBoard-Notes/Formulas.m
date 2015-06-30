//
//  Formulas.m
//  StoryBoard-Notes
//
//  Created by Kimberly Sookoo on 6/17/15.
//  Copyright (c) 2015 Kimberly Sookoo. All rights reserved.
//

#import "Formulas.h"
#import "NotesSection.h"
#import "DefinitionsV2.h"
#import "Assignments.h"

@interface Formulas()

@property BOOL created;

@property UIScrollView *scrollView;

@end

@implementation Formulas{
    UIButton *button; //generic button
    
    //links to other pages
    SKSpriteNode *assignButton;
    SKSpriteNode *nLink;
    SKSpriteNode *dLink;
    
    //links to specific section in notes
    UIButton *section1;
    UIButton *section2;
    UIButton *section3;
    
    //formula buttons
    UIButton *f1;
    UIButton *f2;
    
    //zoom in and out buttons
    UIButton *enlarge;
    UIButton *shrink;
    UIView *largeView;
    UIView *bView;
    
    UIButton *enlarge2;
    UIButton *shrink2;
    UIView *largeView2;
    UIView *bView2;
    
    //texts
    UITextView *text;
    UITextView *text2;
    
    UIView *viewy;
}

#pragma mark

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        CGSize layerSize        = CGSizeMake(768, 300);
        CGPoint layerPosition   = CGPointMake(20, 400);
        CGRect viewFrame = CGRectMake(layerPosition.x, layerPosition.y, layerSize.width-50, layerSize.height);
        _scrollView = [[UIScrollView alloc] initWithFrame:viewFrame];
        _scrollView.contentSize                     = CGSizeMake(120, 2000);
        _scrollView.scrollEnabled                   = YES;
        _scrollView.showsVerticalScrollIndicator  = YES;
        _scrollView.backgroundColor                 = [UIColor whiteColor];
        
        viewy = [[UIView alloc] initWithFrame:CGRectMake(0, 225, 1024, 40)];
        viewy.backgroundColor = [UIColor clearColor];
        
        [self createUIScene];
    }
    
    return self;
}

- (void) didMoveToView:(SKView *)view{
    if(!self.created){
        [self createScene];
        self.created = YES;
    }
    [self.view addSubview:_scrollView];
    [self.view addSubview:viewy];
}

- (void)willMoveFromView:(SKView *)view
{
    [super willMoveFromView:view];
    
    [_scrollView removeFromSuperview];
    [viewy removeFromSuperview];
}

#pragma mark

- (void)createScene{
    self.backgroundColor = [SKColor grayColor];
    self.scaleMode = SKSceneScaleModeFill;
    SKSpriteNode *pap = [self paperNode];
    pap.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
    //due date button
    assignButton = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(325, 30)];
    assignButton.position = CGPointMake(-345, 315);
    [pap addChild:assignButton];
    
    //add due date
    SKLabelNode *assign = [self assignmentDueDate];
    assign.position = CGPointMake(-350,305);
    [pap addChild:assign];
    
    //add title
    SKLabelNode *title = [self formulaTitle];
    title.position = CGPointMake(0, 230);
    [pap addChild:title];
    
    //add first Link (to definitions section)
    nLink = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(350, 30)];
    nLink.position = CGPointMake(-250, -340);
    [pap addChild:nLink];
    
    //Notes title
    SKLabelNode *form = [self notes];
    form.position = CGPointMake(-250, -350);
    [pap addChild:form];
    
    //add second Link (to notes section)
    dLink = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(350, 30)];
    dLink.position = CGPointMake(250, -340);
    [pap addChild:dLink];
    
    //Definitions title
    SKLabelNode *defs = [self definition];
    defs.position = CGPointMake(250, -350);
    [pap addChild:defs];
    
    [self addChild:pap];
}

//UI scene
-(void)createUIScene{
    //section 1
    section1 = [self makeButton];
    section1.frame = CGRectMake(530, 20, 120, 40);
    [section1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [section1 setTitle:@"Section In Notes" forState:UIControlStateNormal];
    [_scrollView addSubview:section1];
    
    f1 = [self makeButton];
    f1.frame = CGRectMake(0, 20, 120, 40);
    [f1 addTarget:self action:@selector(formulaB:) forControlEvents:UIControlEventTouchUpInside];
    [f1 setTitle:@"Product Rule" forState:UIControlStateNormal];
    [_scrollView addSubview:f1];
    
    //section 2
    section2 = [self makeButton];
    section2.frame = CGRectMake(530, 220, 120, 40);
    [section2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [section2 setTitle:@"Section In Notes" forState:UIControlStateNormal];
    [_scrollView addSubview:section2];
    
    f2 = [self makeButton];
    f2.frame = CGRectMake(0, 220, 120, 40);
    [f2 addTarget:self action:@selector(formulaB:) forControlEvents:UIControlEventTouchUpInside];
    [f2 setTitle:@"Integration by Parts" forState:UIControlStateNormal];
    [_scrollView addSubview:f2];
    
    //new date
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *now = [[NSDate alloc] init];
    NSString *theDate = [dateFormat stringFromDate:now];
    
    UITextField *date = [[UITextField alloc] initWithFrame:CGRectMake(5, 0, 100, 40)];
    date.backgroundColor = [UIColor clearColor];
    date.userInteractionEnabled = NO;
    [date setText:[NSString stringWithFormat:@"%@", theDate]];
    date.textColor = [UIColor blueColor];
    [viewy addSubview:date];
}

#pragma mark

//make actual button
-(UIButton *)makeButton{
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.backgroundColor = [UIColor grayColor];
    
    return button;
}

//button that links to notes section
-(IBAction)buttonClick: (UIButton*)pressed{
    if((pressed == section1) || (pressed == section2)){
        NotesSection *nn = [[NotesSection alloc] initWithSize:CGSizeMake(1024, 768)];
        SKView *view = (SKView *) self.view;
        SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
        [view presentScene:nn transition:doors];
    }
}

//see more button
-(IBAction)formulaB:(UIButton *)pressed{
    if(pressed == f1){
        [f1 removeFromSuperview];
        f1 = [self makeButton];
        f1.frame = CGRectMake(0, 20, 120, 40);
        [f1 addTarget:self action:@selector(pressedAgain:) forControlEvents:UIControlEventTouchUpInside];
        [f1 setTitle:@"Product Rule" forState:UIControlStateNormal];
        [_scrollView addSubview:f1];
        
        text = [[UITextView alloc] initWithFrame:CGRectMake(0, 60, 150, 100)];
        [text setFont:[UIFont fontWithName:@"Arial-BoldMT" size:15]];
        [text setUserInteractionEnabled:NO];
        [text setText:@"D(f(x)g(x)) = f(x)g'(x) + f'(x)g(x)"];
        [_scrollView addSubview:text];
        [text sizeToFit];
        
        enlarge = [self makeButton];
        enlarge.frame = CGRectMake(80, 110, 80, 30);
        [enlarge addTarget:self action:@selector(enlarge:) forControlEvents:UIControlEventTouchUpInside];
        [enlarge setTitle:@"Enlarge" forState:UIControlStateNormal];
        [_scrollView addSubview:enlarge];
    }
    else if(pressed == f2){
        f2 = [self makeButton];
        f2.frame = CGRectMake(0, 220, 120, 40);
        [f2 addTarget:self action:@selector(pressedAgain:) forControlEvents:UIControlEventTouchUpInside];
        [f2 setTitle:@"Integration by Parts" forState:UIControlStateNormal];
        [_scrollView addSubview:f2];
        
        text2 = [[UITextView alloc] initWithFrame:CGRectMake(0, 260, 150, 100)];
        [text2 setFont:[UIFont fontWithName:@"Arial-BoldMT" size:15]];
        [text2 setUserInteractionEnabled:NO];
        [text2 setText:@"uv - D(vdu)"];
        [_scrollView addSubview:text2];
        [text2 sizeToFit];
        
        enlarge2 = [self makeButton];
        enlarge2.frame = CGRectMake(80, 310, 80, 30);
        [enlarge2 addTarget:self action:@selector(enlarge:) forControlEvents:UIControlEventTouchUpInside];
        [enlarge2 setTitle:@"Enlarge" forState:UIControlStateNormal];
        [_scrollView addSubview:enlarge2];
    }
}

//see less button
-(IBAction)pressedAgain:(UIButton *)pressed{
    if(pressed == f1){
        [text removeFromSuperview];
        [f1 removeFromSuperview];
        [enlarge removeFromSuperview];
        
        f1 = [self makeButton];
        f1.frame = CGRectMake(0, 20, 120, 40);
        [f1 addTarget:self action:@selector(formulaB:) forControlEvents:UIControlEventTouchUpInside];
        [f1 setTitle:@"Product Rule" forState:UIControlStateNormal];
        [_scrollView addSubview:f1];
    }
    else if(pressed == f2){
        [text2 removeFromSuperview];
        [f2 removeFromSuperview];
        [enlarge2 removeFromSuperview];
        
        f2 = [self makeButton];
        f2.frame = CGRectMake(0, 220, 120, 40);
        [f2 addTarget:self action:@selector(formulaB:) forControlEvents:UIControlEventTouchUpInside];
        [f2 setTitle:@"Integration by Parts" forState:UIControlStateNormal];
        [_scrollView addSubview:f2];
    }
}

//zoom in
-(IBAction)enlarge:(UIButton *)pressed{
    if(pressed == enlarge){
        CGRect borderF = CGRectMake(100, 100, 470, 170);
        bView = [[UIView alloc] initWithFrame:borderF];
        bView.backgroundColor = [UIColor blackColor];
    
        CGRect border = CGRectMake(10, 10, 450, 150);
        largeView = [[UIView alloc] initWithFrame:border];
        largeView.backgroundColor = [UIColor whiteColor];
        
        CGRect textFrame = CGRectMake(0, 0, 450, 150);
        UITextView *text1 = [[UITextView alloc] initWithFrame:textFrame];
        [text1 setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
        [text1 setUserInteractionEnabled:NO];
        [text1 setText:@"D(f(x)g(x)) = f(x)g'(x) + f'(x)g(x)"];
        
        shrink = [self makeButton];
        shrink.frame = CGRectMake(380, 120, 50, 20);
        [shrink addTarget:self action:@selector(shrinkB:) forControlEvents:UIControlEventTouchUpInside];
        [shrink setTitle:@"Shrink" forState:UIControlStateNormal];
        
        [largeView addSubview:shrink];
        [largeView addSubview:text1];
        [bView addSubview:largeView];
        [_scrollView addSubview:bView];
        [text1 sizeToFit];
    }
    else if(pressed == enlarge2){
        CGRect borderF = CGRectMake(100, 300, 470, 170);
        bView2 = [[UIView alloc] initWithFrame:borderF];
        bView2.backgroundColor = [UIColor blackColor];
        
        CGRect border = CGRectMake(10, 10, 450, 150);
        largeView2 = [[UIView alloc] initWithFrame:border];
        largeView2.backgroundColor = [UIColor whiteColor];
        
        CGRect textFrame = CGRectMake(0, 0, 450, 150);
        UITextView *texty = [[UITextView alloc] initWithFrame:textFrame];
        [texty setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
        [texty setUserInteractionEnabled:NO];
        [texty setText:@"uv - D(vdu)"];
        
        shrink2 = [self makeButton];
        shrink2.frame = CGRectMake(380, 120, 50, 20);
        [shrink2 addTarget:self action:@selector(shrinkB:) forControlEvents:UIControlEventTouchUpInside];
        [shrink2 setTitle:@"Shrink" forState:UIControlStateNormal];
        
        [largeView2 addSubview:shrink2];
        [largeView2 addSubview:texty];
        [bView2 addSubview:largeView2];
        [_scrollView addSubview:bView2];
        [texty sizeToFit];
    }
}

//goes back to original page
-(IBAction)shrinkB: (UIButton *)pressed{
    if(pressed == shrink){
        [bView removeFromSuperview];
    }
    else if(pressed == shrink2){
        [bView2 removeFromSuperview];
    }
}

#pragma mark

- (SKSpriteNode *)paperNode{
    SKSpriteNode *paper = [[SKSpriteNode alloc] initWithColor:[SKColor whiteColor] size:CGSizeMake(1024, 768)];
    
    return paper;
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

- (SKLabelNode *) sectionInNotesLabel{
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    label.text = @"Section in Notes";
    label.fontColor = [SKColor blackColor];
    label.fontSize = 20;
    return label;
}

#pragma mark

//formulas for presenting
//needs to be resized dynamically for when actual formulas are being added.

- (SKLabelNode *) formula3{
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    label.name = @"f3";
    label.text = @"Area of a Square: (side of square)^2";
    label.fontColor = [SKColor blackColor];
    label.fontSize = 15;
    return label;
}

- (SKLabelNode *) formula4{
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    label.name = @"f4";
    label.text = @"Area of a Rectangle: length x width";
    label.fontColor = [SKColor blackColor];
    label.fontSize = 15;
    return label;
}

- (SKLabelNode *) formula5{
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    label.name = @"f5";
    label.text = @"Area of a Circle: pi*(radius)^2";
    label.fontColor = [SKColor blackColor];
    label.fontSize = 15;
    return label;
}

- (SKLabelNode *) formula6{
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    label.name = @"f6";
    label.text = @"D(ln(u)) = 1/u";
    label.fontColor = [SKColor blackColor];
    label.fontSize = 15;
    return label;
}

- (SKLabelNode *) formula7{
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    label.name = @"f7";
    label.text = @"Perimeter of a Square: side*4";
    label.fontColor = [SKColor blackColor];
    label.fontSize = 15;
    return label;
}

#pragma mark

- (SKLabelNode *) formulaTitle{
    SKLabelNode * title = [SKLabelNode labelNodeWithFontNamed: @"Arial-BoldMT"];
    title.name = @"title";
    title.text = @"Formulas";
    title.fontSize = 40;
    title.fontColor = [SKColor blackColor];
    return title;
}

#pragma mark

- (SKLabelNode *) notes{
    SKLabelNode *n = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    n.name = @"n";
    n.text = @"Notes";
    n.fontSize = 33;
    n.fontColor = [SKColor redColor];
    return n;
}

#pragma mark

- (SKLabelNode *) definition{
    SKLabelNode *def = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    def.name = @"def";
    def.text = @"Definitions";
    def.fontColor = [SKColor redColor];
    def.fontSize = 33;
    return def;
}

#pragma mark

//links to other pages
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for(UITouch *touch in touches){
        CGPoint location = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:location];
        
        if([node.name isEqualToString:@"n"]){
            nLink.alpha = 0.5;
        }
        if([node.name isEqualToString:@"def"]){
            dLink.alpha = 0.5;
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
            [viewy removeFromSuperview];
            [_scrollView removeFromSuperview];
            [view presentScene:nn transition:doors];
        }
        if(dLink.alpha == 0.5 && [node.name isEqualToString:@"def"]){
            dLink.alpha = 1.0;
            DefinitionsV2 *dd = [[DefinitionsV2 alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [viewy removeFromSuperview];
            [_scrollView removeFromSuperview];
            [view presentScene:dd transition:doors];
        }
        if(assignButton.alpha == 0.5 && [node.name isEqualToString:@"assign"]){
            assignButton.alpha = 1.0;
            Assignments *aa = [[Assignments alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [viewy removeFromSuperview];
            [_scrollView removeFromSuperview];
            [view presentScene:aa transition:doors];
        }
    }
}

@end

