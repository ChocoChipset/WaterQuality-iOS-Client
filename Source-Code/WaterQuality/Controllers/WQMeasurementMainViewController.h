//
//  WQMeasurementMainViewController.h
//  WaterQuality
//
//  Created by Hector Zarate on 11/10/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class WQFuelLikeIndicatorView;

@interface WQMeasurementMainViewController : UIViewController <CLLocationManagerDelegate>

@property (assign, nonatomic) BOOL dontCalculateUserLocation;   // this is nasty. :S

@property (retain, nonatomic) IBOutlet UIImageView *iconImageView;
@property (retain, nonatomic) IBOutlet UILabel *persentLabel;
@property (retain, nonatomic) IBOutlet UILabel *placeNameLabel;
@property (retain, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (retain, nonatomic) IBOutlet WQFuelLikeIndicatorView *qualityStripesView;

-(void)updateUserInterfaceWithMeasurement:(NSDictionary *)dictionary;

@end
