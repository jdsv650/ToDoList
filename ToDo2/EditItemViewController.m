//
//  EditItemViewController.m
//  ToDo2
//
//  Created by James Donner on 2/17/13.
//  Copyright (c) 2013 jdsv650. All rights reserved.
//

#import "EditItemViewController.h"
#import "MMAppDelegate.h"
#import "ToDoItem.h"

@interface EditItemViewController ()
{
    MMAppDelegate *delegate;
}


@end


@implementation EditItemViewController
@synthesize currentItem;
@synthesize indexNum;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    delegate = (MMAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    self.editTaskField.text = self.currentItem.todoMessage;
    self.taskCompleteSwitch.on = self.currentItem.isComplete;
    self.datePicker.date = self.currentItem.dueDate;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (IBAction)saveButtonPressed:(id)sender
{
    if([(UIButton *) sender tag] == 0)  //is back
    {
        //do nothing just return
    }
    else  //is save button
    {
        NSLog(@"currentItem.taskToDo = %@", currentItem.todoMessage);
        NSLog(@"currentItem.dueDate = %@", currentItem.dueDate);
        NSLog(@"currentItem.isComplete = %d", (int) currentItem.isComplete);
        
        self.currentItem.todoMessage = self.editTaskField.text;
        self.currentItem.isComplete = self.taskCompleteSwitch.on;
        self.currentItem.dueDate = self.datePicker.date;
        [delegate.taskArray  replaceObjectAtIndex:indexNum withObject:self.currentItem];
        
        // if last item add new item after
        if(indexNum == delegate.taskArray.count-1)
        {
            ToDoItem *newTask = [[ToDoItem alloc] init];
            newTask.isComplete = NO;
            newTask.todoMessage = @"";
            newTask.dueDate = [[NSDate alloc] init];
            
            [delegate.taskArray addObject:newTask];
            
        }
    }
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return  YES;
}

    

- (IBAction)backButtonPressed:(id)sender {
}
@end
