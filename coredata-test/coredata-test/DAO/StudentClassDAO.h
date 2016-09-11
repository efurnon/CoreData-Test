//
//  StudentClassDAO.h
//  CoreData Test
//
//  Created by Emmanuel Furnon on 11/09/2016.
//  Copyright © 2016 Keyrus. All rights reserved.
//

#import "StudentClass.h"
#import "DAOProtocol.h"

/*!
 @protocol StudentClassDAO
 @abstract Protocol for StudentClass objects management.
 @discussion All these methods must be implemented by the StudentClassDAOImpls.
 */
@protocol StudentClassDAO <DAOProtocol>

/*!
 @method newManagedObject
 @abstract Method which create a new default StudentClass.
 @discussion This method is MANDATORY for CoreData and must be used instead of
 StudentClass init:.
 The link with CoreData is managed by a context which must be
 initialize when the object is created.
 @return The StudentClassCoreDataDAOImpl instance.
 */
- (StudentClass *)newManagedObject;

/*!
 @method saveManagedObject:
 @abstract Save a modified StudentClass.
 @param studentClass : The modified StudentClass.
 */
- (void)saveManagedObject:(StudentClass *)studentClass;

/*!
 @method deleteManagedObject:
 @abstract Delete an StudentClass.
 @param studentClass : the StudentClass to delete.
 */
- (void)deleteManagedObject:(StudentClass *)studentClass;

/*!
 @method deleteAll:
 @abstract Delete all StudentClasses.
 */
- (void)deleteAll;

/*!
 @method allManagedObjects
 @abstract Get all StudentClasses.
 @return An array of StudentClasses.
 */
- (NSArray *)allManagedObjects;

/*!
 @method listByPredicate:fallback:
 @abstract Get all studentClasses sorted by specific predicate and return the fallback if nil.
 @param predicate : The search predicate.
 @param predicate : The fallback to return if response is nil
 @return An array of studentClasses.
 */
- (NSArray *)listByPredicate:(NSPredicate *)predicate fallback:(NSArray *)list;

@end