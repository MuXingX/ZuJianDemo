//
//  UIButton+Extend.h
//  fastApply
//
//  Created by 李莎 on 15/12/1.
//  Copyright © 2015年 创博龙智. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extend)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;
//60秒倒计时
-(void)sixtySecondsCountdown:(UIButton *)btn titelColor:(UIColor *)titleColor;

@end
