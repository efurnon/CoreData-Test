//
//  Teacher.m
//  CoreData Test
//
//  Created by Emmanuel Furnon on 01/09/2016.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

#import "Teacher.h"
#import "StudentClass.h"

#import "CoreDataManager.h"

@implementation Teacher

// Create a new Teacher.
- (instancetype)init
{
    self = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Teacher class])
                                         inManagedObjectContext:[CoreDataManager managedObjectContext]];
    return self;
}


#pragma mark -
#pragma mark Instance methods

// Save the modified Teacher.
- (void)save
{
    NSError *error;
    
    @synchronized([Teacher class])
    {
        [[CoreDataManager managedObjectContext] save:&error];
        
        if (error)
        {
            NSLog(@"%@", error);
        }
    }
}


#pragma mark -
#pragma mark Class methods

// Get all Teachers.
+ (NSArray *)allTeachers
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass ([Teacher class])];
    return [Teacher teacherByFetchRequest:fetchRequest];
}

// Delete Teacher.
+ (void)deleteTeacher:(Teacher *)teacher
{
    NSError *error;
    
    @synchronized([Teacher class])
    {
        [[CoreDataManager managedObjectContext] deleteObject:teacher];
        [[CoreDataManager managedObjectContext] save:&error];
        
        if (error)
        {
            NSLog(@"%@", error);
        }
    }
}

// Delete all Teachers.
+ (void)deleteAll
{
    NSError *error;
    NSArray *all = [Teacher allTeachers];
    
    for(Teacher *t in all)
    {
        [Teacher deleteTeacher:t];
        
        if (error)
        {
            NSLog(@"%@", error);
        }
    }
}

+ (NSArray *)listByPredicate:(NSPredicate *)predicate fallback:(NSArray *)list
{
    if (!predicate)
    {
        return list;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass ([Teacher class])];
    [fetchRequest setPredicate:predicate];
    
    return [Teacher teacherByFetchRequest:fetchRequest];
}

+ (NSArray *)teacherByFetchRequest:(NSFetchRequest *)fetchRequest
{
    return [[CoreDataManager managedObjectContext] executeFetchRequest:fetchRequest  error:nil];
}

@end
