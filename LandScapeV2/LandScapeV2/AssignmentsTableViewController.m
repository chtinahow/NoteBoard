//
//  AssignmentsTableViewController.m
//  LandScapeV2
//
//  Created by Kimberly Sookoo on 9/1/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "AssignmentsTableViewController.h"
#import "AssignmentItem.h"

@interface AssignmentsTableViewController ()
{
    NSMutableArray *SelectedRows;
}

@property (nonatomic) int selectedRow;
@property NSMutableArray *toDoItems;
@property NSMutableArray *completedAssignments;

@end

@implementation AssignmentsTableViewController{
    UITextField *currDate;
    UILabel *assignment;
    UILabel *dueDate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadLabels];
    
    //allots the needed space at the top to insert date and other labels
    self.tableView.contentInset = UIEdgeInsetsMake(250, 0, 0, 0);
    
    [self loadInitialData];
}

- (void) loadLabels{
    
    //date
    currDate = [[UITextField alloc] initWithFrame:CGRectMake(10, -250, 200, 30)];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *now = [[NSDate alloc]init];
    NSString *theDate = [dateFormat stringFromDate:now];
    currDate.text = theDate;
    currDate.textColor = [UIColor blueColor];
    currDate.userInteractionEnabled = NO;
    [self.view addSubview:currDate];
    
    //assignments section
    assignment = [[UILabel alloc] initWithFrame:CGRectMake(100, -75, 200, 30)];
    assignment.text = @"Assignment";
    [self.view addSubview:assignment];
    
    //due date section
    dueDate = [[UILabel alloc] initWithFrame:CGRectMake(600, -75, 200, 30)];
    dueDate.text = @"Due Date";
    [self.view addSubview:dueDate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    
}

/*
 loadInitialData loads everything statically for the intial information that goes into the array
 */
-(void) loadInitialData
{
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


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
