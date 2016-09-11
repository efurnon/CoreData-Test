//
//  StudentClass+CoreDataProperties.h
//  CoreData Test
//
//  Created by Emmanuel Furnon on 01/09/2016.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "StudentClass.h"
#import "Teacher.h"

NS_ASSUME_NONNULL_BEGIN

@interface StudentClass (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *classroom;
@property (nullable, nonatomic, retain) NSString *studentsCount;
@property (nullable, nonatomic, retain) NSString *level;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) Teacher *teacher;

@end

NS_ASSUME_NONNULL_END
