//
//  WQWebServiceManager.m
//  WaterQuality
//
//  Created by Hector Zarate on 11/10/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import "WQWebServiceManager.h"
#import "SVHTTPWQClient.h"  // SVHTTPWQClient should be used instead of SVHTTPClient


@interface  WQWebServiceManager (Private)

- (void)getListOfMeasurementsForLocation:(CLLocation *)location
                             withinRadio:(double)radioInMeters
                         resultLimitedTo:(NSInteger)limit
                         notificationKey:(NSString *)notificationKey
                        withCompletition:(WQMeasurementsResponse)measurementResponse;


@end


static WQWebServiceManager *static_WebServiceManager = nil;

@implementation WQWebServiceManager

+(id)sharedWebServiceManager
{
    if (static_WebServiceManager)
    {
        return static_WebServiceManager;
    }
    else
    {
        return [[[self class] alloc] init];
    }
}

- (id)init
{
    if (static_WebServiceManager) return [static_WebServiceManager retain];
    
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
    [self getListOfMeasurementsForLocation:location
                               withinRadio:kRADIO_BY_DEFAULT
                           resultLimitedTo:1
                           notificationKey:K_NOTIFICATION_MEASHUREMENT_FOR_LOCATION_COMPLETE
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
    [self getListOfMeasurementsForLocation:location
                               withinRadio:radioInMeters
                           resultLimitedTo:limit
                           notificationKey:K_NOTIFICATION_MEASHUREMENTS_LIST_COMPLETE
                          withCompletition:measurementResponse];
}

- (void)getListOfMeasurementsForLocation:(CLLocation *)location
                             withinRadio:(double)radioInMeters
                         resultLimitedTo:(NSInteger)limit
                         notificationKey:(NSString *)notificationKey
                        withCompletition:(WQMeasurementsResponse)measurementResponse
{
    self.locationPoint = location;
    self.radio = kRADIO_BY_DEFAULT;
    
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
                                
                                if (!error)
                                {
                                    [[NSNotificationCenter defaultCenter] postNotificationName:notificationKey
                                                                                        object:response];
                                }
                                else
                                {
                                    [[NSNotificationCenter defaultCenter] postNotificationName:notificationKey
                                                                                        object:nil];
                                }
                                    
                                
                                
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