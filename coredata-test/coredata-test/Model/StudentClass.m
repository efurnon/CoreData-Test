//
//  StudentClass.m
//  CoreData Test
//
//  Created by Emmanuel Furnon on 01/09/2016.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

#import "StudentClass.h"
#import "CoreDataManager.h"

@implementation StudentClass

// Create a new StudentClass.
- (instancetype)init
{
    self = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([StudentClass class])
                                         inManagedObjectContext:[CoreDataManager managedObjectContext]];
    return self;
}


#pragma mark -
#pragma mark Instance methods

// Save the modified StudentClass.
- (void)save
{
    NSError *error;
    
    @synchronized([StudentClass class])
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

// Get all StudentClasses.
+ (NSArray *)allStudentClasses
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass ([StudentClass class])];
    return [StudentClass studentClassByFetchRequest:fetchRequest];
}

// Delete StudentClass.
+ (void)deleteStudentClass:(StudentClass *)studentClass
{
    NSError *error;
    
    @synchronized([StudentClass class])
    {
        [[CoreDataManager managedObjectContext] deleteObject:studentClass];
        [[CoreDataManager managedObjectContext] save:&error];
        
        if (error)
        {
            NSLog(@"%@", error);
        }
    }
}

+ (NSArray *)classesWhoseCountMoreThan:(NSInteger)minCount
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"studentsCount == %lu", minCount];
    
    return [StudentClass listByPredicate:predicate fallback:[NSArray array]];
}

// Delete all StudentClasses.
+ (void)deleteAll
{
    NSError *error;
    NSArray *all = [StudentClass allStudentClasses];
    
    for(StudentClass *t in all)
    {
        [StudentClass deleteStudentClass:t];
        
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
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass ([StudentClass class])];
    [fetchRequest setPredicate:predicate];
    
    return [StudentClass studentClassByFetchRequest:fetchRequest];
}

+ (NSArray *)studentClassByFetchRequest:(NSFetchRequest *)fetchRequest
{
    return [[CoreDataManager managedObjectContext] executeFetchRequest:fetchRequest  error:nil];
}

@end
