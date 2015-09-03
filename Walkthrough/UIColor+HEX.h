//
//  UIColor+HEX.h
//
//  Created by Mark Evans on 9/15/14.
//  Copyright (c) 2014 3Advance, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HEX)

+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHex:(int)hexValue;

@end
