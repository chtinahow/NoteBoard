//
//  MainPage.m
//  StoryBoard-Notes
//
//  Created by Student on 6/16/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "MainPage.h"
#import "DifChapters.h"

@interface MainPage()

@property BOOL created;

@end

@implementation MainPage{
    SKSpriteNode *cButton;
    SKSpriteNode *dButton;
    SKSpriteNode *pButton;
    
     UIView *viewy;
}

#pragma mark

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        viewy = [[UIView alloc] initWithFrame:CGRectMake(0, 225, 1024, 40)];
        viewy.backgroundColor = [UIColor clearColor];
        
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
    
    return self;
}

- (void) didMoveToView:(SKView *)view{
    if(!self.created){
        [self createScene];
        self.created = YES;
    }
    [self.view addSubview:viewy];
}

- (void)willMoveFromView:(SKView *)view
{
    [super willMoveFromView:view];
    
    [viewy removeFromSuperview];
}

#pragma mark

- (void)createScene{
    self.backgroundColor = [SKColor grayColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    SKSpriteNode *pap = [self paperNode];
    pap.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
    cButton = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(350, 55)];
    cButton.name = @"calc";
    cButton.position = CGPointMake(0, 280);
    [pap addChild:cButton];
    
    SKLabelNode *calc = [self calc];
    calc.position = CGPointMake(0, 260);
    [pap addChild:calc];
    
    //Discrete Display
    dButton = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(550, 55)];
    dButton.name = @"disc";
    dButton.position = CGPointMake(0, 20);
    [pap addChild:dButton];
    
    SKLabelNode *disc = [self discrete];
    disc.position = CGPointMake(0, 0);
    [pap addChild:disc];
    
    //Physics Display
    pButton = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(350, 55)];
    pButton.name = @"phys";
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

- (SKLabelNode *)discrete{
    SKLabelNode *disc = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    disc.name = @"disc";
    disc.text = @"Discrete Mathematics";
    disc.fontColor = [SKColor blackColor];
    disc.fontSize = 50;
    return disc;
}

- (SKLabelNode *)physics{
    SKLabelNode *phys = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    phys.name = @"phys";
    phys.text = @"Physics";
    phys.fontSize = 50;
    phys.fontColor =[SKColor blackColor];
    return phys;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for(UITouch *touch in touches){
        CGPoint location = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:location];
        
        if([node.name isEqualToString:@"calc"]){
            cButton.alpha = 0.5;
        }
        if([node.name isEqualToString:@"disc"]){
            dButton.alpha = 0.5;
        }
        if([node.name isEqualToString:@"phys"]){
            pButton.alpha = 0.5;
        }
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for(UITouch *touch in touches){
        CGPoint location = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:location];
        if(cButton.alpha == 0.5 && [node.name isEqualToString:@"calc"]){
            cButton.alpha = 1.0;
            DifChapters *ss = [[DifChapters alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [viewy removeFromSuperview];
            [view presentScene:ss transition:doors];
        }
        if(dButton.alpha == 0.5 && [node.name isEqualToString:@"disc"]){
            dButton.alpha = 1.0;
            DifChapters *ss = [[DifChapters alloc] initWithSize:CGSizeMake(768, 1024)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [viewy removeFromSuperview];
            [view presentScene:ss transition:doors];
        }
        if(pButton.alpha == 0.5 && [node.name isEqualToString:@"phys"]){
            pButton.alpha = 1.0;
            DifChapters *ss = [[DifChapters alloc] initWithSize:CGSizeMake(768, 1024)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [viewy removeFromSuperview];
            [view presentScene:ss transition:doors];
        }
    }
}


@end
