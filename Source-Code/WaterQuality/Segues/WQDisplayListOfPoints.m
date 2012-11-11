//
//  WQDisplayListOfPoints.m
//  WaterQuality
//
//  Created by Kamil Wasag on 11/11/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import "WQDisplayListOfPoints.h"
#import "WQMeasurementsMapViewController.h"
#import "WQMeasurementsListViewController.h"

@implementation WQDisplayListOfPoints

- (void)perform
{
    WQMeasurementsListViewController *destination = self.destinationViewController;
    WQMeasurementsMapViewController *source = self.sourceViewController;
    destination.longitudeDelta = source.map.region.span.longitudeDelta;
    destination.latitiudeDelta = source.map.region.span.latitudeDelta;
    destination.point = source.map.region.center;
    [source.navigationController pushViewController:destination animated:YES];
}

@end
