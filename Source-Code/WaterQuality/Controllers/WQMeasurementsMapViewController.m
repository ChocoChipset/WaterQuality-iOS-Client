//
//  WQMeasurementsMapViewController.m
//  WaterQuality
//
//  Created by Hector Zarate on 11/10/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import "WQMeasurementsMapViewController.h"
#import "WQWebServiceManager.h"

@interface WQMeasurementsMapViewController ()

@end

@implementation WQMeasurementsMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.map.delegate = self;
    [self.map setCenterCoordinate:CLLocationCoordinate2DMake(kDEFAULT_LATITUDE_, kDEFAULT_LONGITUDE_) animated:NO];
    [self.map setRegion:MKCoordinateRegionMake(self.map.centerCoordinate, MKCoordinateSpanMake(10, 10))];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_map release];
    [super dealloc];
}
@end
