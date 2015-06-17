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

@end

@implementation Definitions{
    SKSpriteNode *assignButton;
    SKSpriteNode *fLink;
    SKSpriteNode *nLink;
    SKSpriteNode *ex1;
    SKSpriteNode *ex2;
    SKSpriteNode *ex3;
    SKSpriteNode *ex4;
}

- (void) didMoveToView:(SKView *)view{
    if(!self.created){
        [self createScene];
        self.created = YES;
    }
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
    
    //add examples and buttons
    ex1 = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(250, 25)];
    ex1.position = CGPointMake(250, 180);
    ex1.name = @"eg1";
    [pap addChild:ex1];
    
    SKLabelNode *eg = [self examplesTitle];
    eg.position = CGPointMake(250, 175);
    eg.name = @"eg1";
    [pap addChild:eg];
    
    ex2 = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(250, 25)];
    ex2.position = CGPointMake(250, 100);
    ex2.name = @"eg2";
    [pap addChild:ex2];
    
    SKLabelNode *eg2 = [self examplesTitle];
    eg2.position = CGPointMake(250, 95);
    eg2.name = @"eg2";
    [pap addChild:eg2];
    
    ex3 = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(250, 25)];
    ex3.position = CGPointMake(250, 20);
    ex3.name = @"eg3";
    [pap addChild:ex3];
    
    SKLabelNode *eg3 = [self examplesTitle];
    eg3.position = CGPointMake(250, 15);
    eg3.name = @"eg3";
    [pap addChild:eg3];
    
    ex4 = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(250, 25)];
    ex4.position = CGPointMake(250, -60);
    ex4.name = @"eg4";
    [pap addChild:ex4];
    
    SKLabelNode *eg4 = [self examplesTitle];
    eg4.position = CGPointMake(250, -65);
    eg4.name = @"eg4";
    [pap addChild:eg4];
    
    //add def examples
    SKNode *e1 = [self exDef1];
    e1.position = CGPointMake(-250, 175);
    [pap addChild:e1];
    
    SKNode *e2 = [self exDef2];
    e2.position = CGPointMake(-250, 95);
    [pap addChild:e2];
    
    SKNode *e3 = [self exDef1];
    e3.position = CGPointMake(-250, 15);
    [pap addChild:e3];
    
    SKNode *e4 = [self exDef2];
    e4.position = CGPointMake(-250, -65);
    [pap addChild:e4];
    
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

- (SKLabelNode *) examplesTitle{
    SKLabelNode *eg = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    eg.text = @"Examples";
    eg.fontColor = [SKColor blackColor];
    eg.fontSize = 20;
    return eg;
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
        if([node.name isEqualToString:@"eg1"]){
            ex1.alpha = 0.5;
        }
        if([node.name isEqualToString:@"eg2"]){
            ex2.alpha = 0.5;
        }
        if([node.name isEqualToString:@"eg3"]){
            ex3.alpha = 0.5;
        }
        if([node.name isEqualToString:@"eg4"]){
            ex4.alpha = 0.5;
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
        if(ex1.alpha == 0.5 && [node.name isEqualToString:@"eg1"]){
            ex1.alpha = 1.0;
        }
        if(ex2.alpha == 0.5 && [node.name isEqualToString:@"eg2"]){
            ex2.alpha = 1.0;
        }
        if(ex3.alpha == 0.5 && [node.name isEqualToString:@"eg3"]){
            ex3.alpha = 1.0;
        }
        if(ex4.alpha == 0.5 && [node.name isEqualToString:@"eg4"]){
            ex4.alpha = 1.0;
        }
    }
}
@end

