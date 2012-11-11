//
//  UIColor+UIColor_Hex.m
//  
//
//  Created by rmeitzler on 6/15/12.
//  Copyright (c) 2012 Richard Meitzler. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+(UIColor*)colorWithHex:(uint)hexValue {
    return [UIColor colorWithHex:hexValue andAlpha:1.0];
}

+(UIColor*)colorWithHexString:(NSString*)hexString {
    return [UIColor colorWithHexString:hexString andAlpha:1.0];
}

+(UIColor*)colorWithHex:(uint)hexValue andAlpha:(float)alpha {
    return [UIColor
            colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
            green:((float)((hexValue & 0xFF00) >> 8))/255.0
            blue:((float)(hexValue & 0xFF))/255.0
            alpha:alpha];
}

+(UIColor*)colorWithHexString:(NSString*)hexString andAlpha:(float)alpha
{
    UIColor *resultingColor = nil;
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#"
                                                     withString:@"0x"];
    uint hexValue;
    
    if ([[NSScanner scannerWithString:hexString] scanHexInt:&hexValue])
    {
        resultingColor = [self colorWithHex:hexValue andAlpha:alpha];
    }
    return resultingColor;
}


@end
