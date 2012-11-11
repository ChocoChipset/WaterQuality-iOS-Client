//
//  UIViewController+LoadingScreen.m
//  WaterQuality
//
//  Created by Hector Zarate on 11/11/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import "UIViewController+LoadingScreen.h"



@implementation UIViewController (LoadingScreen)

-(void)showLoadingScreen
{
    if (![self.view viewWithTag:kLOADING_VIEW_TAG])
    {
        UIView *loadingScreen = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 450)];

        loadingScreen.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.8];
        loadingScreen.tag = kLOADING_VIEW_TAG;
        
        UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 270.0, 30, 30)];
        [activityIndicator startAnimating];
        [loadingScreen addSubview:activityIndicator];
        [activityIndicator release];
        
        UILabel *loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 250.0, self.view.frame.size.width, 200)];
        
        [loadingScreen addSubview:loadingLabel];
        [loadingLabel release];
        [self.view addSubview:loadingScreen];
        [loadingScreen release];
    }

    
    
}


-(void)hideLoadingScreen
{
    UIView *loadingScreenView = [self.view viewWithTag:kLOADING_VIEW_TAG];
    
    [loadingScreenView removeFromSuperview];    // if nil, then this method just returns 0.
    
}

@end
