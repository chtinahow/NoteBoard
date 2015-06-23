//
//  ExampleView.m
//  StoryBoard-Notes
//
//  Created by Student on 6/23/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "ExampleView.h"

@interface ExampleView()

@property BOOL created;

@property UIScrollView *scrollView;

@end

@implementation ExampleView{
    UIWebView *webView;
    UIView *viewy;
}

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        //The UIScroll section
        CGSize layerSize        = CGSizeMake(768, 400);
        CGPoint layerPosition   = CGPointMake(20, 400);
        CGRect viewFrame = CGRectMake(layerPosition.x, layerPosition.y, layerSize.width-50, layerSize.height);
        _scrollView = [[UIScrollView alloc] initWithFrame:viewFrame];
        _scrollView.contentSize                     = CGSizeMake(120, 2000);
        _scrollView.scrollEnabled                   = YES;
        _scrollView.showsVerticalScrollIndicator  = YES;
        _scrollView.backgroundColor                 = [UIColor whiteColor];
        
        viewy = [[UIView alloc] initWithFrame:CGRectMake(0, 225, 1024, 40)];
        viewy.backgroundColor = [UIColor clearColor];
        
        [self createUIScene];
    }
    
    return self;
}

- (void) didMoveToView:(SKView *)view{
    if(!self.created){
        [self createScene];
        self.created = YES;
    }
    [self.view addSubview:_scrollView];
    [self.view addSubview:viewy];
}

- (void)willMoveFromView:(SKView *)view
{
    [super willMoveFromView:view];
    
    [_scrollView removeFromSuperview];
    [viewy removeFromSuperview];
}

-(void)createScene{
    self.backgroundColor = [SKColor grayColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    SKSpriteNode *pap = [self paperNode];
    pap.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    [self addChild:pap];
}

-(void) createUIScene{
     webView = [[UIWebView alloc] initWithFrame:CGRectMake(50, 0, 768, 350)];
     NSString *embedCode = @"<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/mDFKyp40XUc\" frameborder=\"0\" allowfullscreen></iframe>";
     [webView loadHTMLString:embedCode baseURL:nil];
     [_scrollView addSubview:webView];

    
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

#pragma mark

- (SKSpriteNode *)paperNode{
    SKSpriteNode *paper = [[SKSpriteNode alloc] initWithColor:[SKColor whiteColor] size:CGSizeMake(1024, 768)];
    
    return paper;
}

@end
