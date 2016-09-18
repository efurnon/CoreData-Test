//
//  DAOTableView.m
//  CoreData Test
//
//  Created by Emmanuel Furnon on 15/09/2016.
//  Copyright © 2016 Keyrus. All rights reserved.
//

#import "DAOFactory.h"
#import "DAOTableView.h"
#import "TeacherDAO.h"

@interface DAOTableView ()

@property NSObject<TeacherDAO> *teacherDao;

@end

@implementation DAOTableView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self initiateTableView];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self initiateTableView];
    }
    
    return self;
}

- (void)initiateTableView
{
    self.teacherDao = [DAOFactory teacherDAO];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.delegate = self;
    self.dataSource = self;
    
    self.teachers = [self.teacherDao allObjects];
}

- (void)reload
{
    self.teachers = [self.teacherDao allObjects];
    [self reloadData];
}

#pragma mark -
#pragma mark Teacher Cell Delegate Methods

- (void)deleteTeacher:(Teacher *)teacher
{
    [Teacher deleteTeacher:teacher];
    [self reload];
    [self sendChangeToController];
}

@end

