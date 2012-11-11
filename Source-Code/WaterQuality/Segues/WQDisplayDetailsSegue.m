//
//  WQDisplayDetailsSegue.m
//  WaterQuality
//
//  Created by Kamil Wasag on 11/11/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import "WQDisplayDetailsSegue.h"
#import "WQMeasurementMainViewController.h"
#import "WQMeasurementsMapViewController.h"
#import "WQMeasurementsListViewController.h"

@implementation WQDisplayDetailsSegue

- (void)perform
{
    WQMeasurementMainViewController *destination = self.destinationViewController;
    WQMeasurementsMapViewController *source = self.sourceViewController;
    if ([self.sourceViewController isMemberOfClass:[WQMeasurementsListViewController class]])
        destination.displayedMeasurement = ((WQMeasurementsListViewController *)source).currentMeasurement;
    else
        destination.displayedMeasurement = ((WQMeasurementsMapViewController *)source).currentMeasurement;
    destination.dontCalculateUserLocation = YES;
    [source.navigationController pushViewController:destination animated:YES];
}

@end
