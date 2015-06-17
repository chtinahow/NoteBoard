//
//  NotesViewController.m
//  LandScapeV2
//
//  Created by Student on 6/16/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "NotesViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "LandScapeCalcNotes.h"

@interface NotesViewController ()

@end

@implementation NotesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    SKView *spriteView = (SKView *) self.view;
    spriteView.showsDrawCount = YES;
    spriteView.showsNodeCount = YES;
    spriteView.showsFPS = YES;
}

-(void) viewWillAppear:(BOOL)animated{
    LandScapeCalcNotes *math = [[LandScapeCalcNotes alloc] initWithSize:CGSizeMake(768, 1024)];
    math.notesy = self;
    SKView *view = (SKView *) self.view;
    [view presentScene:math];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    UITabBarController *tabby = [[UITabBarController alloc] init];
    
    // Pass the selected object to the new view controller.
}*/


@end
