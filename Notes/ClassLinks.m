//
//  ClassLinks.m
//  Notes
//
//  Created by Student on 6/9/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "ClassLinks.h"
#import "definitions.h"
#import "notes.h"
#import "formulas.h"
#import "assignments.h"

@interface ClassLinks()

@property BOOL created;

@end

@implementation ClassLinks

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
    SKSpriteNode *assignButton = [self assignmentLabel];
    assignButton.position = CGPointMake(-345, 315);
    [pap addChild:assignButton];
    
    //add due date
    SKLabelNode *assign = [self assignmentDue];
    assign.position = CGPointMake(-350,305);
    [pap addChild:assign];
    
    //basic links on page
    SKSpriteNode *defB = [self linkToDefs];
    defB.position = CGPointMake(-200, 150);
    [pap addChild:defB];
    
    SKLabelNode *def = [self definition];
    def.position = CGPointMake(-200, 140);
    [pap addChild:def];
    
    SKSpriteNode *formB = [self linkToFormula];
    formB.position = CGPointMake(-200, -50);
    [pap addChild:formB];
    
    SKLabelNode *form = [self formula];
    form.position = CGPointMake(-200, -60);
    [pap addChild:form];
    
    SKSpriteNode *noteB = [self linkToNotes];
    noteB.position = CGPointMake(-200, -290);
    [pap addChild:noteB];
    
    SKLabelNode *note = [self notes];
    note.position = CGPointMake(-200, -300);
    [pap addChild:note];
    
    [self addChild:pap];
}

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

- (SKLabelNode *)assignmentDue{
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

- (SKLabelNode *) definition{
    SKLabelNode *def = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    def.name = @"def";
    def.text = @"Definitions";
    def.fontColor = [SKColor redColor];
    def.fontSize = 33;
    return def;
}

- (SKSpriteNode *) linkToDefs{
    SKSpriteNode *dLink = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(300, 35)];
    
    return dLink;
}

- (SKLabelNode *) formula{
    SKLabelNode *form = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    form.name = @"form";
    form.text = @"Formulas";
    form.fontSize = 33;
    form.fontColor = [SKColor redColor];
    return form;
}

- (SKSpriteNode *) linkToFormula{
    SKSpriteNode *fLink = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(300, 35)];
    
    return fLink;
}

- (SKLabelNode *) notes{
    SKLabelNode *notes = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    notes.name = @"notes";
    notes.text = @"Notes";
    notes.fontSize = 33;
    notes.fontColor = [SKColor redColor];
    return notes;
}

- (SKSpriteNode *) linkToNotes{
    SKSpriteNode *nLink = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(300, 35)];
    
    return nLink;
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for(UITouch *touch in touches){
        CGPoint location = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:location];
        
        if([node.name isEqualToString:@"assign"]){
            assignments *aa = [[assignments alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:aa transition:doors];
        }
        
        if([node.name isEqualToString:@"def"]){
            definitions *dd = [[definitions alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:dd transition:doors];
        }
        
        if([node.name isEqualToString:@"notes"]){
            notes *nn = [[notes alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:nn transition:doors];
        }
        
        if([node.name isEqualToString:@"form"]){
            formulas *ff = [[formulas alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:ff transition:doors];
        }
    }
}

@end
