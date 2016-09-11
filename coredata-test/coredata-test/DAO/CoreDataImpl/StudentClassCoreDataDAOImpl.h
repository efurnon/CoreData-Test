//
//  StudentClassCoreDataDAOImpl.h
//  CoreData Test
//
//  Created by Emmanuel Furnon on 11/09/2016.
//  Copyright © 2016 Keyrus. All rights reserved.
//
#import "StudentClassDAO.h"

#import "RootCoreDataDAOImpl.h"

/*!
 @class StudentClassCoreDataDAOImpl
 @abstract Manage interaction with the coredata managed object StudentClass.
 @discussion Inherite from protocol StudentClassDAO.
 */
@interface StudentClassCoreDataDAOImpl : RootCoreDataDAOImpl <StudentClassDAO>

@end
