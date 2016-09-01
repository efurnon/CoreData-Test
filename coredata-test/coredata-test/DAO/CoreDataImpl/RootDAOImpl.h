//
//  RootDAOImpl.h
//  coredata-test
//
//  Created by Emmanuel Furnon.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

static NSString *const COREDATA_BEGINSWITH_METHOD = @"BEGINSWITH";
static NSString *const COREDATA_CONTAINS_METHOD = @"CONTAINS";

@interface RootDAOImpl : NSObject

@property NSMutableArray *loadedObjects;

- (NSManagedObject *)new:(Class)class;

- (void)save:(NSError *)error;

- (void) delete:(NSManagedObject *)object error:(NSError *)error;

- (NSArray *)all:(Class)class error:(NSError *)error;

@end
