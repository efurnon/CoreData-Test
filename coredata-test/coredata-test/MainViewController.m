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
    
    Teacher *t = [teacherDao newObject];
    t.lastName = @"Smith";
    t.firstName = @"Bob";
    t.age = @24;
    t.experience = @2;
    
    [teacherDao saveObject:t];
    
    NSArray *teachers = [teacherDao allObjects];
    
    Teacher *t2 = [teacherDao newObject];
    t2.lastName = @"Doe";
    t2.firstName = @"John";
    t2.age = @27;
    t2.experience = @8;
    
    Teacher *t3 = [teacherDao newObject];
    t3.lastName = @"Hill";
    t3.firstName = @"Morgan";
    t3.age = @24;
    t3.experience = @2;
    
    [teacherDao saveObject:t2];
    [teacherDao saveObject:t3];
    
    teachers = [teacherDao allObjects];
    
    ((Teacher *)teachers[0]).age = @45;
    [teacherDao saveObject:teachers[0]];
    
    [self.daoTableView setCustomDelegate:self];
    [self.daoTableView reload];
    
    [self.activeRecordTableView setCustomDelegate:self];
    [self.activeRecordTableView reload];
}


#pragma mark -
#pragma mark Custom Table View Delegate Methods

- (void)dataChangedForTableView:(BaseTableView *)tableView
{
    if(tableView == self.daoTableView)
    {
        [self.activeRecordTableView reload];
    }
    else if(tableView == self.activeRecordTableView)
    {
        [self.daoTableView reload];
    }
}

@end
