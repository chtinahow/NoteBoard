//
//  NewNotesViewController.h
//  LandScapeV2
//
//  Created by Student on 7/31/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "ViewController.h"

@interface NewNotesViewController : ViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;


-(IBAction)unwindToList:(UIStoryboardSegue *)segue;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
