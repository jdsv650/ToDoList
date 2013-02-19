//
//  MMAppDelegate.m
//  ToDo2
//
//  Created by James Donner on 2/17/13.
//  Copyright (c) 2013 jdsv650. All rights reserved.
//

#import "MMAppDelegate.h"
#import "ToDoItem.h"

@implementation MMAppDelegate
@synthesize taskArray;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    taskArray = [[NSMutableArray alloc] init];
    ToDoItem *item1 = [[ToDoItem alloc] init];
    ToDoItem *item2 = [[ToDoItem alloc] init];
    ToDoItem *item3 = [[ToDoItem alloc] init];
    ToDoItem *item4 = [[ToDoItem alloc] init];
    ToDoItem *item5 = [[ToDoItem alloc] init];
    
    item1.isComplete = YES;
    item1.todoMessage = @"Go To Mobile Makers";
    item1.dueDate = [[NSDate alloc] init];  //now
    
    item2.isComplete = NO;
    item2.todoMessage = @"Make Something Awesome";
    item2.dueDate = [[NSDate alloc] init];  //now
    
    item3.isComplete = YES;
    item3.todoMessage = @"Become Frustrated";
    item3.dueDate = [[NSDate alloc] init];  //now
    
    item4.isComplete = YES;
    item4.todoMessage = @"Avoid Ross";
    item4.dueDate = [[NSDate alloc] init];  //now
    
    item5.isComplete = NO;
    item5.todoMessage = @"";
    item5.dueDate = [[NSDate alloc] init];  //now
    
    
    [taskArray addObject:item1];
    [taskArray addObject:item2];
    [taskArray addObject:item3];
    [taskArray addObject:item4];
    [taskArray addObject:item5];
    
    return YES;
}


- (NSString *)getFilePath
{
    NSArray *filePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    return ([[filePath objectAtIndex:0] stringByAppendingPathComponent:@"savedTodoList.plist"]);
}


- (void)saveData
{
    
    [taskArray writeToFile:self.getFilePath atomically:YES];
    
}


- (void)getData
{
 //   NSString *filePathAsString = [self getFilePath];
 //   BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:filePathAsString];
//    
//    ToDoItem *item1 = [[ToDoItem alloc] init];
//    
//    if(fileExists)
//    {
//        taskArray = [[NSMutableArray alloc] initWithContentsOfFile:filePathAsString];
//        
//           item1.isComplete = YES;
//            item1.todoMessage = @"Go To Mobile Makers";
//            item1.dueDate = [[NSDate alloc] init];  //now
//        
//        [taskArray addObject:item1];
        //
//        for (int i =0; i < retrievedItems.count; i++) {
//            
//            item1.isComplete = [[retrievedItems objectAtIndex:i] isComplete];
//            item1.todoMessage = [[retrievedItems objectAtIndex:i] todoMessage];
//            item1.dueDate = [[retrievedItems objectAtIndex:i] dueDate];
//            
//            [taskArray addObject:item1];
//            }
//    }
    
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self saveData];
    
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [self getData];
    
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
