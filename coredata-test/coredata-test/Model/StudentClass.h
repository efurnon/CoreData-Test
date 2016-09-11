//
//  StudentClass.h
//  CoreData Test
//
//  Created by Emmanuel Furnon on 01/09/2016.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

@class StudentClass;

NS_ASSUME_NONNULL_BEGIN

@interface StudentClass : NSManagedObject

#pragma mark -
#pragma mark Instance methods
/*!
 @method save
 @abstract Save the StudentClass in data source.
 */
- (void)save;

#pragma mark -
#pragma mark Class methods
/*!
 @method allStudentClasses
 @abstract Retrieve all StudentClasses from data source.
 @return Return all StudentClasses.
 */
+ (NSArray *)allStudentClasses;

/*!
 @method classesWhoseCountMoreThan
 @abstract Get all StudentClasses whose count is more than a minimum count.
 @param minCount : the minimum count of StudentClasses to find.
 @return An array of StudentClasses.
 */
+ (NSArray *)classesWhoseCountMoreThan:(NSInteger)minCount;

/*!
 @method deleteStudentClass
 @abstract Delete the StudentClass from data source.
 @param studentClass : the StudentClass to delete.
 */
+ (void)deleteStudentClass:(StudentClass *)studentClass;

/*!
 @method deleteAll
 @abstract Delete all StudentClasses from data source.
 */
+ (void)deleteAll;

@end

NS_ASSUME_NONNULL_END

#import "StudentClass+CoreDataProperties.h"
