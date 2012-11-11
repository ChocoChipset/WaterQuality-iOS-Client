//
//  WQAnotation.m
//  WaterQuality
//
//  Created by Kamil Wasag on 11/11/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import "WQAnotation.h"

@implementation WQAnotation

- (void)dealloc
{
    [_measurement release];
    [super dealloc];
}

@end
