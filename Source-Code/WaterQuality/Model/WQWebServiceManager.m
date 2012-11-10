//
//  WQWebServiceManager.m
//  WaterQuality
//
//  Created by Hector Zarate on 11/10/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import "WQWebServiceManager.h"
#import "SVHTTPWQClient.h"  // SVHTTPWQClient should be used instead of SVHTTPClient




@implementation WQWebServiceManager

- (id)init
{
    if (self = [super init])
    {
        self.radio = kRADIO_BY_DEFAULT;
        _locationPoint = [[CLLocation alloc] initWithLatitude:kDEFAULT_LATITUDE_ longitude:kDEFAULT_LONGITUDE_];
    }
    return self;
}


- (void)getMeasurementForLocation:(CLLocation *)location
                 withCompletition:(WQMeasurementsResponse)measurementResponse
{
    self.locationPoint = location;
    self.radio = kRADIO_BY_DEFAULT;
    [self getListOfMeasurementsForLocation:location
                               withinRadio:kRADIO_BY_DEFAULT
                           resultLimitedTo:1
                          withCompletition:measurementResponse];
   
}

- (void)getParameterForMeasurementID:(NSInteger)measurement
                    withCompletition:(WQMeasurementsResponse)measurementResponse
{
    
}

- (void)getListOfMeasurementsForLocation:(CLLocation *)location
                             withinRadio:(double)radioInMeters
                         resultLimitedTo:(NSInteger)limit
                        withCompletition:(WQMeasurementsResponse)measurementResponse
{
    // GET /v1/measurements/<lat>/<long>/<distance>/
    
    NSString *getCall = [NSString stringWithFormat:@"/v1/measurements/%f/%f/%f/",
                        location.coordinate.latitude,
                        location.coordinate.longitude,
                        radioInMeters];
    
    NSArray *parameterKeys = [NSArray arrayWithObjects:kPARAMETER_KEY_FOR_OFFSET, kPARAMETER_KEY_FOR_LIMIT, nil];
    
    NSArray *parameterValues = [NSArray arrayWithObjects:0, kDEFAULT_LIMIT_FOR_MEASUREMENTS, nil];
    
    
    NSDictionary *parametersDictionary = [NSDictionary dictionaryWithObjects:parameterValues
                                                                     forKeys:parameterKeys];
    
    [[SVHTTPWQClient sharedClient] GET:getCall
                          parameters:parametersDictionary
                          completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
//                            [[NSNotificationCenter defaultCenter] postNotificationName:@"TestNotification
//                                                                                object:self];
                          
                          
                          }];
    
}

- (void)dealloc
{
    [_locationPoint release];
    [_measurements release];
    [_parameters release];
    [super dealloc];
}


@end
