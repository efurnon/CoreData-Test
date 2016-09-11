//
//  TeacherCoreDataDAOImpl.m
//  coredata-test
//
//  Created by Emmanuel Furnon.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

#import "TeacherCoreDataDAOImpl.h"
#import "CoreDataManager.h"

#import "DAOFactory.h"

@interface TeacherCoreDataDAOImpl ()

@property dispatch_queue_t teacherDAOQueue;

@end

@implementation TeacherCoreDataDAOImpl

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.teacherDAOQueue = dispatch_queue_create("com.coredatatest.teacherDAOQueue", NULL);
    }
    
    return self;
}

// Create a new Teacher.
- (Teacher *)newObject
{
    return (Teacher *)[super new:[Teacher class]];
}

// Save the modified Teacher.
- (void)saveObject:(Teacher *)teacher
{
    NSError *error;
    [super save:error];

    if (error)
    {
        NSLog(@"%@", error);
    }
}

// Get all Teachers.
- (NSArray *)allObjects
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass ([Teacher class])];
    return [self teacherByFetchRequest:fetchRequest];
}

// Delete Teacher.
- (void)deleteObject:(Teacher *)teacher
{
    NSError *error;

    [super delete:teacher error:error];

    if (error)
    {
        NSLog(@"%@", error);
    }
}

// Delete all Teachers.
- (void)deleteAll
{
    NSError *error;
    NSArray *all = [self allObjects];
    
    for(Teacher *t in all)
    {
        [super delete:t error:error];
    }
    
    if (error)
    {
        NSLog(@"%@", error);
    }
}

- (NSArray *)listByPredicate:(NSPredicate *)predicate fallback:(NSArray *)list
{
    if (!predicate)
    {
        return list;
    }

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass ([Teacher class])];
    [fetchRequest setPredicate:predicate];

    return [self teacherByFetchRequest:fetchRequest];
}

- (NSArray *)teacherByFetchRequest:(NSFetchRequest *)fetchRequest
{
    __block id returnValue = nil;
    
    dispatch_sync(self.teacherDAOQueue, ^{
        
        returnValue = [[CoreDataManager managedObjectContext] executeFetchRequest:fetchRequest error:nil];
    });
    
    return returnValue;
}

@end