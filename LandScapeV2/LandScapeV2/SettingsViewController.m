//
//  SettingsViewController.m
//  LandScapeV2
//
//  Created by Student on 7/6/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "SettingsViewController.h"


@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mySlider.minimumValue = 0;
    self.mySlider.maximumValue = 50;
}

- (IBAction)sliderChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    NSInteger val = lround(slider.value);
    self.myLabel.text = [NSString stringWithFormat:@"%dx",val];

}

- (void)didReceiveMemoryWarning
{
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


// This is the start for the application of sending the infor for the zooming amount in settings

- (IBAction)applyZoom:(id)sender
{
     //NS *zoomValue = self.mySlider.value;
}

- (IBAction)resetDefault:(id) sender
{
    //UISlider * slider;
    _mySlider.value = 5;
    //NSInteger val = lround(_mySlider.value);
    self.myLabel.text = [NSString stringWithFormat:@"%dx",5];

}

//-(void)setValue:(float)5 animated: YES;

@end
