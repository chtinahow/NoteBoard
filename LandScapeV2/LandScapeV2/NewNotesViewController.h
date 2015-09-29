//
//  NewNotesViewController.h
//  LandScapeV2
//
//  Created by Student on 7/31/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "ViewController.h"

@interface NewNotesViewController : ViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPopoverControllerDelegate>


@property UIPopoverController *popOverController;

@property (weak, nonatomic) IBOutlet UITextView *textView;

-(IBAction)unwindToList:(UIStoryboardSegue *)segue;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *increaseTextSize;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *decreaseTextSize;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *highlightColor;

@end
