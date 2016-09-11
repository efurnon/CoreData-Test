//
//  TeacherRealmDAOImpl.m
//  CoreData Test
//
//  Created by Emmanuel Furnon on 11/09/2016.
//  Copyright © 2016 Keyrus. All rights reserved.
//

#import "TeacherRealmDAOImpl.h"

@implementation TeacherRealmDAOImpl

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
    return [super all:[Teacher class] error:nil];
}

// List all Teachers by a predicate.
- (NSArray *)listByPredicate:(NSPredicate *)predicate fallback:(NSArray *)list
{
    return [super all:[Teacher class] error:nil];
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

@end
