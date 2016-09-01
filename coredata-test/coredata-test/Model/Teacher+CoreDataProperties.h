//
//  Teacher+CoreDataProperties.h
//  CoreData Test
//
//  Created by Emmanuel Furnon on 01/09/2016.
//  Copyright © 2016 Keyrus. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Teacher.h"

NS_ASSUME_NONNULL_BEGIN

@interface Teacher (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSNumber *experience;
@property (nullable, nonatomic, retain) NSNumber *age;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSSet<StudentClass *> *classes;

@end

@interface Teacher (CoreDataGeneratedAccessors)

- (void)addClassesObject:(StudentClass *)value;
- (void)removeClassesObject:(StudentClass *)value;
- (void)addClasses:(NSSet<StudentClass *> *)values;
- (void)removeClasses:(NSSet<StudentClass *> *)values;

@end

NS_ASSUME_NONNULL_END
