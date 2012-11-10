//
//  WQMeasurementMainViewController.m
//  WaterQuality
//
//  Created by Hector Zarate on 11/10/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import "WQMeasurementMainViewController.h"
#import "WQWebServiceManager.h"



@interface WQMeasurementMainViewController ()

@end

@implementation WQMeasurementMainViewController

-(void)dealloc
{
    [_iconImageView release];
    [_persentLabel release];
    [_placeNameLabel release];
    [_descriptionTextView release];
    [_qualityStripesView release];

    [super dealloc];
}

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
    
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager startMonitoringSignificantLocationChanges];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LocationManager

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [[WQWebServiceManager sharedWebServiceManager] getMeasurementForLocation:[locations lastObject ]
                                                            withCompletition:^(id responseObject, NSError *error) {
                                                                NSLog(@"Result of response object: %@", responseObject);
                                                            }];

}


@end
