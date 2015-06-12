//
//  definitions.m
//  Notes
//
//  Initial layout for "Definitions" section; subject to change.
//  Created by Kimberly Sookoo on 6/9/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "definitions.h"
#import "formulas.h"
#import "notes.h"
#import "assignments.h"
#include "example.h"

@interface definitions()

@property BOOL created;

@end

@implementation definitions

#pragma mark

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
    date.position = CGPointMake(-325, 455);
    [pap addChild:date];
    
    //due date button
    SKSpriteNode *assignButton = [self assignmentLabel];
    assignButton.position = CGPointMake(-205, 435);
    [pap addChild:assignButton];
    
    //add due date
    SKLabelNode *assign = [self assignmentDueDate];
    assign.position = CGPointMake(-205, 425);
    [pap addChild:assign];
    
    //add title
    SKLabelNode *title = [self dueTitle];
    title.position = CGPointMake(0, 360);
    [pap addChild:title];
    
    //add examples and buttons
    SKSpriteNode *ex1 = [self examplesLabel];
    ex1.position = CGPointMake(200, 245);
    [pap addChild:ex1];
    
    SKLabelNode *eg = [self examplesTitle];
    eg.position = CGPointMake(200, 240);
    [pap addChild:eg];
    
    SKSpriteNode *ex2 = [self examplesLabel];
    ex2.position = CGPointMake(200, 165);
    [pap addChild:ex2];
    
    SKLabelNode *eg2 = [self examplesTitle];
    eg2.position = CGPointMake(200, 160);
    [pap addChild:eg2];
    
    SKSpriteNode *ex3 = [self examplesLabel];
    ex3.position = CGPointMake(200, 85);
    [pap addChild:ex3];
    
    SKLabelNode *eg3 = [self examplesTitle];
    eg3.position = CGPointMake(200, 80);
    [pap addChild:eg3];
    
    SKSpriteNode *ex4 = [self examplesLabel];
    ex4.position = CGPointMake(200, 5);
    [pap addChild:ex4];
    
    SKLabelNode *eg4 = [self examplesTitle];
    eg4.position = CGPointMake(200, 0);
    [pap addChild:eg4];
    
    SKSpriteNode *ex5 = [self examplesLabel];
    ex5.position = CGPointMake(200, -75);
    [pap addChild:ex5];
    
    SKLabelNode *eg5 = [self examplesTitle];
    eg5.position = CGPointMake(200, -80);
    [pap addChild:eg5];
    
    SKSpriteNode *ex6 = [self examplesLabel];
    ex6.position = CGPointMake(200, -155);
    [pap addChild:ex6];
    
    SKLabelNode *eg6 = [self examplesTitle];
    eg6.position = CGPointMake(200, -160);
    [pap addChild:eg6];
    
    SKSpriteNode *ex7 = [self examplesLabel];
    ex7.position = CGPointMake(200, -235);
    [pap addChild:ex7];
    
    SKLabelNode *eg7 = [self examplesTitle];
    eg7.position = CGPointMake(200, -240);
    [pap addChild:eg7];
    
    //add def examples
    SKNode *e1 = [self exDef1];
    e1.position = CGPointMake(-200, 245);
    [pap addChild:e1];
    
    SKNode *e2 = [self exDef2];
    e2.position = CGPointMake(-200, 165);
    [pap addChild:e2];
    
    SKNode *e3 = [self exDef1];
    e3.position = CGPointMake(-200, 85);
    [pap addChild:e3];
    
    SKNode *e4 = [self exDef2];
    e4.position = CGPointMake(-200, 5);
    [pap addChild:e4];
    
    SKNode *e5 = [self exDef1];
    e5.position = CGPointMake(-200, -75);
    [pap addChild:e5];
    
    SKNode *e6 = [self exDef2];
    e6.position = CGPointMake(-200, -155);
    [pap addChild:e6];
    
    SKNode *e7 = [self exDef1];
    e7.position = CGPointMake(-200, -235);
    [pap addChild:e7];
    
    //add first Link (to formula section)
    SKSpriteNode *fLink = [self linkToFormula];
    fLink.position = CGPointMake(0, -340);
    [pap addChild:fLink];
    
    //Formulas title
    SKLabelNode *form = [self formula];
    form.position = CGPointMake(0, -350);
    [pap addChild:form];
    
    //add second Link (to notes section)
    SKSpriteNode *nLink = [self linkToNotes];
    nLink.position = CGPointMake(0, -390);
    [pap addChild:nLink];
    
    //Notes title
    SKLabelNode *notes = [self note];
    notes.position = CGPointMake(0, -400);
    [pap addChild:notes];
    
    [self addChild:pap];
}

#pragma mark

- (SKSpriteNode *)paperNode{
    SKSpriteNode *paper = [[SKSpriteNode alloc] initWithColor:[SKColor whiteColor] size:CGSizeMake(768, 1024)];
    
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

- (SKSpriteNode *)assignmentLabel{
    SKSpriteNode *label = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(325, 30)];
    
    return label;
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
    eg.name = @"eg";
    eg.text = @"Examples";
    eg.fontColor = [SKColor blackColor];
    eg.fontSize = 20;
    return eg;
}

- (SKSpriteNode *) examplesLabel{
    SKSpriteNode *ex = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(250, 25)];
    
    return ex;
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

- (SKSpriteNode *) linkToFormula{
    SKSpriteNode *fLink = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(350, 30)];
    
    return fLink;
}

- (SKLabelNode *) formula{
    SKLabelNode *form = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    form.name = @"form";
    form.text = @"Formulas";
    form.fontSize = 33;
    form.fontColor = [SKColor redColor];
    return form;
}

#pragma mark

- (SKSpriteNode *) linkToNotes{
    SKSpriteNode *nLink = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(350, 30)];
    
    return nLink;
}

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
        
        if([node.name isEqualToString:@"assign"]){
            assignments *aa = [[assignments alloc] initWithSize:CGSizeMake(768, 1024)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:aa transition:doors];
        }
        
        if([node.name isEqualToString:@"form"]){
            formulas *ff = [[formulas alloc] initWithSize:CGSizeMake(768, 1024)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:ff transition:doors];
        }
        
        if([node.name isEqualToString:@"n"]){
            notes *nn = [[notes alloc] initWithSize:CGSizeMake(768, 1024)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:nn transition:doors];
        }
        
        if([node.name isEqualToString:@"eg"]){
            example *ee = [[example alloc] initWithSize:CGSizeMake(768, 1024)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:ee transition:doors];        }
        
        
    }
}


@end
