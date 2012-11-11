//
//  WQFuelLikeIndicatorView.m
//  WaterQuality
//
//  Created by Hector Zarate on 11/10/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import "WQFuelLikeIndicatorView.h"
#import <QuartzCore/QuartzCore.h>


#define kFUEL_INDICATOR_BASE_TAG 5678
#define kNUMBER_OF_BARS 5
#define kDISTANCE_BETWEEN_BARS_HORIZONTAL 10
#define kBARS_HEIGHT 30

@implementation WQFuelLikeIndicatorView

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        for (int i=0; i<kNUMBER_OF_BARS; ++i)
        {
            UIView *newBar = [[UIView alloc] initWithFrame:CGRectMake(0.0, (kDISTANCE_BETWEEN_BARS_HORIZONTAL + kBARS_HEIGHT) * i, self.frame.size.width, kBARS_HEIGHT)];
            newBar.tag = kFUEL_INDICATOR_BASE_TAG + i;
            newBar.layer.cornerRadius = 7;
            newBar.layer.masksToBounds = YES;
            newBar.backgroundColor = [UIColor grayColor];
            [self addSubview:newBar];
            
            [newBar release];
        }
        
        
    }
    return self;
}

-(void)updateFuelIndicatorWithPercent:(NSInteger)percent
{
    
}

@end
