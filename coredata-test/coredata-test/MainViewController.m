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

    [[CoreDataManager instance] removeDatabase];
    NSObject<TeacherDAO> *teacherDao = [DAOFactory teacherDAO];
    
    Teacher *t = [teacherDao newObject];
    t.lastName = @"Smith";
    t.firstName = @"Bob";
    t.age = @24;
    t.experience = @2;
    
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
    
    [teacherDao saveObject:t];
    [teacherDao saveObject:t2];
    [teacherDao saveObject:t3];
    
    t3.age = @45;
    [teacherDao saveObject:t3];
    
    Teacher *a = [[Teacher alloc] init];
    a.lastName = @"Spencer";
    a.firstName = @"Bud";
    a.age = @65;
    
    Teacher *a2 = [[Teacher alloc] init];
    a2.firstName = @"Terence";
    a2.lastName = @"Hill";
    a2.age = @63;
    a2.experience = @25;
    
    Teacher *a3 = [[Teacher alloc] init];
    a3.firstName = @"Enzo";
    a3.lastName = @"Barboni";
    a3.age = @80;
    a3.experience = @42;
    
    [a save];
    [a2 save];
    [a3 save];
    
    a3.age = @53;
    [a3 save];
    
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
