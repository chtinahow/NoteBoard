//
//  TestShuffle.m
//  StoryBoard-Notes
//
//  Created by Student on 7/14/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "TestShuffle.h"

@interface TestShuffle()

@property BOOL worldMovedForUpdate;

@end

@implementation TestShuffle{
    SKNode *myWorld;
    SKSpriteNode *mainCharacter;
}

#define cameraEdge 150

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        /* Setup your scene here */
        //320 568
        
        
        self.backgroundColor = [SKColor whiteColor];
        
        myWorld = [[SKNode alloc] init];
        [self addChild:myWorld];
        
        mainCharacter = [SKSpriteNode spriteNodeWithImageNamed:@"0"];
        mainCharacter.physicsBody.dynamic = YES;
        mainCharacter.name = @"player";
        
        mainCharacter.position = CGPointMake(20, 20);
        
        CGRect totalScreenSize = CGRectMake(0, 0, 800, 320);
        
        SKSpriteNode *box = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(60, 60)];
        
        SKSpriteNode *boxTwo = [SKSpriteNode spriteNodeWithColor:[SKColor greenColor] size:CGSizeMake(60, 60)];
        SKSpriteNode *boxThree = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(60, 60)];
        boxThree.position = CGPointMake(40, 50);
        
        [myWorld addChild:boxThree];
        
        boxTwo.position = CGPointMake(1100, 50);
        
        box.position = CGPointMake(650, 50);
        
        [myWorld addChild:box];
        [myWorld addChild:boxTwo];
        
        
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:totalScreenSize];
        
        self.physicsWorld.gravity = CGVectorMake(0, -5);
        mainCharacter.name = @"mainCharacter";
        
        
        mainCharacter.physicsBody.linearDamping = 0;
        mainCharacter.physicsBody.friction = 0;
        mainCharacter.physicsBody.restitution = 0;
        mainCharacter.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:mainCharacter.size];
        
        [myWorld addChild:mainCharacter];
        
        [self addChild:[self buildLeftButton]];
        [self addChild:[self buildRightButton]];
        
    }
    
    return self;
}

- (void)didSimulatePhysics
{
    SKSpriteNode *hero = mainCharacter;
    
    if(hero)
    {
        CGPoint heroPosition = hero.position;
        CGPoint worldPosition = myWorld.position;
        
        NSLog(@"%f", heroPosition.x);
        
        CGFloat xCoordinate = worldPosition.x + heroPosition.x;
        
        if(xCoordinate < cameraEdge && heroPosition.x > 0)
        {
            worldPosition.x = worldPosition.x - xCoordinate + cameraEdge;
            self.worldMovedForUpdate = YES;
        }
        
        else if(xCoordinate > (self.frame.size.width - cameraEdge) && heroPosition.x < 2000)
        {
            worldPosition.x = worldPosition.x + (self.frame.size.width - xCoordinate) - cameraEdge;
            self.worldMovedForUpdate = YES;
        }
        
        myWorld.position = worldPosition;
    }
}

-(SKSpriteNode *)buildLeftButton
{
    SKSpriteNode *leftButton = [SKSpriteNode spriteNodeWithImageNamed:@"left"];
    leftButton.position = CGPointMake(20, 20);
    leftButton.name = @"leftButton";
    leftButton.zPosition = 1.0;
    return leftButton;
}

-(SKSpriteNode *)buildRightButton
{
    SKSpriteNode *leftButton = [SKSpriteNode spriteNodeWithImageNamed:@"right"];
    leftButton.position = CGPointMake(60, 20);
    leftButton.name = @"rightButton";
    leftButton.zPosition = 1.0;
    return leftButton;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if([node.name isEqualToString:@"leftButton"])
    {
        [mainCharacter.physicsBody applyImpulse:CGVectorMake(-120, 0)];
    }
    
    else if([node.name isEqualToString:@"rightButton"])
    {
        [mainCharacter.physicsBody applyImpulse:CGVectorMake(120, 10)];
    }
}

    
@end
