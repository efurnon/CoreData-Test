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
 @method newManagedObject
 @abstract Method which create a new default Teacher.
 @discussion This method is MANDATORY for CoreData and must be used instead of
 Teacher init:.
             The link with CoreData is managed by a context which must be
 initialize when the object is created.
 @return The TeacherCoreDataDAOImpl instance.
 */
- (Teacher *)newManagedObject;

/*!
 @method saveManagedObject:
 @abstract Save a modified Teacher.
 @param teacher : The modified Teacher.
 */
- (void)saveManagedObject:(Teacher *)teacher;

/*!
 @method deleteManagedObject:
 @abstract Delete an Teacher.
 @param teacher : the Teacher to delete.
 */
- (void)deleteManagedObject:(Teacher *)teacher;

/*!
 @method deleteAll:
 @abstract Delete all Teachers.
 */
- (void)deleteAll;

/*!
 @method allManagedObjects
 @abstract Get all Teachers.
 @return An array of Teachers.
 */
- (NSArray *)allManagedObjects;

/*!
 @method listByPredicate:fallback:
 @abstract Get all teachers sorted by specific predicate and return the fallback if nil.
 @param predicate : The search predicate.
 @param predicate : The fallback to return if response is nil
 @return An array of teachers.
 */
- (NSArray *)listByPredicate:(NSPredicate *)predicate fallback:(NSArray *)list;

@end
