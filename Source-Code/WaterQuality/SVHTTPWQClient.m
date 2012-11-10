//
//  SVHTTPWQClient.m
//  WaterQuality
//
//  Created by Hector Zarate on 11/10/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import "SVHTTPWQClient.h"

// SVHTTPWQClient should be used instead of SVHTTPClient!

@implementation SVHTTPWQClient

-(id)init
{
    self = [super init];
    
    if (self)
    {
        self.sendParametersAsJSON = NO;
        self.basePath = kWEB_SERVICE_BASE_URL;
    }
    
    return self;
        
}

@end
