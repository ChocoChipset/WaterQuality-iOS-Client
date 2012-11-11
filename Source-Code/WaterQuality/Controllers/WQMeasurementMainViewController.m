//
//  WQMeasurementMainViewController.m
//  WaterQuality
//
//  Created by Hector Zarate on 11/10/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import "WQMeasurementMainViewController.h"
#import "WQWebServiceManager.h"
#import "WQFuelLikeIndicatorView.h"


#define kPERCENT_LABEL_RED_LABEL_LIMIT 20
#define kPERCENT_LABEL_ORANGE_LABEL_LIMIT 40
#define kPERCENT_LABEL_YELLOW_LABEL_LIMIT 60
#define kPERCENT_LABEL_DARK_GREEN_LABEL_LIMIT 80
#define kPERCENT_LABEL_GREEN_LABEL_LIMIT 100

@interface WQMeasurementMainViewController (Private)

-(void)setIconImageForCode:(NSInteger)code;
-(void)setPercentLabelForPercentage:(NSInteger)percentage;
-(void)updateUserInterfaceWithMeasurement:(NSDictionary *)dictionary;

@end



@implementation WQMeasurementMainViewController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [_iconImageView release];
    [_persentLabel release];
    [_placeNameLabel release];
    [_descriptionTextView release];
    [_qualityStripesView release];

    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)setPercentLabelForPercentage:(NSInteger)percentage
{
    self.persentLabel.text = [NSString stringWithFormat:@"%d%%", percentage];
    
    NSArray *colorsForLabel = [NSArray arrayWithObjects: [UIColor redColor], [UIColor yellowColor], [UIColor orangeColor], [UIColor greenColor], [UIColor greenColor],  nil];
    
    int indexForColorLabel = lroundf(percentage / (100 / [colorsForLabel count]));
    
    self.persentLabel.textColor = [colorsForLabel objectAtIndex:indexForColorLabel];
}

-(void)setIconImageForCode:(NSInteger)code
{
    NSString *iconImageName = [NSString stringWithFormat:@"%@%d", kCODE_ICON_NAME_PREFIX, code];
    
    UIImage *result = [UIImage imageNamed:iconImageName];
    
    if (!result)
    {
        iconImageName = [NSString stringWithFormat:@"%@%d", kCODE_ICON_NAME_PREFIX, kCODE_ICON_NAME_DEFAULT_INDEX];
        result = [UIImage imageNamed:iconImageName];
        NSLog(@"Warning: Unrecognized Code Image");
    }

    self.iconImageView.image = result;
    
}

-(void)updateUserInterfaceWithMeasurement:(NSDictionary *)dictionary
{
    int waterQualityPercentage = [[dictionary valueForKey:@"quality"] intValue];
    
    [self setIconImageForCode:[[dictionary valueForKey:@"code"] intValue]];
    [self setPercentLabelForPercentage: waterQualityPercentage];
    [self.qualityStripesView updateFuelIndicatorWithPercent:waterQualityPercentage]
    ;    self.placeNameLabel.text = [dictionary valueForKey:@"locationName"];
    self.descriptionTextView.text = [dictionary valueForKey:@"comment"];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Water Quality Here";
    
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager startMonitoringSignificantLocationChanges];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)receivedWebServiceManagerNotification:(NSNotification *)notification
{
    
    
    NSLog(@"So this is the response: %@", notification.userInfo);
    [self updateUserInterfaceWithMeasurement:notification.userInfo];
}



#pragma mark - LocationManager

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receivedWebServiceManagerNotification:)
                                                 name:K_NOTIFICATION_MEASHUREMENT_FOR_LOCATION_COMPLETE
                                               object:nil];
    
    [[WQWebServiceManager sharedWebServiceManager] getMeasurementForLocation:[locations lastObject]];
}


@end
