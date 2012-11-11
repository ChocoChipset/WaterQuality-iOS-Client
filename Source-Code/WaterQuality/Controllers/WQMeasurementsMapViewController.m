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
    [self.map setRegion:MKCoordinateRegionMake(self.map.centerCoordinate, MKCoordinateSpanMake(0.1f, 0.1f))];
    [self.map setCenterCoordinate:CLLocationCoordinate2DMake(kDEFAULT_LATITUDE_, kDEFAULT_LONGITUDE_) animated:NO];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(listOfMeasurementsComplete:)
                                                 name:K_NOTIFICATION_MEASHUREMENTS_LIST_COMPLETE
                                               object:nil];
    CLLocation * point = [[[CLLocation alloc] initWithLatitude:self.map.centerCoordinate.latitude longitude:self.map.centerCoordinate.longitude] autorelease];
    [[WQWebServiceManager sharedWebServiceManager] getListOfMeasurementsForLocation:point
                                                               withinRadioLongitude:self.map.region.span.longitudeDelta
                                                                withinRadioLatitude:self.map.region.span.latitudeDelta
                                                                    resultLimitedTo:kDEFAULT_LIMIT_FOR_MEASUREMENTS
                                                                    notificationKey:K_NOTIFICATION_MEASHUREMENTS_LIST_COMPLETE];
}

#pragma mark - NOtification selectors
     
- (void)listOfMeasurementsComplete:(NSNotification *)sender
{
    [self putPins:[sender userInfo]];
}

#pragma mark - MKMapViewDelegate methods

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    CLLocation * point = [[[CLLocation alloc] initWithLatitude:self.map.centerCoordinate.latitude longitude:self.map.centerCoordinate.longitude] autorelease];
    [[WQWebServiceManager sharedWebServiceManager] getListOfMeasurementsForLocation:point
                                                               withinRadioLongitude:self.map.region.span.longitudeDelta
                                                                withinRadioLatitude:self.map.region.span.latitudeDelta
                                                                    resultLimitedTo:kDEFAULT_LIMIT_FOR_MEASUREMENTS
                                                                    notificationKey:K_NOTIFICATION_MEASHUREMENTS_LIST_COMPLETE];
}

#pragma mark - pins oeration

- (void)putPins:(NSDictionary *)data
{
    NSLog(@"%@",[data objectForKey:@"objects"]);
    for (NSDictionary *object in [data objectForKey:@"objects"]) {
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        annotation.coordinate = CLLocationCoordinate2DMake([((NSString *)[object objectForKey:@"latitude"]) doubleValue],
                                                           [((NSString *)[object objectForKey:@"longitude"]) doubleValue]);
        annotation.title = [object objectForKey:@"locationName"];
        annotation.subtitle = [NSString stringWithFormat:@"%@%%",[object objectForKey:@"quality"] ];
        [self.map addAnnotation:annotation];
        [annotation release];
    }
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
