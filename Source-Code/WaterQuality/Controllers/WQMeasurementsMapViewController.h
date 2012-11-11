//
//  WQMeasurementsMapViewController.h
//  WaterQuality
//
//  Created by Hector Zarate on 11/10/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "WQMeasurementsAbstractViewController.h"

@interface WQMeasurementsMapViewController : WQMeasurementsAbstractViewController <MKMapViewDelegate>


@property (retain, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) NSDictionary *currentMeasurement;

@end
