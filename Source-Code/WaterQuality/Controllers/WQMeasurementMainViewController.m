//
//  WQMeasurementMainViewController.m
//  WaterQuality
//
//  Created by Hector Zarate on 11/10/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import "WQMeasurementMainViewController.h"
#import "WQWebServiceManager.h"

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
    
    UIColor *persentLabelColor = nil;
    
    if (percentage < kPERCENT_LABEL_GREEN_LABEL_LIMIT
        && percentage >= kPERCENT_LABEL_DARK_GREEN_LABEL_LIMIT)
    {
        persentLabelColor = [UIColor greenColor];
    }
    else if (percentage < kPERCENT_LABEL_DARK_GREEN_LABEL_LIMIT
                 && percentage >= kPERCENT_LABEL_YELLOW_LABEL_LIMIT)
    {
        persentLabelColor = [UIColor greenColor];
    }
    else if (percentage < kPERCENT_LABEL_YELLOW_LABEL_LIMIT
             && percentage >= kPERCENT_LABEL_ORANGE_LABEL_LIMIT)
    {
        persentLabelColor = [UIColor orangeColor];
    }
    else if (percentage < kPERCENT_LABEL_ORANGE_LABEL_LIMIT
             && percentage >= kPERCENT_LABEL_RED_LABEL_LIMIT)
    {
        persentLabelColor = [UIColor yellowColor];
    }
    else if (percentage < kPERCENT_LABEL_RED_LABEL_LIMIT
             && percentage >= 0)
    {
        persentLabelColor = [UIColor redColor];
    }
    else
    {
        persentLabelColor = [UIColor darkGrayColor];
        NSLog(@"Warning: No color available for range.");
    }

    self.persentLabel.textColor = persentLabelColor;
}

-(void)setIconImageForCode:(NSInteger)code
{
    NSString *iconImageName = @"CodeIcon_0";
    
    if (code == 0)
    {
        
    }
    else
    {
        NSLog(@"Warning: Unrecognized Code Image");
    }
    
    self.iconImageView.image = [UIImage imageNamed:iconImageName];
    
}

-(void)updateUserInterfaceWithMeasurement:(NSDictionary *)dictionary
{
    [self setIconImageForCode:[[dictionary valueForKey:@"code"] intValue]];
    [self setPercentLabelForPercentage: [[dictionary valueForKey:@"quality"] intValue]];
    self.placeNameLabel.text = [dictionary valueForKey:@"locationName"];
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
