//
//  BaseTableView.h
//  CoreData Test
//
//  Created by Emmanuel Furnon on 18/09/2016.
//  Copyright © 2016 Keyrus. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TeacherTableViewCell.h"

@protocol CustomTableViewDelegate;

@interface BaseTableView : UITableView<UITableViewDelegate, UITableViewDataSource, TeacherCellDelegate>

@property NSArray *teachers;

@property NSObject<CustomTableViewDelegate> *customDelegate;

- (void)reload;

- (void)sendChangeToController;

@end

@protocol CustomTableViewDelegate <NSObject>

- (void)dataChangedForTableView:(BaseTableView *)tableView;

@end
