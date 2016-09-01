//
//  DAOFactory.h
//  coredata-test
//
//  Created by Emmanuel Furnon.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

#import "TeacherDAO.h"

/*!
 @protocol DAOFactory
 @abstract Deliver all DAOImpls.
 @discussion For each method return the DAOImpl corresponding to the mode of
 database (in the current case CoreData).
 */
@interface DAOFactory : NSObject

/*!
 @method managedObjectContext
 @abstract Access the Managed Object Context.
 @return Return the NSManagedObjectContext.
 */
+ (NSManagedObjectContext *)managedObjectContext;

/*!
 @method teacherDAO
 @abstract Get an TeacherDAOImpl.
 @return The TeacherDAOImpl.
 */
+ (NSObject<TeacherDAO> *)teacherDAO;

@end
