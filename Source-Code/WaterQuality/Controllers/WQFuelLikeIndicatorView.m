//
//  WQFuelLikeIndicatorView.m
//  WaterQuality
//
//  Created by Hector Zarate on 11/10/12.
//  Copyright (c) 2012 HackWAW. All rights reserved.
//

#import "WQFuelLikeIndicatorView.h"
#import <QuartzCore/QuartzCore.h>
#import "UIColor+Hex.h"

#define kFUEL_INDICATOR_BASE_TAG 5678
#define kNUMBER_OF_BARS 5
#define kDISTANCE_BETWEEN_BARS_HORIZONTAL 13
#define kBARS_HEIGHT 27

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
            newBar.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.15];
            [self addSubview:newBar];
            
            [newBar release];
        }
        
        
    }
    return self;
}

-(void)updateFuelIndicatorWithPercent:(NSInteger)percentage
{
    int numberOfBarsToColor = lroundf(percentage/(100/self.subviews.count));
    
    NSArray *colorsForBars = [NSArray arrayWithObjects: [UIColor colorWithHexString:@"E7F4FB"],
                              [UIColor colorWithHexString:@"8CCEF0"],
                              [UIColor colorWithHexString:@"32A8E5"],
                              [UIColor colorWithHexString:@"136E9D"],
                              [UIColor colorWithHexString:@"082E42"],
                              nil];
    
    for (int i = kNUMBER_OF_BARS-1 ; i >= kNUMBER_OF_BARS - numberOfBarsToColor ; i--)
    {
        ((UIView *)[self.subviews objectAtIndex:i]).backgroundColor = (UIColor *)[colorsForBars objectAtIndex:i];
    }
}

@end
