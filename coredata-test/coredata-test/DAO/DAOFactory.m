//
//  DAOFactory.m
//  coredata-test
//
//  Created by Emmanuel Furnon.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

#import "TeacherCoreDataDAOImpl.h"
#import "CoreDataManager.h"
#import "DAOFactory.h"

/*!
 @constant CORE_DATA_MODE
 @abstract Name of CoreData mode
 @discussion Used to force the use of CordeDataDAOImpl to manage local database.
 */
static NSString *CORE_DATA_MODE = @"CORE_DATA";

/*!
 @constant PERSISTENCE_MODE
 @abstract Name of Persistence mode to use in this application (only CoreData at
 the moment)
 */
static NSString *PERSISTENCE_MODE = @"CORE_DATA";

@interface DAOFactory ()

@end

@implementation DAOFactory


#pragma mark -
#pragma mark Instance methods

+ (instancetype)instance
{
    static DAOFactory *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken, ^{

      _sharedInstance = [[DAOFactory alloc] init];
    });

    return _sharedInstance;
}

- (NSManagedObjectContext *)managedObjectContext
{
    return [[CoreDataManager instance] managedObjectContext];
}


#pragma mark -
#pragma mark Public methods

// Access the Managed Object Context.
+ (NSManagedObjectContext *)managedObjectContext
{
    return [[DAOFactory instance] managedObjectContext];
}

// Get an TeacherDAOImpl.
+ (NSObject<TeacherDAO> *)teacherDAO
{
    NSObject<TeacherDAO> *dao = nil;

    if ([PERSISTENCE_MODE isEqualToString:CORE_DATA_MODE])
    {
        dao = [[TeacherCoreDataDAOImpl alloc] init];
    }

    return dao;
}

@end
