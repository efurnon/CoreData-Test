//
//  StudentClassDAO.h
//  CoreData Test
//
//  Created by Emmanuel Furnon on 11/09/2016.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
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
 @method newObject
 @abstract Method which create a new default StudentClass.
 @return A new StudentClass.
 */
- (StudentClass *)newObject;

/*!
 @method saveObject:
 @abstract Save a modified StudentClass.
 @param studentClass : The modified StudentClass.
 */
- (void)saveObject:(StudentClass *)studentClass;

/*!
 @method deleteObject:
 @abstract Delete an StudentClass.
 @param studentClass : the StudentClass to delete.
 */
- (void)deleteObject:(StudentClass *)studentClass;

/*!
 @method deleteAll:
 @abstract Delete all StudentClasses.
 */
- (void)deleteAll;

/*!
 @method allObjects
 @abstract Get all StudentClasses.
 @return An array of StudentClasses.
 */
- (NSArray *)allObjects;

/*!
 @method classesWhoseCountMoreThan
 @abstract Get all StudentClasses whose count is more than a minimum count.
 @param minCount : the minimum count of StudentClasses to find.
 @return An array of StudentClasses.
 */
- (NSArray *)classesWhoseCountMoreThan:(NSInteger)minCount;

/*!
 @method listByPredicate:fallback:
 @abstract Get all studentClasses sorted by specific predicate and return the fallback if nil.
 @param predicate : The search predicate.
 @param predicate : The fallback to return if response is nil
 @return An array of studentClasses.
 */
- (NSArray *)listByPredicate:(NSPredicate *)predicate fallback:(NSArray *)list;

@end
