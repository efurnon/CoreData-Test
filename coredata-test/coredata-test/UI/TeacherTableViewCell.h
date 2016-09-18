//
//  TeacherTableViewCell.h
//  CoreData Test
//
//  Created by Emmanuel Furnon on 15/09/2016.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Teacher.h"

@protocol TeacherCellDelegate <NSObject>

- (void)deleteTeacher:(Teacher *)teacher;

@end

@interface TeacherTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *teacherLabel;

@property (nonatomic) Teacher *teacher;

@property NSObject<TeacherCellDelegate> *delegate;

- (void)fillWithTeacher:(Teacher *)teacher;

- (IBAction)deleteTeacher:(id)sender;

@end
