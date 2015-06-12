//
//  formulas.m
//  Notes
//
//  The "Formulas" section of the layout. Again, subject to change.
//  Created by Kimberly Sookoo on 6/9/15.
//  Copyright (c) 2015 Kimberly Sookoo. All rights reserved.
//

#import "formulas.h"
#import "definitions.h"
#import "notes.h"
#import "assignments.h"

@interface formulas()

@property BOOL created;

@end

@implementation formulas

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
    SKLabelNode *title = [self formulaTitle];
    title.position = CGPointMake(0, 360);
    [pap addChild:title];
    
    //links to specific sections in notes
    SKSpriteNode *sec = [self sectionInNotes];
    sec.position = CGPointMake(200, 245);
    [pap addChild:sec];
    
    SKLabelNode *label = [self sectionInNotesLabel];
    label.position = CGPointMake(200, 240);
    [pap addChild:label];
    
    SKSpriteNode *sec2 = [self sectionInNotes];
    sec2.position = CGPointMake(200, 165);
    [pap addChild:sec2];
    
    SKLabelNode *label2 = [self sectionInNotesLabel];
    label2.position = CGPointMake(200, 160);
    [pap addChild:label2];
    
    SKSpriteNode *sec3 = [self sectionInNotes];
    sec3.position = CGPointMake(200, 85);
    [pap addChild:sec3];
    
    SKLabelNode *label3 = [self sectionInNotesLabel];
    label3.position = CGPointMake(200, 80);
    [pap addChild:label3];
    
    SKSpriteNode *sec4 = [self sectionInNotes];
    sec4.position = CGPointMake(200, 5);
    [pap addChild:sec4];
    
    SKLabelNode *label4 = [self sectionInNotesLabel];
    label4.position = CGPointMake(200, 0);
    [pap addChild:label4];
    
    SKSpriteNode *sec5 = [self sectionInNotes];
    sec5.position = CGPointMake(200, -75);
    [pap addChild:sec5];
    
    SKLabelNode *label5 = [self sectionInNotesLabel];
    label5.position = CGPointMake(200, -80);
    [pap addChild:label5];
    
    SKSpriteNode *sec6 = [self sectionInNotes];
    sec6.position = CGPointMake(200, -155);
    [pap addChild:sec6];
    
    SKLabelNode *label6 = [self sectionInNotesLabel];
    label6.position = CGPointMake(200, -160);
    [pap addChild:label6];
    
    SKSpriteNode *sec7 = [self sectionInNotes];
    sec7.position = CGPointMake(200, -235);
    [pap addChild:sec7];
    
    SKLabelNode *label7 = [self sectionInNotesLabel];
    label7.position = CGPointMake(200, -240);
    [pap addChild:label7];
    
    //actual mock formulas
    SKLabelNode *f1 = [self formula1];
    f1.position = CGPointMake(-200, 245);
    [pap addChild:f1];
    
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
    SKSpriteNode *fLink = [self linkToNotes];
    fLink.position = CGPointMake(0, -340);
    [pap addChild:fLink];
    
    //Notes title
    SKLabelNode *form = [self notes];
    form.position = CGPointMake(0, -350);
    [pap addChild:form];
    
    //add second Link (to notes section)
    SKSpriteNode *dLink = [self linkToDefs];
    dLink.position = CGPointMake(0, -390);
    [pap addChild:dLink];
    
    //Definitions title
    SKLabelNode *defs = [self definition];
    defs.position = CGPointMake(0, -400);
    [pap addChild:defs];
    
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

- (SKLabelNode *) sectionInNotesLabel{
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    label.name = @"section";
    label.text = @"Section in Notes";
    label.fontColor = [SKColor blackColor];
    label.fontSize = 20;
    return label;
}

- (SKSpriteNode *)sectionInNotes{
    SKSpriteNode *section = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(250, 25)];
    return section;
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

- (SKSpriteNode *) linkToNotes{
    SKSpriteNode *nLink = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(350, 30)];
    
    return nLink;
}

- (SKLabelNode *) notes{
    SKLabelNode *n = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    n.name = @"n";
    n.text = @"Notes";
    n.fontSize = 33;
    n.fontColor = [SKColor redColor];
    return n;
}

#pragma mark

- (SKSpriteNode *) linkToDefs{
    SKSpriteNode *dLink = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(350, 30)];
    
    return dLink;
}

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
        
        if([node.name isEqualToString:@"assign"]){
            assignments *aa = [[assignments alloc] initWithSize:CGSizeMake(768, 1024)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:aa transition:doors];
        }
        
        if([node.name isEqualToString:@"n"] || [node.name isEqualToString:@"section"]){
            notes *nn = [[notes alloc] initWithSize:CGSizeMake(768, 1024)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:nn transition:doors];
        }
        
        if([node.name isEqualToString:@"def"]){
            definitions *dd = [[definitions alloc] initWithSize:CGSizeMake(768, 1024)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:dd transition:doors];
        }
    }
}

@end
