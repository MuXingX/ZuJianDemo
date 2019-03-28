//
//  UIColor+Transform.h
//  BusilinqMall
//
//  Created by MuXingXing on 2018/3/7.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Transform)

//十六进制颜色转UIColor

+ (UIColor *)colorWithHexString:(NSString*)stringToConvert;

/** 渐变色 */
+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr;

@end
