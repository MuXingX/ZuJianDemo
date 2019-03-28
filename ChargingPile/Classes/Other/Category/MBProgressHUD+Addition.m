//
//  MBProgressHUD+Addition.m
//  yongdonghulian
//
//  Created by 李健 on 17/4/13.
//  Copyright © 2017年 维讯. All rights reserved.
//

#import "MBProgressHUD+Addition.h"
#import "UIColor+Transform.h"

@implementation MBProgressHUD (Addition)

#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.bezelView.color = [UIColor colorWithHexString:@"#f4f4f4"];
    hud.label.text = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"SVProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    //2秒之后再消失
    [hud hideAnimated:YES afterDelay:2.0];
}

- (void)startAnimation:(UIView *)img {
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnimation.toValue =  @(M_PI * 2.0);
    rotationAnimation.duration = 0.5;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 100000;
    [img.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view {
    [self show:error icon:@"error.png" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view {
    [self show:success icon:@"success.png" view:view];
}

#pragma mark 显示信息

+ (void)showLoading:(UIView *)view {
    [self showLoading:nil toView:view];
}

+ (void)showLoadingTxt:(NSString *)loadingTxt view:(UIView *)view
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // Set the label text.
    hud.label.text = loadingTxt;
    hud.bezelView.color = [UIColor colorWithRed:0.41f green:0.46f blue:0.50f alpha:0.600f];
    hud.removeFromSuperViewOnHide = YES;
    hud.bezelView.color = [UIColor colorWithHexString:@"#f4f4f4"];
    hud.removeFromSuperViewOnHide = YES;
}

+ (void)showLoading:(NSString *)text toView:(UIView *)view {
    
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    if (text.length == 0) {
        //        text = @"Loading";
    }
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // Set the label text.
    hud.label.text = text;
    hud.bezelView.color = [UIColor colorWithRed:0.41f green:0.46f blue:0.50f alpha:0.600f];
    hud.removeFromSuperViewOnHide = YES;
    //>>>>>>>changed by LiuChang in 2017\5\11
    //    [hud hide:YES afterDelay:15];
    //<<<<<<<<<
    
    // 设置此属性时 hud提示框 会进行适应 根据text长度进行拉伸
    // hud.square = YES;
    hud.bezelView.color = [UIColor colorWithHexString:@"#f4f4f4"];
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:18];
}

+ (void)showMessage:(NSString *)message {
    [self showMessage:message toView:nil];
}
#pragma mark 显示一些信息
+ (void)showMessage:(NSString *)message toView:(UIView *)view {
    if (message == nil) {
        return;
    }
    if (message.length == 0) return;
    
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    hud.mode = MBProgressHUDModeText;
    hud.margin = 10.f;
    // 设置hub颜色
    hud.bezelView.color = [UIColor colorWithHexString:@"#f4f4f4"];
    hud.bezelView.layer.cornerRadius = 5.0f;
    // 设置边框颜色
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 2秒之后再消失
    [hud hideAnimated:YES afterDelay:2.0];
}

+ (void)showMessage:(NSString *)message detailMessage:(NSString*)detailMessage toView:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    hud.detailsLabel.text = detailMessage;
    hud.mode = MBProgressHUDModeText;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    
    // 1.5秒之后再消失
    [hud hideAnimated:YES afterDelay:1.5];
}

+ (void)hideHUDForView:(UIView *)view
{
    [MBProgressHUD hideHUDForView:view animated:YES];
}

+ (void)hideAllHUDsInView:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
}
@end
