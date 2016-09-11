//
//  RootDAOImpl.m
//  coredata-test
//
//  Created by Emmanuel Furnon.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

#import "RootDAOImpl.h"

#import "DAOFactory.h"
#import "CoreDataManager.h"

@implementation RootDAOImpl

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _loadedObjects = [NSMutableArray array];
    }

    return self;
}

// Create.
- (NSManagedObject *)new:(Class)class
{
    NSManagedObject *object = nil;

    @synchronized([RootDAOImpl class])
    {
        object = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(class) inManagedObjectContext:[CoreDataManager managedObjectContext]];
    }

    return object;
}

    // Save.
- (void)save:(NSError *)error
{
    @synchronized([RootDAOImpl class])
    {
        [[CoreDataManager managedObjectContext] save:&error];
    }
}

// Delete.
- (void)delete:(NSManagedObject *)object error:(NSError *)error
{
    @synchronized([RootDAOImpl class])
    {
        [[CoreDataManager managedObjectContext] deleteObject:object];
        [[CoreDataManager managedObjectContext] save:&error];
    }
}

// Get all.
- (NSArray *)all:(Class)class error:(NSError *)error
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass(class)];

    NSArray *list = nil;

    @synchronized([RootDAOImpl class])
    {
        list = [[CoreDataManager managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    }

    return list;
}

@end
