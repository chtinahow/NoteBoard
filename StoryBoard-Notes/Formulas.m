//
//  Formulas.m
//  StoryBoard-Notes
//
//  Created by Student on 6/17/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "Formulas.h"
#import "NotesSection.h"
#import "Definitions.h"
#import "Assignments.h"

@interface Formulas()

@property BOOL created;

@end

@implementation Formulas{
    SKSpriteNode *assignButton;
    SKSpriteNode *nLink;
    SKSpriteNode *dLink;
    SKSpriteNode *sec2;
    SKSpriteNode *sec3;
    SKSpriteNode *sec4;
    SKSpriteNode *sec5;
    SKSpriteNode *sec6;
    SKSpriteNode *sec7;
}

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
    date.position = CGPointMake(-470, 340);
    [pap addChild:date];
    
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
    
    //links to specific sections in notes
    
    sec2 = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(250, 25)];
    sec2.position = CGPointMake(200, 165);
    sec2.name = @"sec2";
    [pap addChild:sec2];
    
    SKLabelNode *label2 = [self sectionInNotesLabel];
    label2.position = CGPointMake(200, 160);
    label2.name = @"sec2";
    [pap addChild:label2];
    
    sec3 = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(250, 25)];
    sec3.position = CGPointMake(200, 85);
    sec3.name = @"sec3";
    [pap addChild:sec3];
    
    SKLabelNode *label3 = [self sectionInNotesLabel];
    label3.position = CGPointMake(200, 80);
    label3.name = @"sec3";
    [pap addChild:label3];
    
    sec4 = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(250, 25)];
    sec4.position = CGPointMake(200, 5);
    sec4.name = @"sec4";
    [pap addChild:sec4];
    
    SKLabelNode *label4 = [self sectionInNotesLabel];
    label4.position = CGPointMake(200, 0);
    label4.name = @"sec4";
    [pap addChild:label4];
    
    sec5 = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(250, 25)];
    sec5.position = CGPointMake(200, -75);
    sec5.name = @"sec5";
    [pap addChild:sec5];
    
    SKLabelNode *label5 = [self sectionInNotesLabel];
    label5.position = CGPointMake(200, -80);
    label5.name = @"sec5";
    [pap addChild:label5];
    
    sec6 = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(250, 25)];
    sec6.position = CGPointMake(200, -155);
    sec6.name = @"sec6";
    [pap addChild:sec6];
    
    SKLabelNode *label6 = [self sectionInNotesLabel];
    label6.position = CGPointMake(200, -160);
    label6.name = @"sec6";
    [pap addChild:label6];
    
    sec7 = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(250, 25)];
    sec7.position = CGPointMake(200, -235);
    sec7.name = @"sec7";
    [pap addChild:sec7];
    
    SKLabelNode *label7 = [self sectionInNotesLabel];
    label7.position = CGPointMake(200, -240);
    label7.name = @"sec7";
    [pap addChild:label7];
    
    //actual mock formulas
    
    SKLabelNode *f2 = [self formula2];
    f2.position = CGPointMake(-200, 165);
    [pap addChild:f2];
    
    SKLabelNode *f3 = [self formula3];
    f3.position = CGPointMake(-200, 85);
    [pap addChild:f3];
    
    SKLabelNode *f4 = [self formula4];
    f4.position = CGPointMake(-200, 5);
    [pap addChild:f4];
    
    SKLabelNode *f5 = [self formula5];
    f5.position = CGPointMake(-200, -75);
    [pap addChild:f5];
    
    SKLabelNode *f6 = [self formula6];
    f6.position = CGPointMake(-200, -155);
    [pap addChild:f6];
    
    SKLabelNode *f7 = [self formula7];
    f7.position = CGPointMake(-200, -235);
    [pap addChild:f7];
    
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

- (SKLabelNode *) formula1{
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    label.name = @"f1";
    label.text = @"Product Rule: D(f(x)g(x)) = f(x)g'(x) + f'(x)g(x)";
    label.fontColor = [SKColor blackColor];
    label.fontSize = 15;
    return label;
}

- (SKLabelNode *) formula2{
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    label.name = @"f2";
    label.text = @"Integration by Parts: uv - D(vdu)";
    label.fontColor = [SKColor blackColor];
    label.fontSize = 15;
    return label;
}

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
        if([node.name isEqualToString:@"sec2"]) {
            sec2.alpha = 0.5;
        }
        if([node.name isEqualToString:@"sec3"]) {
            sec3.alpha = 0.5;
        }
        if([node.name isEqualToString:@"sec4"]) {
            sec4.alpha = 0.5;
        }
        if([node.name isEqualToString:@"sec5"]) {
            sec5.alpha = 0.5;
        }
        if([node.name isEqualToString:@"sec6"]) {
            sec6.alpha = 0.5;
        }
        if([node.name isEqualToString:@"sec7"]) {
            sec7.alpha = 0.5;
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
        if(dLink.alpha == 0.5 && [node.name isEqualToString:@"def"]){
            dLink.alpha = 1.0;
            Definitions *dd = [[Definitions alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:dd transition:doors];
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

