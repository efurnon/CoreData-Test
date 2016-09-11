//
//  DAOFactory.m
//  coredata-test
//
//  Created by Emmanuel Furnon.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

#import "StudentClassCoreDataDAOImpl.h"
#import "TeacherCoreDataDAOImpl.h"

#import "StudentClassRealmDAOImpl.h"
#import "TeacherRealmDAOImpl.h"

#import "DAOFactory.h"

/*!
 @constant CORE_DATA_MODE
 @abstract Name of CoreData mode
 @discussion Used to force the use of CoreDataDAOImpl to manage local database.
 */
static NSString *CORE_DATA_MODE = @"CORE_DATA";

/*!
 @constant REALM_MODE
 @abstract Name of Realm mode
 @discussion Used to force the use of RealmDAOImpl to manage local database.
 */
static NSString *REALM_MODE = @"REALM";

/*!
 @constant PERSISTENCE_MODE
 @abstract Name of Persistence mode to use in this application (only CoreData at
 the moment)
 */
static NSString *PERSISTENCE_MODE = @"CORE_DATA";

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


#pragma mark -
#pragma mark Public methods

// Get an TeacherDAOImpl.
+ (NSObject<TeacherDAO> *)teacherDAO
{
    NSObject<TeacherDAO> *dao = nil;

    if ([PERSISTENCE_MODE isEqualToString:CORE_DATA_MODE])
    {
        dao = [[TeacherCoreDataDAOImpl alloc] init];
    }
    else if ([PERSISTENCE_MODE isEqualToString:REALM_MODE])
    {
        dao = [[TeacherRealmDAOImpl alloc] init];
    }

    return dao;
}

+ (NSObject<StudentClassDAO> *)studentClassDAO
{
    NSObject<StudentClassDAO> *dao = nil;
    
    if ([PERSISTENCE_MODE isEqualToString:CORE_DATA_MODE])
    {
        dao = [[StudentClassCoreDataDAOImpl alloc] init];
    }
    else if ([PERSISTENCE_MODE isEqualToString:REALM_MODE])
    {
        dao = [[StudentClassRealmDAOImpl alloc] init];
    }
    
    return dao;
}

@end
