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

@implementation WQDisplayDetailsSegue

- (void)perform
{
    WQMeasurementMainViewController *destination = self.destinationViewController;
    WQMeasurementsMapViewController *source = self.sourceViewController;
    destination.dontCalculateUserLocation = YES;
    destination.displayedMeasurement = source.currentMeasurement;
    [source.navigationController pushViewController:destination animated:YES];
}

@end
