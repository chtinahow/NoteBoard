//
//  saveData.m
//  StoryBoard-Notes
//
//  This file defines the save mechanics for the sprite kit scene with the draggable and clickable nodes.
//  Its primary purpose is to save the user preferences for the background and/or text color.
//  It utilizes NSCoding protocol, which declares two required methods in addition to the others presented:
//      1) encodeWithCoder - converts object into a buffer of data
//      2) initWithCoder - converts a buffer of data into object
//  The onject(s) in this case happen to be SKTexture, SKLabelNode, and CGPoints.
//
//  Created by Student on 7/6/15.
//  Copyright (c) 2015 Kimberly Sookoo. All rights reserved.
//

#import "saveData.h"

@implementation saveData

static NSString* const currentTexture = @"currentTexture";
static NSString* const dateColor = @"dateColor";
static NSString* const posi1 = @"posi1";
static NSString* const posi2 = @"posi2";
static NSString* const posi3 = @"posi3";

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [self init];
    if (self) {
        _current = [decoder decodeObjectForKey:currentTexture];
        _date = [decoder decodeObjectForKey:dateColor];
        _pos1 = [decoder decodeCGPointForKey:posi1];
        _pos2 = [decoder decodeCGPointForKey:posi2];
        _pos3 = [decoder decodeCGPointForKey:posi3];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.current forKey:currentTexture];
    [encoder encodeObject:self.date forKey:dateColor];
    [encoder encodeCGPoint:self.pos1 forKey:posi1];
    [encoder encodeCGPoint:self.pos2 forKey:posi2];
    [encoder encodeCGPoint:self.pos3 forKey:posi3];
}

+(NSString*)filePath
{
    static NSString* filePath = nil;
    if (!filePath) {
        filePath =
        [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
         stringByAppendingPathComponent:@"data"];
    }
    return filePath;
}

+(instancetype)loadInstance
{
    NSData* decodedData = [NSData dataWithContentsOfFile: [saveData filePath]];
    if (decodedData) {
        saveData* data = [NSKeyedUnarchiver unarchiveObjectWithData:decodedData];
        return data;
    }
    
    return [[saveData alloc] init];
}

+ (instancetype)sharedData {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self loadInstance];
    });
    
    return sharedInstance;
}

-(void)save
{
    NSData* encodedData = [NSKeyedArchiver archivedDataWithRootObject: self];
    [encodedData writeToFile:[saveData filePath] atomically:YES];
}

@end
