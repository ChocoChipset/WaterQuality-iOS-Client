//
//  WQMeasurementsTableViewController.m
//  WaterQuality
//
//  Created by Hector Zarate on 11/10/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import "WQMeasurementsListViewController.h"
#import "WQWebServiceManager.h"

@interface WQMeasurementsListViewController ()

@end

@implementation WQMeasurementsListViewController


-(void)dealloc
{
    [_tableView release];
    
    [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(listOfMeasurementsComplete:)
                                                 name:K_NOTIFICATION_MEASHUREMENTS_LIST_COMPLETE
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"List of Sources";
    [[WQWebServiceManager sharedWebServiceManager] getListOfMeasurementsForLocation:[[CLLocation alloc] initWithLatitude:self.point.latitude longitude:self.point.longitude]
                                                               withinRadioLongitude:self.longitudeDelta
                                                                withinRadioLatitude:self.longitudeDelta
                                                                    resultLimitedTo:kDEFAULT_LIMIT_FOR_MEASUREMENTS
                                                                    notificationKey:K_NOTIFICATION_MEASHUREMENTS_LIST_COMPLETE];
}

- (void)listOfMeasurementsComplete:(NSNotification *)notification
{
    self.dataSource = [[notification userInfo] objectForKey:@"objects"];
    self.dataSource = [[NSMutableArray arrayWithArray:self.dataSource] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *name1 = [obj1 objectForKey:@"locationName"];
        NSString *name2 = [obj2 objectForKey:@"locationName"];
        return [name1 compare:name2];
    }];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSLog(@"%@",indexPath);
    NSDictionary *currentMesure = [self.dataSource objectAtIndex:indexPath.row];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    image.contentMode = UIViewContentModeScaleAspectFit;
    image.image = [self listIconForMeasurementWithCode:[[currentMesure objectForKey:@"code"] integerValue]];
    cell.imageView.image = [self listIconForMeasurementWithCode:[[currentMesure objectForKey:@"code"] integerValue]];
    cell.textLabel.text = [currentMesure objectForKey:@"locationName"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/





#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.currentMeasurement = [self.dataSource objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"ShowDetailsAboutMeasurementsFromList" sender:self];
}

@end
