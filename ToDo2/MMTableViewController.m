//
//  MMTableViewController.m
//  ToDo2
//
//  Created by James Donner on 2/17/13.
//  Copyright (c) 2013 jdsv650. All rights reserved.
//

#import "MMTableViewController.h"
#import "MMAppDelegate.h"
#import "ToDoItem.h"
#import "EditItemViewController.h"

@interface MMTableViewController ()
{
    IBOutlet UIBarButtonItem *addItemOutlet;
}

- (IBAction)removeItem:(id)sender;

@end

@implementation MMTableViewController
@synthesize taskArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    MMAppDelegate *delegate = (MMAppDelegate *)[[UIApplication sharedApplication] delegate];
    taskArray = delegate.taskArray;
    [delegate getData];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
   // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    NSIndexPath *path;
    EditItemViewController *editController = [segue destinationViewController];
   // [editController setDelegate:self];
    path = [self.tableView indexPathForSelectedRow];
    [editController setCurrentItem:[self.taskArray objectAtIndex:path.row]];
    [editController setIndexNum:path.row];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [taskArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    if([[taskArray objectAtIndex:indexPath.row] isComplete])
    {
        cell.imageView.image = [UIImage imageNamed:@"checkbox_yes.png"];
    }
    else if(indexPath.row != taskArray.count-1) {
        cell.imageView.image = [UIImage imageNamed:@"checkbox_no.png"];
    }
    cell.textLabel.text = [[taskArray objectAtIndex:indexPath.row] todoMessage];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    if(indexPath.row == taskArray.count-1)
        return NO;
    
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [taskArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // if(indexPath.row == taskArray.count-1)
    //     return UITableViewCellEditingStyleInsert;
    
    return UITableViewCellEditingStyleDelete;
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (IBAction)removeItem:(id)sender {
    
    if(self.editing)
    {
        [self setEditing:NO animated:YES];
       // addItemOutlet.title = @"Remove";
    }
    else
    {
        [self setEditing:YES animated:YES];
        //addItemOutlet.title = @"Done";
        
    }

}
@end
