//
//  GroupListTableViewController.m
//  PM
//
//  Created by Apple on 15/12/13.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import "GroupListTableViewController.h"
#import "Password.h"
#import "Group.h"
#import "AddViewController.h"

@interface GroupListTableViewController ()

@property NSMutableArray *groups;

@end

@implementation GroupListTableViewController

- (IBAction) unwindToList:(UIStoryboardSegue *)segue{
    AddViewController *source=[segue sourceViewController];
    Password *newp = source.newp;
    if([self isGroups:newp]==-1){
        Group *newgroup =[[Group alloc] init];
        newgroup.groupName=newp.groupName;
        [self.groups addObject:newgroup];
        [newgroup.passwords addObject:newp];
    }
    else{
        NSInteger index=[self isGroups:newp];
        Group *group = [self.groups objectAtIndex:index];
        [group.passwords addObject:newp];
    }
    [self.tableView reloadData];
    
}

-(NSInteger)isGroups:(Password *)newp {
    NSInteger n=self.groups.count;
    if(n==0){
        return -1;
    }
    for (Group *g in self.groups){
        if([g.groupName isEqualToString:newp.groupName])
            return [self.groups indexOfObject:g];
    }
    return -1;
}

- (void)loadInitialData {
    /*Group *group1=[[Group alloc] init];
    group1.groupName=@"pay";
    [self.groups addObject:group1];*/
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.groups = [[NSMutableArray alloc] init];
    [self loadInitialData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [self.groups count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Group *group  = [self.groups objectAtIndex:indexPath.row];
    cell.textLabel.text = group.groupName;
    NSLog(cell.textLabel.text);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    Group *tappedItem = [self.groups objectAtIndex:indexPath.row];
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
