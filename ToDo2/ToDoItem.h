//
//  ToDoItem.h
//  ToDo2
//
//  Created by James Donner on 2/17/13.
//  Copyright (c) 2013 jdsv650. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property (nonatomic, strong) NSString *todoMessage;
@property (nonatomic, assign) BOOL isComplete;
@property (nonatomic, strong) NSDate *dueDate;

@end
