//
//  WQMeasurementsTableViewController.h
//  WaterQuality
//
//  Created by Hector Zarate on 11/10/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "WQMeasurementsAbstractViewController.h"

@interface WQMeasurementsListViewController : WQMeasurementsAbstractViewController

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, assign) double latitiudeDelta;
@property (nonatomic, assign) double longitudeDelta;
@property (nonatomic, assign) CLLocationCoordinate2D point;

@property (nonatomic, retain) NSArray *dataSource;
@property (nonatomic, retain) NSDictionary *currentMeasurement;

@end
