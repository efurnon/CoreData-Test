//
//  RootCoreDataDAOImpl.h
//  coredata-test
//
//  Created by Emmanuel Furnon.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

@interface RootCoreDataDAOImpl : NSObject

- (NSManagedObject *)new:(Class)class;

- (void)save:(NSError *)error;

- (void) delete:(NSManagedObject *)object error:(NSError *)error;

- (NSArray *)all:(Class)class error:(NSError *)error;

@end
