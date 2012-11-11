//
//  WQAnotation.h
//  WaterQuality
//
//  Created by Kamil Wasag on 11/11/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface WQAnotation : MKPointAnnotation

@property (assign, nonatomic) NSInteger code;
@property (strong, nonatomic) NSDictionary *measurement;

@end
