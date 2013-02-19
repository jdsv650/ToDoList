//
//  MMTableViewController.h
//  ToDo2
//
//  Created by James Donner on 2/17/13.
//  Copyright (c) 2013 jdsv650. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property NSMutableArray *taskArray;

@end
