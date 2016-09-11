//
//  Teacher.h
//  CoreData Test
//
//  Created by Emmanuel Furnon on 01/09/2016.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

@class StudentClass;

NS_ASSUME_NONNULL_BEGIN

@interface Teacher : NSManagedObject

#pragma mark -
#pragma mark Instance methods
/*!
 @method save
 @abstract Save the Teacher in data source.
 */
- (void)save;

#pragma mark -
#pragma mark Class methods
/*!
 @method allTeachers
 @abstract Retrieve all Teachers from data source.
 @return Return all Teachers.
 */
+ (NSArray *)allTeachers;

/*!
 @method deleteTeacher
 @abstract Delete the Teacher from data source.
 @param teacher : the Teacher to delete.
 */
+ (void)deleteTeacher:(Teacher *)teacher;

/*!
 @method deleteAll
 @abstract Delete all Teachers from data source.
 */
+ (void)deleteAll;

@end

NS_ASSUME_NONNULL_END

#import "Teacher+CoreDataProperties.h"
