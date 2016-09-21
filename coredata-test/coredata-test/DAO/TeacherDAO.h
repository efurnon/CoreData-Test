//
//  TeacherDAO.h
//  coredata-test
//
//  Created by Emmanuel Furnon.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

#import "Teacher.h"
#import "DAOProtocol.h"

/*!
 @protocol TeacherDAO
 @abstract Protocol for Teacher objects management.
 @discussion All these methods must be implemented by the TeacherDAOImpls.
 */
@protocol TeacherDAO <DAOProtocol>

/*!
 @method newObject
 @abstract Method which create a new default Teacher.
 @return A new Teacher.
 */
- (Teacher *)newObject;

/*!
 @method save:
 @abstract Save a modified Teacher.
 @param teacher : The modified Teacher.
 */
- (void)saveObject:(Teacher *)teacher;

/*!
 @method deleteObject:
 @abstract Delete an Teacher.
 @param teacher : the Teacher to delete.
 */
- (void)deleteObject:(Teacher *)teacher;

/*!
 @method deleteAll:
 @abstract Delete all Teachers.
 */
- (void)deleteAll;

/*!
 @method allObjects
 @abstract Get all Teachers.
 @return An array of Teachers.
 */
- (NSArray *)allObjects;

/*!
 @method listByPredicate:fallback:
 @abstract Get all teachers sorted by specific predicate and return the fallback if nil.
 @param predicate : The search predicate.
 @param list : The fallback to return if response is nil
 @return An array of teachers.
 */
- (NSArray *)listByPredicate:(NSPredicate *)predicate fallback:(NSArray *)list;

@end
