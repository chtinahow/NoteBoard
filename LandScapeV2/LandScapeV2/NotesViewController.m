//
//  NotesViewController.m
//  LandScapeV2
//
//  Created by Student on 6/16/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "NotesViewController.h"

@implementation NotesViewController

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    _tappedTwice = NO;
    
    if([touch tapCount] == 2){
        _tappedTwice = YES;
        CGPoint location = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:location];
    }
    else if([touch tapCount] == 1 && _tappedTwice == NO){
        
    }
    
}


@end
