//
//  SVHTTPWQClient.m
//  WaterQuality
//
//  Created by Hector Zarate on 11/10/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import "SVHTTPWQClient.h"

#define kWEB_SERVICE_BASE_PATH @"http://example.com"

// SVHTTPWQClient should be used instead of SVHTTPClient!

@implementation SVHTTPWQClient

-(id)init
{
    self = [super init];
    
    if (self)
    {
        self.sendParametersAsJSON = YES;
        self.basePath = kWEB_SERVICE_BASE_PATH;
    }
    
    return self;
        
}

@end
