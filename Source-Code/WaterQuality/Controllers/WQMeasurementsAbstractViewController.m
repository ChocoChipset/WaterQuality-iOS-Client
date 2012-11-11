//
//  WQMeasurementsAbstractViewController.m
//  WaterQuality
//
//  Created by Hector Zarate on 11/10/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import "WQMeasurementsAbstractViewController.h"

@interface WQMeasurementsAbstractViewController (Private)

@end

@implementation WQMeasurementsAbstractViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIImage *)mapIconForMeasurementWithCode:(NSInteger)code
{
    NSString *iconImageName = [NSString stringWithFormat:@"%@%d%@", kCODE_ICON_NAME_PREFIX, code, kCODE_ICON_NAME_SUFFIX_MAP];
    
    UIImage *result = [UIImage imageNamed:iconImageName];
    
    if (!result)
    {
        iconImageName = [NSString stringWithFormat:@"%@%d%@", kCODE_ICON_NAME_PREFIX, kCODE_ICON_NAME_DEFAULT_INDEX, kCODE_ICON_NAME_SUFFIX_MAP];
        result = [UIImage imageNamed:iconImageName];
        NSLog(@"Warning: Unrecognized Code Image for Map");
    }
    
    return result;

    
}

@end
