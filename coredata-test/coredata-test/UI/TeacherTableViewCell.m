//
//  TeacherTableViewCell.m
//  CoreData Test
//
//  Created by Emmanuel Furnon on 15/09/2016.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

#import "TeacherTableViewCell.h"

@implementation TeacherTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)fillWithTeacher:(Teacher *)teacher
{
    self.teacher = teacher;
    
    [self.teacherLabel setText:[self.teacher summary]];
}

- (IBAction)deleteTeacher:(id)sender
{
    if(self.delegate)
    {
        [self.delegate deleteTeacher:self.teacher];
    }
}

@end
