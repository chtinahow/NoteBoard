//
//  Definitions.m
//  StoryBoard-Notes
//
//  Created by Kimberly Sookoo on 6/17/15.
//  Copyright (c) 2015 Kimberly Sookoo. All rights reserved.
//

#import "DefinitionsV2.h"
#import "NotesSection.h"
#import "Formulas.h"
#import "Assignments.h"
#import "ExampleView.h"

@interface DefinitionsV2()

@property BOOL created;

@property UIScrollView *scrollView;

@property UITextView *label;

@property UIView *largeView;


@end

@implementation DefinitionsV2{
    UIWebView *webView;
    SKSpriteNode *assignButton; //link to assignments page
    SKSpriteNode *fLink; //link to formulas page
    SKSpriteNode *nLink; //link to notes page
    UIButton *button; //used to make generic buttons
    
    //for example 1
    UIButton *cLess; //see less button
    UIButton *cMore; //see more button
    UIButton *enlarge; //button to enlarge text view
    UIButton *shrink; //button to return to regular view
    UIView *bView; //border for view
    
    //for example 2
    UITextView *textView;
    UIButton *cMore2;
    UIButton *cLess2;
    UIButton *enlarge2;
    UIButton *shrink2;
    UIView *bView2;
    
    UIView *viewy;
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

//SKView scene
- (void)createScene{
    self.backgroundColor = [SKColor grayColor];
    self.scaleMode = SKSceneScaleModeFill;
    SKSpriteNode *pap = [self paperNode];
    pap.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
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

//UIView Scene
-(void) createUIScene{
    //make an example button
    UIButton *b = [self makeButton];
    b.frame = CGRectMake(500, 20, 120, 40);
    [b addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [b setTitle:@"Example 1" forState:UIControlStateNormal];
    [_scrollView addSubview:b];
    
    CGRect frame = CGRectMake(0, 20, 200, 70);
    UITextView *textTitle = [[UITextView alloc] initWithFrame:frame];
    textTitle.text = @"Proof by Contradiction";
    textTitle.font = [UIFont systemFontOfSize:18];
    [textTitle setUserInteractionEnabled:NO];
    [_scrollView addSubview:textTitle];
    
    //example 1 see more button
    cMore = [self makeButton];
    cMore.frame = CGRectMake(0, 60, 50, 20);
    [cMore addTarget:self action:@selector(seeMoreB:) forControlEvents:UIControlEventTouchUpInside];
    [cMore setTitle:@"More" forState:UIControlStateNormal];
    [_scrollView addSubview:cMore];
    
    //second example button
    UIButton *eg = [self makeButton];
    eg.frame = CGRectMake(500, 220, 120, 40);
    [eg addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [eg setTitle:@"Example 2" forState:UIControlStateNormal];
    [_scrollView addSubview:eg];
    
    CGRect frame2 = CGRectMake(0, 240, 200, 70);
    UITextView *textTitle2 = [[UITextView alloc] initWithFrame:frame2];
    textTitle2.text = @"Proof by Induction";
    textTitle2.font = [UIFont systemFontOfSize:18];
    [textTitle2 setUserInteractionEnabled:NO];
    [_scrollView addSubview:textTitle2];
    
    cMore2 = [self makeButton];
    cMore2.frame = CGRectMake(0, 280, 50, 20);
    [cMore2 addTarget:self action:@selector(seeMoreB:) forControlEvents:UIControlEventTouchUpInside];
    [cMore2 setTitle:@"More" forState:UIControlStateNormal];
    [_scrollView addSubview:cMore2];
    
    //date
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

- (SKLabelNode *) dueTitle{
    SKLabelNode * title = [SKLabelNode labelNodeWithFontNamed: @"Arial-BoldMT"];
    title.name = @"title";
    title.text = @"Definitions";
    title.fontSize = 40;
    title.fontColor = [SKColor blackColor];
    return title;
}

#pragma mark
//make actual button
-(UIButton *)makeButton{
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.backgroundColor = [UIColor grayColor];
    
    return button;
}

-(IBAction)buttonClick{
    /*NotesSection *nn = [[NotesSection alloc] initWithSize:CGSizeMake(1024, 768)];
    SKView *view = (SKView *) self.view;
    SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
    [view presentScene:nn transition:doors];*/
    
    ExampleView *eV = [[ExampleView alloc] initWithSize:CGSizeMake(1024, 768)];
    SKView *view = (SKView *) self.view;
    SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
    [view presentScene:eV transition:doors];
}

//see more button
-(IBAction)seeMoreB: (UIButton *)pressed {
    if(pressed == cMore){
        _label = [[UITextView alloc] initWithFrame:CGRectMake(0, 50, 150, 100)];
        [_label setFont:[UIFont fontWithName:@"Enriqueta" size:15]];
        [_label setScrollEnabled:NO];
        [_label setUserInteractionEnabled:NO];
        [_label setText:@"establishes the truth of validity of a proposition kfhbvek fkbskdfjcbsd fkwvdscbks caekhfvekhsd vkebvsb fskuhcsdkjf sdifukhcsfkjg idsfgcuishdf sidgficskhdfouh"];
        [cMore removeFromSuperview];
    
        enlarge = [self makeButton];
        enlarge.frame = CGRectMake(0, 160, 80, 20);
        [enlarge setTitle:@"Enlarge" forState:UIControlStateNormal];
        [enlarge addTarget:self action:@selector(enlargeB:) forControlEvents:UIControlEventTouchUpInside];
    
        cLess = [self makeButton];
        cLess.frame = CGRectMake(160, 160, 50, 20);
        [cLess setTitle:@"Less" forState:UIControlStateNormal];
        [cLess addTarget:self action:@selector(seeLessB:) forControlEvents:UIControlEventTouchUpInside];
    
        [_scrollView addSubview:enlarge];
        [_scrollView addSubview:cLess];
        [_scrollView addSubview:_label];
        [_label sizeToFit];
    }
    else if(pressed == cMore2){
        textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 270, 150, 100)];
        [textView setFont:[UIFont fontWithName:@"Enriqueta" size:15]];
        [textView setScrollEnabled:NO];
        [textView setUserInteractionEnabled:NO];
        [textView setText:@"when n=1, n=k, therefore, n = k + 1"];
        [cMore2 removeFromSuperview];
        
        enlarge2 = [self makeButton];
        enlarge2.frame = CGRectMake(0, 380, 80, 20);
        [enlarge2 setTitle:@"Enlarge" forState:UIControlStateNormal];
        [enlarge2 addTarget:self action:@selector(enlargeB:) forControlEvents:UIControlEventTouchUpInside];
        
        cLess2 = [self makeButton];
        cLess2.frame = CGRectMake(160, 380, 50, 20);
        [cLess2 setTitle:@"Less" forState:UIControlStateNormal];
        [cLess2 addTarget:self action:@selector(seeLessB:) forControlEvents:UIControlEventTouchUpInside];
        
        [_scrollView addSubview:enlarge2];
        [_scrollView addSubview:cLess2];
        [_scrollView addSubview:textView];
        [textView sizeToFit];
    }
}

//see less button
-(IBAction)seeLessB: (UIButton *)pressed{
    if(pressed == cLess){
        cMore = [self makeButton];
        cMore.frame = CGRectMake(0, 60, 50, 20);
        [cMore addTarget:self action:@selector(seeMoreB:) forControlEvents:UIControlEventTouchUpInside];
        [cMore setTitle:@"More" forState:UIControlStateNormal];
        [cLess removeFromSuperview];
        [_label removeFromSuperview];
        [enlarge removeFromSuperview];
        [_scrollView addSubview:cMore];
    }
    else if(pressed == cLess2){
        cMore2 = [self makeButton];
        cMore2.frame = CGRectMake(0, 280, 50, 20);
        [cMore2 addTarget:self action:@selector(seeMoreB:) forControlEvents:UIControlEventTouchUpInside];
        [cMore2 setTitle:@"More" forState:UIControlStateNormal];
        [cLess2 removeFromSuperview];
        [textView removeFromSuperview];
        [enlarge2 removeFromSuperview];
        [_scrollView addSubview:cMore2];
    }
}

//"zooms in on text
-(IBAction)enlargeB: (UIButton *)pressed{
    if(pressed == enlarge){
        CGRect borderF = CGRectMake(100, 100, 470, 170);
        bView = [[UIView alloc] initWithFrame:borderF];
        bView.backgroundColor = [UIColor blackColor];
    
        CGRect zoomFrame = CGRectMake(10, 10, 450, 150);
        _largeView = [[UIView alloc] initWithFrame:zoomFrame];
        _largeView.backgroundColor = [UIColor whiteColor];
    
        CGRect textFrame = CGRectMake(0, 0, 450, 150);
        UITextView *text1 = [[UITextView alloc] initWithFrame:textFrame];
        [text1 setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
        [text1 setUserInteractionEnabled:NO];
        [text1 setText:@"establishes the truth of validity of a proposition kfhbvek fkbskdfjcbsd fkwvdscbks caekhfvekhsd vkebvsb fskuhcsdkjf sdifukhcsfkjg idsfgcuishdf sidgficskhdfouh"];
    
        shrink = [self makeButton];
        shrink.frame = CGRectMake(350, 120, 50, 20);
        [shrink addTarget:self action:@selector(shrinkB:) forControlEvents:UIControlEventTouchUpInside];
        [shrink setTitle:@"Shrink" forState:UIControlStateNormal];
    
        [_largeView addSubview:shrink];
        [_largeView addSubview:text1];
        [bView addSubview:_largeView];
        [_scrollView addSubview:bView];
        [text1 sizeToFit];
    }
    else if(pressed == enlarge2){
        CGRect borderF = CGRectMake(100, 300, 470, 170);
        bView2 = [[UIView alloc] initWithFrame:borderF];
        bView2.backgroundColor = [UIColor blackColor];
        
        CGRect zoomFrame = CGRectMake(10, 10, 450, 150);
        _largeView = [[UIView alloc] initWithFrame:zoomFrame];
        _largeView.backgroundColor = [UIColor whiteColor];
        
        CGRect textFrame = CGRectMake(0, 0, 450, 150);
        UITextView *text2 = [[UITextView alloc] initWithFrame:textFrame];
        [text2 setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
        [text2 setUserInteractionEnabled:NO];
        [text2 setText:@"when n=1, n=k, therefore, n = k + 1"];
        
        shrink2 = [self makeButton];
        shrink2.frame = CGRectMake(350, 120, 50, 20);
        [shrink2 addTarget:self action:@selector(shrinkB:) forControlEvents:UIControlEventTouchUpInside];
        [shrink2 setTitle:@"Shrink" forState:UIControlStateNormal];
        
        [_largeView addSubview:shrink2];
        [_largeView addSubview:text2];
        [bView2 addSubview:_largeView];
        [_scrollView addSubview:bView2];
        [text2 sizeToFit];
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

//links to other pages
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
            [viewy removeFromSuperview];
            [_scrollView removeFromSuperview];
            [view presentScene:nn transition:doors];
        }
        if(fLink.alpha == 0.5 && [node.name isEqualToString:@"form"]){
            fLink.alpha = 1.0;
            Formulas *ff = [[Formulas alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [viewy removeFromSuperview];
            [_scrollView removeFromSuperview];
            [view presentScene:ff transition:doors];
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