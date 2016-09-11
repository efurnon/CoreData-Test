//
//  StudentClassRealmDAOImpl.m
//  CoreData Test
//
//  Created by Emmanuel Furnon on 11/09/2016.
//  Copyright © 2016 Keyrus. All rights reserved.
//

#import "StudentClassRealmDAOImpl.h"

@implementation StudentClassRealmDAOImpl

// Create a new StudentClass.
- (StudentClass *)newObject
{
    return (StudentClass *)[super new:[StudentClass class]];
}

// Save the modified StudentClass.
- (void)saveObject:(StudentClass *)studentClass
{
    NSError *error;
    [super save:error];
    
    if (error)
    {
        NSLog(@"%@", error);
    }
}

// Get all StudentClasses.
- (NSArray *)allObjects
{
    return [super all:[StudentClass class] error:nil];
}

// Get all StudentClasses whose count is superior to a minimum count.
- (NSArray *)classesWhoseCountMoreThan:(NSInteger)minCount
{
    return [super all:[StudentClass class] error:nil];
}

// List all StudentClasses by a predicate.
- (NSArray *)listByPredicate:(NSPredicate *)predicate fallback:(NSArray *)list
{
    return [super all:[StudentClass class] error:nil];
}

// Delete StudentClass.
- (void)deleteObject:(StudentClass *)studentClass
{
    NSError *error;
    
    [super delete:studentClass error:error];
    
    if (error)
    {
        NSLog(@"%@", error);
    }
}

// Delete all StudentClasses.
- (void)deleteAll
{
    NSError *error;
    NSArray *all = [self allObjects];
    
    for(StudentClass *t in all)
    {
        [super delete:t error:error];
    }
    
    if (error)
    {
        NSLog(@"%@", error);
    }
}

@end
