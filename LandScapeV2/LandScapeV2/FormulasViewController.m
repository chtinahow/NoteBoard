//
//  FormulasViewController.m
//  LandScapeV2
//
//  Created by Student on 6/24/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "FormulasViewController.h"

@interface FormulasViewController ()
@property (weak, nonatomic) IBOutlet UITextField *currDate;
@end

@implementation FormulasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //date things
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *now = [[NSDate alloc]init];
    NSString *theDate = [dateFormat stringFromDate:now];
    _currDate.text = theDate;
    _currDate.userInteractionEnabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end