//
//  UIButton+Extend.m
//  fastApply
//
//  Created by 李莎 on 15/12/1.
//  Copyright © 2015年 创博龙智. All rights reserved.
//

#import "UIButton+Extend.h"

@implementation UIButton (Extend)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundImage:[UIButton imageWithColor:backgroundColor] forState:state];
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

//开启倒计时
-(void)sixtySecondsCountdown:(UIButton *)btn titelColor:(UIColor *)titleColor {
    
    __block NSInteger time = 60; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(time <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置按钮的样式
                [btn setTitle:@"重新发送" forState:UIControlStateNormal];
                [btn setTitleColor:GlobalColor forState:UIControlStateNormal];
                btn.userInteractionEnabled = YES;
                btn.backgroundColor = [UIColor whiteColor];
                btn.layer.borderColor = GlobalColor.CGColor;
            });
        }else{
            int seconds = time % 61;
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置按钮显示读秒效果
                [btn setTitle:[NSString stringWithFormat:@"重新发送%.2d", seconds] forState:UIControlStateNormal];
                [btn setTitleColor:titleColor forState:UIControlStateNormal];
                btn.backgroundColor = [UIColor colorWithHexString:@"e6e6e6"];
                btn.userInteractionEnabled = NO;
                btn.layer.borderColor = [UIColor clearColor].CGColor;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}

@end
