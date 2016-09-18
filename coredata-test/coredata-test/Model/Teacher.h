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

- (NSString *)summary;

#pragma mark -
#pragma mark Instance methods

- (void)save;

#pragma mark -
#pragma mark Class methods

+ (NSArray *)allTeachers;

+ (void)deleteTeacher:(Teacher *)teacher;

+ (void)deleteAll;

@end

NS_ASSUME_NONNULL_END

#import "Teacher+CoreDataProperties.h"
