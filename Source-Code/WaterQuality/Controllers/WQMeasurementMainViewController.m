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
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
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


-(void)receivedWebServiceManagerNotification:(NSNotification *)notification
{
    NSLog(@"So this is the response: %@", notification.userInfo);
}

#pragma mark - LocationManager

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receivedWebServiceManagerNotification:)
                                                 name:K_NOTIFICATION_MEASHUREMENT_FOR_LOCATION_COMPLETE
                                               object:nil];
    
    [[WQWebServiceManager sharedWebServiceManager] getMeasurementForLocation:[locations lastObject]];
}


@end
