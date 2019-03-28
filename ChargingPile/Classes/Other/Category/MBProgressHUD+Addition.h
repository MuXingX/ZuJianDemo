//
//  MBProgressHUD+Addition.h
//  yongdonghulian
//
//  Created by 李健 on 17/4/13.
//  Copyright © 2017年 维讯. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (Addition)
+ (void)showError:(NSString *)error
           toView:(UIView *)view;

+ (void)showSuccess:(NSString *)success
             toView:(UIView *)view;
/**
 *  尽量都使用这个
 */
+ (void)showLoading:(UIView *)view;
+ (void)showLoading:(NSString *)text
             toView:(UIView *)view;

/**
 *  尽量都使用这个
 */
+ (void)showMessage:(NSString *)message;
+ (void)showMessage:(NSString *)message
             toView:(UIView *)view;

+ (void)showMessage:(NSString *)message
      detailMessage:(NSString*)detailMessage
             toView:(UIView *)view;
/**
 *  尽量都使用这个
 */
+ (void)hideHUDForView:(UIView *)view;

+ (void)hideAllHUDsInView:(UIView *)view;



//永远不消失
+ (void)showLoadingTxt:(NSString *)loadingTxt view:(UIView *)view;

@end
