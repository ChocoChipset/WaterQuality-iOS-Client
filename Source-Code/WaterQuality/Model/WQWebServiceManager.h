//
//  WQWebServiceManager.h
//  WaterQuality
//
//  Created by Hector Zarate on 11/10/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void (^WQMeasurementsResponse)(id responseObject, NSError *error);

@interface WQWebServiceManager : NSObject

@property (assign, nonatomic) double radio;
@property (strong, nonatomic) CLLocation *locationPoint;
@property (strong, nonatomic) NSMutableArray *measurements;
@property (strong, nonatomic) NSDictionary *parameters;

+(id)sharedWebServiceManager;

- (void)getMeasurementForLocation:(CLLocation *)location
                 withCompletition:(WQMeasurementsResponse)measurementResponse;

- (void)getParameterForMeasurementID:(long)measurement
                    withCompletition:(WQMeasurementsResponse)measurementResponse;

- (void)getListOfMeasurementsForLocation:(CLLocation *)location
                             withinRadio:(NSInteger)radioInMeters
                         resultLimitedTo:(NSInteger)limit
                        withCompletition:(WQMeasurementsResponse)measurementResponse;


@end
