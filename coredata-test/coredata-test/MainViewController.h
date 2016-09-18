//
//  MainViewController.h
//  coredata-test
//
//  Created by Emmanuel Furnon.
//  Copyright © 2016 Emmanuel Furnon. All rights reserved.
//

#import "ActiveRecordTableView.h"
#import "DAOTableView.h"
#import "BaseTableView.h"

@interface MainViewController : UIViewController<CustomTableViewDelegate>

@property (weak, nonatomic) IBOutlet DAOTableView *daoTableView;

@property (weak, nonatomic) IBOutlet ActiveRecordTableView *activeRecordTableView;

@end

