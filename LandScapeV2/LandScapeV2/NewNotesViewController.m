//
//  NewNotesViewController.m
//  LandScapeV2
//
//  A few updates have been made; camera roll to be added
//  Created by Student on 7/31/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "NewNotesViewController.h"

@interface NewNotesViewController ()

@property (weak, nonatomic) IBOutlet UITextField *currDate;

@end

@implementation NewNotesViewController{
    UISwipeGestureRecognizer *leftSwipe;
    
    UIView *portraitView;
    UIView *landscapeView;
    
    BOOL portrait;
    BOOL landscape;
    
    UIButton *addImage;
    UIButton *addText;
    UIButton *addVideo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //date things
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *now = [[NSDate alloc]init];
    NSString *theDate = [dateFormat stringFromDate:now];
    _currDate.text = theDate;
    _currDate.userInteractionEnabled = NO;
    
    //leftSwipe
    leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action: @selector(orientationChanged:)];
    [leftSwipe setDirection:UISwipeGestureRecognizerDirectionLeft];
    [leftSwipe setNumberOfTouchesRequired:2];
    [self.view addGestureRecognizer:leftSwipe];
    
    addImage = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addImage.backgroundColor = [UIColor grayColor];
    [addImage setTitle:@"Add Image" forState:UIControlStateNormal];
    [addImage addTarget:self action:@selector(addImage:) forControlEvents:UIControlEventTouchUpInside];
    
    addText = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addText.backgroundColor = [UIColor grayColor];
    [addText setTitle:@"Add Text" forState:UIControlStateNormal];
    
    addVideo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addVideo.backgroundColor = [UIColor grayColor];
    [addVideo setTitle:@"Add Video" forState:UIControlStateNormal];
}

//sends out notification that orientation has been changed
-(void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(orientationChanged:)    name:UIDeviceOrientationDidChangeNotification  object:nil];
}

//removes notification
-(void)viewDidDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

//updates view based on changes
- (void)orientationChanged:(NSNotification *)notification{
    [self adjustViewsForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}

//actual code for updating in this method
- (void) adjustViewsForOrientation:(UIInterfaceOrientation) orientation {
    
    switch (orientation)
    {
        case UIInterfaceOrientationPortrait:
        case UIInterfaceOrientationPortraitUpsideDown:
        {
            if (landscape == YES) {
                [landscapeView removeFromSuperview];
                landscape = NO;
            }
            
            portraitView = [[UIView alloc] initWithFrame:CGRectMake(600, 0, 200, self.view.frame.size.height)];
            portraitView.backgroundColor = [UIColor lightGrayColor];
            
            addImage.frame = CGRectMake(20, 300, 120, 30);
            addText.frame = CGRectMake(20, 350, 120, 30);
            addVideo.frame = CGRectMake(20, 400, 120, 30);
            
            [self.view addSubview:portraitView];
            [portraitView addSubview:addImage];
            [portraitView addSubview:addText];
            [portraitView addSubview:addVideo];
            portrait = YES;
        }
            
            break;
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight:
        {
            if (portrait == YES) {
                [portraitView removeFromSuperview];
                portrait = NO;
            }
            
            landscapeView = [[UIView alloc] initWithFrame:CGRectMake(725, 0, 300, self.view.frame.size.height)];
            landscapeView.backgroundColor = [UIColor lightGrayColor];
            
            addImage.frame = CGRectMake(100, 300, 120, 30);
            addText.frame = CGRectMake(100, 350, 120, 30);
            addVideo.frame = CGRectMake(100, 400, 120, 30);
            
            [self.view addSubview:landscapeView];
            [landscapeView addSubview:addImage];
            [landscapeView addSubview:addText];
            [landscapeView addSubview:addVideo];
            landscape = YES;
        }
            break;
        case UIInterfaceOrientationUnknown:break;
    }
}

- (IBAction)addImage:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)unwindToList:(UIStoryboardSegue *)segue
{
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
