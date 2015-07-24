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
#import "MoreShuffle.h"
#import "weeksNotesViewController.h"

@interface NotesViewController ()
@end

@implementation NotesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //code needed to access notifier
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(presentWeeksNotesViewController) name:@"gotoNotes" object:nil];
}

-(void) viewWillAppear:(BOOL)animated{
    MoreShuffle *math = [[MoreShuffle alloc] initWithSize:CGSizeMake(2000, 1768)];
    SKView *view = (SKView *) self.view;
    [view presentScene:math];
}

//sets up other view controller
-(void) presentWeeksNotesViewController
{
    weeksNotesViewController *wViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabView"];
    [self.navigationController pushViewController:wViewController animated:YES];
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
