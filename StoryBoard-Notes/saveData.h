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

@property SKTexture *current;
@property SKLabelNode *date;
@property CGPoint pos1;
@property CGPoint pos2;
@property CGPoint pos3;

+(instancetype)sharedData;
-(void)save;

@end
