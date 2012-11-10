//
//  WQMeasurementMainViewController.h
//  WaterQuality
//
//  Created by Hector Zarate on 11/10/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface WQMeasurementMainViewController : UIViewController <CLLocationManagerDelegate>

@property (retain, nonatomic) IBOutlet UIImageView *iconImageView;
@property (retain, nonatomic) IBOutlet UILabel *persentLabel;
@property (retain, nonatomic) IBOutlet UILabel *placeNameLabel;
@property (retain, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (retain, nonatomic) IBOutlet UIView *qualityStripesView;

@end
