//
//  CoreDataManager.m
//  coredata-test
//
//  Created by Emmanuel Furnon.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

#import "CoreDataManager.h"

@interface CoreDataManager ()

@property NSManagedObjectModel *managedObjectModel;
@property NSPersistentStoreCoordinator *persistentStoreCoordinator;

// Unique coredata context for the DAOFactory instance (and also the unique in the application).
@property (nonatomic) NSManagedObjectContext *managedObjectContext;

@end


@implementation CoreDataManager

+ (instancetype)instance
{
    static CoreDataManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken, ^{
        _sharedInstance = [[CoreDataManager alloc] init];
    });

    return _sharedInstance;
}

- (instancetype)init
{
    self = [super init];

    if (self != nil)
    {
        self.runMode = YES;
        self.managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
        self.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    }

    return self;
}

// Access the Managed Object Context.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext == nil)
    {
        _managedObjectContext = [self createNewContext];
    }

    if (_managedObjectContext.persistentStoreCoordinator != self.persistentStoreCoordinator)
    {
        _managedObjectContext = [self createNewContext];
    }

    if ([_managedObjectContext.persistentStoreCoordinator persistentStores] == nil)
    {
        _managedObjectContext = [self createNewContext];
    }

    return _managedObjectContext;
}

// Access the Managed Object Context.
+ (NSManagedObjectContext *)managedObjectContext
{
    return [[CoreDataManager instance] managedObjectContext];
}

- (NSURL *)storeUrl
{
    NSString *sqlitePath = self.runMode ? RUN_SQLITE_PATH : TEST_SQLITE_PATH;
    NSString *directory = [NSSearchPathForDirectoriesInDomains (
    NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSURL *storeUrl = [NSURL fileURLWithPath:[directory stringByAppendingPathComponent:sqlitePath]];

    return storeUrl;
}

- (NSManagedObjectContext *)createNewContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = nil;

    if ([self.persistentStoreCoordinator.persistentStores count] == 0)
    {
        if (![self.persistentStoreCoordinator
            addPersistentStoreWithType:NSSQLiteStoreType
                         configuration:nil
                                   URL:[self storeUrl]
                               options:nil
                                 error:&error])
        {
            NSLog(@"Unable to create persistent coordinator");
        }
    }

    if (self.persistentStoreCoordinator != nil)
    {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
    }

    return managedObjectContext;
}

- (void)removeDatabase
{
    NSArray *stores = [self.persistentStoreCoordinator persistentStores];
    for (NSPersistentStore *store in stores)
    {
        [self.persistentStoreCoordinator removePersistentStore:store error:nil];
        [[NSFileManager defaultManager] removeItemAtPath:[self storeUrl].path error:nil];
    }
}

@end
