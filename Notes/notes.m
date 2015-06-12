//
//  notes.m
//  Notes
//
//  The "Notes" section of the layout. Again, subject to change.
//  Created by Kimberly Sookoo on 6/9/15.
//  Copyright (c) 2015 Kimberly Sookoo. All rights reserved.
//

#import "notes.h"
#import "formulas.h"
#import "definitions.h"
#import "assignments.h"

@interface notes()

@property BOOL created;

@end

@implementation notes

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
    SKLabelNode *title = [self notesTitle];
    title.position = CGPointMake(0, 360);
    [pap addChild:title];
    
  //added note to just do a quick link back
    
    //add first Link (to formula section)
    SKSpriteNode *fLink = [self linkToFormula];
    fLink.position = CGPointMake(0, -340);
    [pap addChild:fLink];
    
    //Formulas title
    SKLabelNode *form = [self formula];
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

- (SKLabelNode *) notesTitle{
    SKLabelNode * title = [SKLabelNode labelNodeWithFontNamed: @"Arial-BoldMT"];
    title.name = @"title";
    title.text = @"Notes";
    title.fontSize = 40;
    title.fontColor = [SKColor blackColor];
    return title;
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
        
        if([node.name isEqualToString:@"form"]){
            formulas *ff = [[formulas alloc] initWithSize:CGSizeMake(768, 1024)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:ff transition:doors];
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
