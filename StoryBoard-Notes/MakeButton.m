//
//  MakeButton.m
//  StoryBoard-Notes
//
//  Calculus Button
//  Created by Student on 6/17/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "MakeButton.h"

@implementation MakeButton
{
    SKSpriteNode *spriteA;
}

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        spriteA = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(350, 55)];
        spriteA.position = CGPointMake(0, 280);
        [self addChild:spriteA];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint touchLocation = [[touches anyObject] locationInNode:self];
    if([spriteA containsPoint:touchLocation])
        spriteA.alpha = 0.5;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(spriteA.alpha == 0.5)
        spriteA.alpha = 1.0;
}

@end
