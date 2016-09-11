//
//  DAOFactory.h
//  coredata-test
//
//  Created by Emmanuel Furnon.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

#import "StudentClassDAO.h"
#import "TeacherDAO.h"

/*!
 @protocol DAOFactory
 @abstract Deliver all DAOImpls.
 @discussion For each method return the DAOImpl corresponding to the mode of
 database (in the current case CoreData).
 */
@interface DAOFactory : NSObject

/*!
 @method teacherDAO
 @abstract Get an TeacherDAOImpl.
 @return The TeacherDAOImpl.
 */
+ (NSObject<TeacherDAO> *)teacherDAO;

/*!
 @method studentClassDAO
 @abstract Get an StudentClassDAOImpl.
 @return The StudentClassDAOImpl.
 */
+ (NSObject<StudentClassDAO> *)studentClassDAO;

@end
