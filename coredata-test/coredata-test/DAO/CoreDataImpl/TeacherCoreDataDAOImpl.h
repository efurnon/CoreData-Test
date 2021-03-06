//
//  TeacherCoreDataDAOImpl.h
//  coredata-test
//
//  Created by Emmanuel Furnon.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

#import "TeacherDAO.h"

#import "RootCoreDataDAOImpl.h"

/*!
 @class TeacherCoreDataDAOImpl
 @abstract Manage interaction with the coredata managed object Teacher.
 @discussion Inherite from protocol TeacherDAO.
 */
@interface TeacherCoreDataDAOImpl : RootCoreDataDAOImpl <TeacherDAO>

@end
