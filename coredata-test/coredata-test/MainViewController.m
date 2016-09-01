//
//  MainViewController.m
//  coredata-test
//
//  Created by Emmanuel Furnon.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

#import "CoreDataManager.h"
#import "MainViewController.h"
#import "DAOFactory.h"

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSObject<TeacherDAO> *teacherDao = [DAOFactory teacherDAO];
    
    Teacher *t = [teacherDao newManagedObject];
    t.lastName = @"Smith";
    t.firstName = @"Bob";
    t.age = @24;
    t.experience = @2;
    
    [teacherDao saveManagedObject:t];
    
    NSArray *teachers = [teacherDao allManagedObjects];
    
    Teacher *t2 = [teacherDao newManagedObject];
    t2.lastName = @"Doe";
    t2.firstName = @"John";
    t2.age = @27;
    t2.experience = @8;
    
    Teacher *t3 = [teacherDao newManagedObject];
    t3.lastName = @"Hill";
    t3.firstName = @"Morgan";
    t3.age = @24;
    t3.experience = @2;
    
    [teacherDao saveManagedObject:t2];
    [teacherDao saveManagedObject:t3];
    
    teachers = [teacherDao allManagedObjects];
    
    ((Teacher *)teachers[0]).age = @45;
    [teacherDao saveManagedObject:teachers[0]];
    
    
    [teacherDao deleteAll];
}

@end
