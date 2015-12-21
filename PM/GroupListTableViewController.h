//
//  GroupListTableViewController.h
//  PM
//
//  Created by Apple on 15/12/13.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Group.h"

@interface GroupListTableViewController : UITableViewController

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

@property Group *group;

@end
