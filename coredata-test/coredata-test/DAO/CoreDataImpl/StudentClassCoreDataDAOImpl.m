//
//  StudentClassCoreDataDAOImpl.m
//  CoreData Test
//
//  Created by Emmanuel Furnon on 11/09/2016.
//  Copyright © 2016 Keyrus. All rights reserved.
//

#import "StudentClassCoreDataDAOImpl.h"
#import "CoreDataManager.h"

#import "DAOFactory.h"

@interface StudentClassCoreDataDAOImpl ()

@property dispatch_queue_t studentClassDAOQueue;

@end

@implementation StudentClassCoreDataDAOImpl

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.studentClassDAOQueue = dispatch_queue_create("com.coredatatest.studentClassDAOQueue", NULL);
    }
    
    return self;
}

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
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass ([StudentClass class])];
    return [self studentClassByFetchRequest:fetchRequest];
}

- (NSArray *)classesWhoseCountMoreThan:(NSInteger)minCount
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"studentsCount == %lu", minCount];
    
    return [self listByPredicate:predicate fallback:[NSArray array]];
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

- (NSArray *)listByPredicate:(NSPredicate *)predicate fallback:(NSArray *)list
{
    if (!predicate)
    {
        return list;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass ([StudentClass class])];
    [fetchRequest setPredicate:predicate];
    
    return [self studentClassByFetchRequest:fetchRequest];
}

- (NSArray *)studentClassByFetchRequest:(NSFetchRequest *)fetchRequest
{
    __block id returnValue = nil;
    
    dispatch_sync(self.studentClassDAOQueue, ^{
        
        returnValue = [[CoreDataManager managedObjectContext] executeFetchRequest:fetchRequest error:nil];
    });
    
    return returnValue;
}

@end