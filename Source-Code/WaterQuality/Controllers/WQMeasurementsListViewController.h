//
//  WQMeasurementsTableViewController.h
//  WaterQuality
//
//  Created by Hector Zarate on 11/10/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WQMeasurementsAbstractViewController.h"

@interface WQMeasurementsListViewController : WQMeasurementsAbstractViewController

@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end
