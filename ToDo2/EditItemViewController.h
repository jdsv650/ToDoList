//
//  EditItemViewController.h
//  ToDo2
//
//  Created by James Donner on 2/17/13.
//  Copyright (c) 2013 jdsv650. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"

@interface EditItemViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *editTaskField;
@property (weak, nonatomic) IBOutlet UISwitch *taskCompleteSwitch;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, strong) ToDoItem* currentItem;
@property (assign, nonatomic) int indexNum;

- (IBAction)saveButtonPressed:(id)sender;
- (IBAction)backButtonPressed:(id)sender;

@end
