//
//  MathClasses.m
//  Notes
//
//  Created by Student on 6/9/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "MathClasses.h"
#import "ClassLinks.h"
#import "CalculusNotes.h"

@interface MathClasses()

@property BOOL created;

@end

@implementation MathClasses

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
    
    //Calc display
    SKSpriteNode *cButton = [self calcButton];
    cButton.position = CGPointMake(0, 280);
    [pap addChild:cButton];
    
    SKLabelNode *calc = [self calc];
    calc.position = CGPointMake(0, 260);
    [pap addChild:calc];
    
    //Discrete Display
    SKSpriteNode *dButton = [self discButton];
    dButton.position = CGPointMake(0, 20);
    [pap addChild:dButton];
    
    SKLabelNode *disc = [self discrete];
    disc.position = CGPointMake(0, 0);
    [pap addChild:disc];
    
    //Physics Display
    SKSpriteNode *pButton = [self physicsButton];
    pButton.position = CGPointMake(0, -260);
    [pap addChild:pButton];
    
    SKLabelNode *pLabel = [self physics];
    pLabel.position = CGPointMake(0, -280);
    [pap addChild:pLabel];
    
    [self addChild:pap];
}

- (SKSpriteNode *) paperNode{
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

//The following buttons are for presentation purposes only.
- (SKLabelNode *)calc{
    SKLabelNode *calc = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    calc.name = @"calc";
    calc.text = @"Calculus II";
    calc.fontSize = 50;
    calc.fontColor = [SKColor blackColor];
    return calc;
}

- (SKSpriteNode *)calcButton{
    SKSpriteNode* cButton = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(350, 55)];
    return cButton;
}

- (SKLabelNode *)discrete{
    SKLabelNode *disc = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    disc.name = @"disc";
    disc.text = @"Discrete Mathematics";
    disc.fontColor = [SKColor blackColor];
    disc.fontSize = 50;
    return disc;
}

- (SKSpriteNode *)discButton{
    SKSpriteNode *dButton = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(550, 55)];
    return dButton;
}

- (SKLabelNode *)physics{
    SKLabelNode *phys = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    phys.name = @"phys";
    phys.text = @"Physics";
    phys.fontSize = 50;
    phys.fontColor =[SKColor blackColor];
    return phys;
}

- (SKSpriteNode *)physicsButton{
    SKSpriteNode *pButton = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(350, 55)];
    return pButton;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for(UITouch *touch in touches){
        CGPoint location = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:location];
        
        if([node.name isEqualToString:@"disc"] || [node.name isEqualToString:@"phys"]){
            ClassLinks *dd = [[ClassLinks alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:dd transition:doors];
        }
        
        if([node.name isEqualToString:@"calc"]){
            CalculusNotes *cn = [[CalculusNotes alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [view presentScene:cn transition:doors];        }
    }
}


@end
