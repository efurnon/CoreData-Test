//
//  CoreDataManager.h
//  coredata-test
//
//  Created by Emmanuel Furnon.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

static NSString *RUN_SQLITE_PATH = @"coredata.db";
static NSString *TEST_SQLITE_PATH = @"test_coredata.db";

@interface CoreDataManager : NSObject

@property BOOL runMode;

+ (instancetype)instance;

/*!
 @method managedObjectContext
 @abstract Access the Managed Object Context.
 @return Return the NSManagedObjectContext.
 */
- (NSManagedObjectContext *)managedObjectContext;

- (void)removeDatabase;

@end
