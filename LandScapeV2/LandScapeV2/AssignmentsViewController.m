
//
//  AssignmentsViewController.m
//  LandScapeV2
//
//  Created by Student on 6/24/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "AssignmentsViewController.h"
#import "AssignmentItem.h"

@interface AssignmentsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *currDate;
@property (nonatomic) int selectedRow;
@property NSMutableArray *toDoItems;
@property NSMutableArray *completedAssignments;

@end

@implementation AssignmentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //date things
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *now = [[NSDate alloc]init];
    NSString *theDate = [dateFormat stringFromDate:now];
    _currDate.text = theDate;
    _currDate.userInteractionEnabled = NO;
    
    //initialize the arrays here
    self.toDoItems = [[NSMutableArray alloc] init];
    self.completedAssignments = [[NSMutableArray alloc]init];
    
    //NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    //[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:indexPath.row] forKey:@"cycle"];
    //BOOL setCheckmarks = [[NSUserDefaults standardUserDefaults] boolForKey:@"cycle"];
    
    [self loadInitialData];

    //[self viewWillAppear:YES];
    
}

- (void) viewWillAppear:(BOOL)animated {
    //self.selectedRow = [[[NSUserDefaults standardUserDefaults] objectForKey:@"cycle"] intValue];
    //NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"array"];
   // NSLog(@"             %@", [[[NSUserDefaults standardUserDefaults] dictionaryRepresentation] allKeys]);
    
    //NSArray *savedArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
   // NSLog(@"stuffff       %@", savedArray[0]);

   
    
    
}
-(void) viewWillDisappear:(BOOL)animated{
    
    NSData *dataSave = [NSKeyedArchiver archivedDataWithRootObject:self.completedAssignments];
    [[NSUserDefaults standardUserDefaults] setObject:dataSave forKey:@"array"];

    
}
/*
 loadInitialData loads everything statically for the intial information that goes into the array
 */
-(void) loadInitialData{
    AssignmentItem *item1 = [[AssignmentItem alloc] init];
    item1.itemName = @"Chapter 10, section 3                                                                                                                                        4/23/15";
    [self.toDoItems addObject:item1];
    AssignmentItem *item2 = [[AssignmentItem alloc] init];
    item2.itemName = @"Chapter 10, section 5                                                                                                                                        4/25/15";
    [self.toDoItems addObject:item2];
    AssignmentItem *item3 = [[AssignmentItem alloc] init];
    item3.itemName = @"Chapter 10, section 7                                                                                                                                        4/30/15";
    [self.toDoItems addObject:item3];
    AssignmentItem *item4 = [[AssignmentItem alloc]init];
    item4.itemName = @"Chapter 10, section 9                                                                                                                                        5/2/15";
    [self.toDoItems addObject:item4];
}

/*- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
 AddToDoItemViewController *source = [segue sourceViewController];
 ToDoItem *item = source.toDoItem;
 if (item != nil) {
 [self.toDoItems addObject:item];
 [self.tableView reloadData];
 }
 
 }*/

-(IBAction)unwindToList:(UIStoryboardSegue *)segue {
    UITabBarController *tc = [self.storyboard instantiateViewControllerWithIdentifier:@"tabViews"];
    [self.navigationController pushViewController:tc animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.toDoItems count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    AssignmentItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    //NSLog(cell.textLabel.text);
    
  
    
    if (toDoItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.completedAssignments addObject:cell];
        //check the information inside of the cell itself
       // NSLog(@"This is what's being added: %@", cell);
        //if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
            //indicates that the cell does have the checkmark
           // NSLog(@"There is a checkmark with this cell   ( ͡° ͜ʖ ͡°)");
       // }
        
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        //adding the information for the cellAccessoryNone to the array
        [self.completedAssignments addObject:cell];
       // NSLog(@"This is what's being added: %@", cell);
        //if (cell.accessoryType != UITableViewCellAccessoryCheckmark) {
            //indicates that the cell does have the checkmark
            //NSLog(@"There isn't checkmark with this cell   ノ(;Ĺ̯̿̿ ;ノ)");
        //}
    }
    //[standardUserDefaults setObject:self.completedAssignments forKey:@"checkmark"];
    NSData *dataSave = [NSKeyedArchiver archivedDataWithRootObject:self.completedAssignments];
    [[NSUserDefaults standardUserDefaults] setObject:dataSave forKey:@"array"];
    //NSLog(@" THIS INFORMATION IS IMPORTSNNT %@", [[[NSUserDefaults standardUserDefaults] dictionaryRepresentation] allKeys]);
    //NSLog(@" This is the saved data that I need ᕙ༼=ݓ益ݓ=༽ᕗ  %@", [[[NSUserDefaults standardUserDefaults] dictionaryRepresentation] allValues]);
    [[NSUserDefaults standardUserDefaults] synchronize];
    return cell;
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    AssignmentItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
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

