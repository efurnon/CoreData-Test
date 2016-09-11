//
//  RootCoreDataDAOImpl.m
//  coredata-test
//
//  Created by Emmanuel Furnon.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

#import "RootCoreDataDAOImpl.h"

#import "DAOFactory.h"
#import "CoreDataManager.h"

@implementation RootCoreDataDAOImpl

// Create.
- (NSManagedObject *)new:(Class)class
{
    NSManagedObject *object = nil;

    @synchronized([RootCoreDataDAOImpl class])
    {
        object = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(class) inManagedObjectContext:[CoreDataManager managedObjectContext]];
    }

    return object;
}

    // Save.
- (void)save:(NSError *)error
{
    @synchronized([RootCoreDataDAOImpl class])
    {
        [[CoreDataManager managedObjectContext] save:&error];
    }
}

// Delete.
- (void)delete:(NSManagedObject *)object error:(NSError *)error
{
    @synchronized([RootCoreDataDAOImpl class])
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

    @synchronized([RootCoreDataDAOImpl class])
    {
        list = [[CoreDataManager managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    }

    return list;
}

@end
