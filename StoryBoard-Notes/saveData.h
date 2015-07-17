//
//  saveData.h
//  StoryBoard-Notes
//
//  Created by Student on 7/6/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface saveData : NSObject <NSCoding>

@property NSMutableArray* page;
@property NSMutableArray* array;
@property SKSpriteNode *node;
@property SKTexture *current;
@property SKTexture *saved;
@property SKLabelNode *date;
@property CGPoint pos1;
@property CGPoint pos2;
@property CGPoint pos3;
@property CGPoint statPos;
@property CGPoint statPos2;
@property CGPoint statPos3;
@property BOOL isStacked;


+(instancetype)sharedData;
-(void)save;
-(void)reset;

@end
