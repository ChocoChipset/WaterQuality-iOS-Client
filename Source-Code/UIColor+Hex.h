//
//  UIColor+Hex.h
//  
//
//  Created by rmeitzler on 6/15/12.
//  Copyright (c) 2012 Richard Meitzler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+(UIColor*)colorWithHex:(uint)hexValue;
+(UIColor*)colorWithHexString:(NSString *)hexString;

+(UIColor*)colorWithHex:(uint)hexValue andAlpha:(float)alpha;
+(UIColor*)colorWithHexString:(NSString *)hexString andAlpha:(float)alpha;


@end
