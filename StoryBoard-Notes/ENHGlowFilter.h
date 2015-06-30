//
//  ENHGlowFilter.h
//  StoryBoard-Notes
//
//  Created by Kimberly Sookoo on 6/25/15.
//  Copyright (c) 2015 Kimberly Sookoo. All rights reserved.
//

#import <CoreImage/CoreImage.h>
#import <UIKit/UIKit.h>

@interface ENHGlowFilter : CIFilter

@property (strong, nonatomic) UIColor *glowColor;
@property (strong, nonatomic) CIImage *inputImage;
@property (strong, nonatomic) NSNumber *inputRadius;
@property (strong, nonatomic) CIVector *inputCenter;

@end
