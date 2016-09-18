//
//  BaseTableView.m
//  CoreData Test
//
//  Created by Emmanuel Furnon on 18/09/2016.
//  Copyright © 2016 Keyrus. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

- (void)reload
{
}

- (void)sendChangeToController
{
    if(self.customDelegate)
    {
        [self.customDelegate dataChangedForTableView:self];
    }
}


#pragma mark -
#pragma mark Teacher Cell Delegate Methods

- (void)deleteTeacher:(Teacher *)teacher
{
}


#pragma mark -
#pragma mark Table View Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.teachers count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reusableCellName = @"TEACHER_TABLE_CELL";
    TeacherTableViewCell *teacherCell = [self dequeueReusableCellWithIdentifier:reusableCellName];
    
    if (!teacherCell)
    {
        teacherCell = [[[NSBundle mainBundle] loadNibNamed:@"TeacherTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    
    Teacher *teacher = [self.teachers objectAtIndex:[indexPath item]];
    if (teacher)
    {
        [teacherCell setDelegate:self];
        [teacherCell fillWithTeacher:teacher];
    }
    
    return teacherCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.f;
}

@end
