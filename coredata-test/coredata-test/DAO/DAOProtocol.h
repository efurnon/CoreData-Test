//
//  DAOProtocol.h
//  coredata-test
//
//  Created by Emmanuel Furnon
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

@protocol DAOProtocol

@required
- (NSManagedObject *)newManagedObject;

- (void)saveManagedObject:(NSManagedObject *)account;

- (void)deleteManagedObject:(NSManagedObject *)account;

- (NSArray *)allManagedObjects;

- (NSArray *)listByPredicate:(NSPredicate *)predicate fallback:(NSArray *)list;

@optional
- (void)saveManagedObject:(NSManagedObject *)account audit:(BOOL)audit;

@end
