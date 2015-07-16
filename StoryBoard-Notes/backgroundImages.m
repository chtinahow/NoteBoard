//
//  backgroundImages.m
//  StoryBoard-Notes
//
//  Created by Student on 7/16/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "backgroundImages.h"
#import "MoreShuffle.h"

@interface backgroundImages()

@property BOOL created; //checks to see if scene is created

@end

@implementation backgroundImages{
    //background images
    SKSpriteNode *image;
    SKSpriteNode *image2;
    SKSpriteNode *image3;
    SKSpriteNode *image4;
    SKSpriteNode *image5;
    SKSpriteNode *image6;
    SKSpriteNode *image7;
    SKSpriteNode *image8;
    //arrow to traverse pages
    SKSpriteNode *arrow;
    
    UISwipeGestureRecognizer *closeSwipe;
}

- (void)didMoveToView: (SKView *) view{
    self.anchorPoint = CGPointMake(0, 0);
    if (!self.created) {
        [self createScene];
        self.created = YES;
    }
    closeSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action: @selector(rightFlip:)];
    [closeSwipe setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:closeSwipe];
}

//removes the change background menu
-(void)rightFlip:(id)sender{
    [self.view removeGestureRecognizer:closeSwipe];
    MoreShuffle *backy = [[MoreShuffle alloc] initWithSize:CGSizeMake(2000, 1768)];
    SKView *view = (SKView *) self.view;
    [view presentScene:backy];
}

-(void)createScene{
    self.backgroundColor = [SKColor grayColor];
    self.scaleMode = SKSceneScaleModeFill;
    
    //creates clickable background images
    image = [SKSpriteNode spriteNodeWithColor:[SKColor yellowColor] size:CGSizeMake(50, 50)];
    image.position = CGPointMake(10, 350);
    image.name = @"image1";
    
    image2 = [SKSpriteNode spriteNodeWithImageNamed:@"IS787-189.jpg"];
    image2.size = CGSizeMake(50, 50);
    image2.position = CGPointMake(70, 350);
    image2.name = @"image2";
    
    image3 = [SKSpriteNode spriteNodeWithImageNamed:@"IS787-191.jpg"];
    image3.size = CGSizeMake(50, 50);
    image3.position = CGPointMake(-15, -20);
    image3.name = @"image3";
    
    image4 = [SKSpriteNode spriteNodeWithColor:[SKColor greenColor] size:CGSizeMake(50, 50)];
    image4.position = CGPointMake(-15, -180);
    image4.name = @"image4";
    
    image5 = [SKSpriteNode spriteNodeWithColor:[SKColor orangeColor] size:CGSizeMake(50, 50)];
    image5.position = CGPointMake(-15, -340);
    image5.name = @"image5";
    
    image6 = [SKSpriteNode spriteNodeWithColor:[SKColor purpleColor] size:CGSizeMake(50, 50)];
    image6.position = CGPointMake(-15, -500);
    image6.name = @"image6";
    
    image7 = [SKSpriteNode spriteNodeWithColor:[SKColor brownColor] size:CGSizeMake(50, 50)];
    image7.position = CGPointMake(-15, -660);
    image7.name = @"image7";
    
    image8 = [SKSpriteNode spriteNodeWithImageNamed:@"notebook-page.jpg"];
    image8.size = CGSizeMake(50, 50);
    image8.position = CGPointMake(-15, -820);
    image8.name = @"image8";
    
    //arrow to go cycle through backgrounds
    arrow = [SKSpriteNode spriteNodeWithImageNamed:@"transparent-arrow-th.png"];
    arrow.size = CGSizeMake(100, 30);
    arrow.position = CGPointMake(-15, -1150);
    arrow.name = @"arrow";
    
    [self addChild:image];
    [self addChild:image2];
    [self addChild:image3];
    [self addChild:image4];
    [self addChild:image5];
    [self addChild:image6];
    [self addChild:image7];
    [self addChild:image8];
    [self addChild:arrow];
}


@end
