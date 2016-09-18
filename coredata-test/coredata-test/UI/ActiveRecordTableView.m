//
//  ActiveRecordTableView.m
//  CoreData Test
//
//  Created by Emmanuel Furnon on 15/09/2016.
//  Copyright © 2016 Keyrus. All rights reserved.
//

#import "ActiveRecordTableView.h"

@implementation ActiveRecordTableView

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
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.delegate = self;
    self.dataSource = self;
    
    self.teachers = [Teacher allTeachers];
}

- (void)reload
{
    self.teachers = [Teacher allTeachers];
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
