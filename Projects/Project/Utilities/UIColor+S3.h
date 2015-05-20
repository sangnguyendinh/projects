//
//  UIColor+ARIS.h
//  ARIS VIETNAM
//
//  Created by Hung Tran on 8/3/12.
//  Copyright (c) ARIS VIETNAM. All rights reserved.
//

@interface UIColor(S3)

+ (UIColor *)colorFromHexString:(NSString *)hexString;
+ (UIColor *)colorWith256Red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (UIColor *)colorFromString:(NSString *)string;

@end


@interface NSString(UIColorS3)

+ (NSString *)stringFromColor:(UIColor *)color;

@end