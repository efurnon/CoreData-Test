//
//  DAOProtocol.h
//  coredata-test
//
//  Created by Emmanuel Furnon
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

@protocol DAOProtocol

@required
- (NSObject *)newObject;

- (void)saveObject:(NSObject *)account;

- (void)deleteObject:(NSObject *)account;

- (NSArray *)allObjects;

- (NSArray *)listByPredicate:(NSPredicate *)predicate fallback:(NSArray *)list;

@end
