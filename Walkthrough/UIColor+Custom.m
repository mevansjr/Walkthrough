//  Created by Mark Evans on 9/15/14.
//  Copyright (c) 2014 3Advance, LLC. All rights reserved.
//

#import "UIColor+Custom.h"
#import "UIColor+HEX.h"

@implementation UIColor (Custom)

+ (UIColor *)CustomGreenColor
{
    return [UIColor colorWithHex:0x22823d];
}

+ (UIColor *)CustomTabGrayColor
{
    return [UIColor colorWithHex:0x1d1d1d];
}

+ (UIColor *)CustomBackgroundGrayColorStart
{
    return [UIColor colorWithHex:0x202020];
}

+ (UIColor *)CustomBackgroundGrayColorStop
{
    return [UIColor colorWithHex:0x252525];
}

+ (UIColor *)CustomBackgroundOffBlackColor
{
    return [UIColor colorWithHex:0x151515];
}

+ (UIColor *)CustomLineGrayColor
{
    return [UIColor colorWithHex:0x333333];
}

+ (UIColor *)CustomRedColor
{
    return [UIColor colorWithHex:0xf23f46];
}

@end
