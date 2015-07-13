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

static NSString* const array = @"array";
static NSString* const newNode = @"newNode";
static NSString* const currentTexture = @"currentTexture";
static NSString* const dateColor = @"dateColor";

static NSString* const posi1 = @"posi1";
static NSString* const posi2 = @"posi2";
static NSString* const posi3 = @"posi3";

static NSString* const statPos = @"statPos";
static NSString* const statPos2 = @"statPos2";
static NSString* const statPos3 = @"statPos3";

static NSString* const isStacked = @"isStacked";

static NSString* const page = @"page";

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [self init];
    if (self) {
        if(!_array){
         _array = [[NSMutableArray alloc] init];
        }
        _array = [[decoder decodeObjectForKey:array] mutableCopy];
        _node = [decoder decodeObjectForKey:newNode];
        _current = [decoder decodeObjectForKey:currentTexture];
        _date = [decoder decodeObjectForKey:dateColor];
        
        _pos1 = [decoder decodeCGPointForKey:posi1];
        _pos2 = [decoder decodeCGPointForKey:posi2];
        _pos3 = [decoder decodeCGPointForKey:posi3];
        
        _statPos = [decoder decodeCGPointForKey:statPos];
        _statPos2 = [decoder decodeCGPointForKey:statPos2];
        _statPos3 = [decoder decodeCGPointForKey:statPos3];
        
        _isStacked = [decoder decodeBoolForKey:isStacked];
        
        if (!_page) {
            _page = [[NSMutableArray alloc] init];
        }
        _page = [[decoder decodeObjectForKey:page] mutableCopy];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    if(!self.array){
     self.array = [[NSMutableArray alloc] init];
    }
    [encoder encodeObject:self.array forKey:array];
    [encoder encodeObject:self.node forKey:newNode];
    [encoder encodeObject:self.current forKey:currentTexture];
    [encoder encodeObject:self.date forKey:dateColor];
    
    [encoder encodeCGPoint:self.pos1 forKey:posi1];
    [encoder encodeCGPoint:self.pos2 forKey:posi2];
    [encoder encodeCGPoint:self.pos3 forKey:posi3];
    
    [encoder encodeCGPoint:self.statPos forKey:statPos];
    [encoder encodeCGPoint:self.statPos2 forKey:statPos2];
    [encoder encodeCGPoint:self.statPos3 forKey:statPos3];
    
    [encoder encodeBool:self.isStacked forKey:isStacked];
    
    if (!self.page) {
        self.page = [[NSMutableArray alloc] init];
    }
    [encoder encodeObject:self.page forKey:page];
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

-(void)reset{
    self.current = nil;
    self.date = nil;
    self.node = nil;
    [self.array removeAllObjects];
}

@end
