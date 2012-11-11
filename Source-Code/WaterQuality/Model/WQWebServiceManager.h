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

@property (assign, nonatomic) double radioLongitude;
@property (assign, nonatomic) double radioLatitude;
@property (strong, nonatomic) CLLocation *locationPoint;
@property (strong, nonatomic) NSMutableArray *measurements;
@property (strong, nonatomic) NSDictionary *parameters;

+(id)sharedWebServiceManager;

- (void)getMeasurementForLocation:(CLLocation *)location;

- (void)getDetailsForMeasurementID:(NSString *)measurementID;

/*- (void)getListOfMeasurementsForLocation:(CLLocation *)location
                             withinRadio:(NSInteger)radioInMeters
                         resultLimitedTo:(NSString *)limit;*/

- (void)getListOfMeasurementsForLocation:(CLLocation *)location
                    withinRadioLongitude:(double)degreesLongitude
                     withinRadioLatitude:(double)degreesLatitude
                         resultLimitedTo:(NSString*)limit
                         notificationKey:(NSString *)notificationKey;


@end
