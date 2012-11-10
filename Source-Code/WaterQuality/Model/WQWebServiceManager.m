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
    []
}

- (void)getListOfMeasurementsForLocation:(CLLocation *)location
                             withinRadio:(double)radioInMeters
                         resultLimitedTo:(NSInteger)limit
                        withCompletition:(WQMeasurementsResponse)measurementResponse
{
    
    [[SVHTTPClient sharedClient] GET:@"users/show.json"
                          parameters:[NSDictionary dictionaryWithObject:@"samvermette" forKey:@"screen_name"]
                          completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
                              followersLabel.text = [NSString stringWithFormat:@"@samvermette has %@ followers", [response valueForKey:@"followers_count"]];
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
