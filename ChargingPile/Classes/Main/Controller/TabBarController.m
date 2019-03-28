//
//  TabBarController.m
//  BusilinqMall
//
//  Created by MuXingXing on 2018/3/7.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import "TabBarController.h"
#import "NavigationController.h"
#import "MXHomeViewController.h"
#import "MXProfileViewController.h"
#import "MXSweepCodeViewController.h"
#import "WQCodeScanner.h"
#import "ChargerBeginController.h"
#import "ChargerListViewController.h"

#import "LBTabBar.h"
#import "UIImage+Image.h"

@interface TabBarController ()<LBTabBarDelegate>

@end

@implementation TabBarController

#pragma mark - 第一次使用当前类的时候对设置UITabBarItem的主题
+ (void)initialize
{
    if (@available(iOS 9.0, *)) {
        UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
        
        NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
        dictNormal[NSForegroundColorAttributeName] = [UIColor grayColor];
        dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:11];
        
        NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
        dictSelected[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
        dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:11];
        
        [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
        [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
    } else {
        // Fallback on earlier versions
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpAllChildVc];
    
    //创建自己的tabbar，然后用kvc将自己的tabbar和系统的tabBar替换下
    LBTabBar *tabbar = [[LBTabBar alloc] init];
    tabbar.myDelegate = self;
    //kvc实质是修改了系统的_tabBar
    [self setValue:tabbar forKeyPath:@"tabBar"];
    
    
}


#pragma mark - ------------------------------------------------------------------
#pragma mark - 初始化tabBar上除了中间按钮之外所有的按钮

- (void)setUpAllChildVc
{
    
    
    MXHomeViewController *HomeVC = [[MXHomeViewController alloc] init];
    [self setUpOneChildVcWithVc:HomeVC Image:@"首页" selectedImage:@"首页1" title:@"首页"];
    
    ChargerListViewController *listVC = [[ChargerListViewController alloc] init];
    [self setUpOneChildVcWithVc:listVC Image:@"首页" selectedImage:@"首页1" title:@"列表"];
    
    MXProfileViewController *MessageVC = [[MXProfileViewController alloc] init];
    [self setUpOneChildVcWithVc:MessageVC Image:@"我的" selectedImage:@"我的1" title:@"消息"];
    
    MXProfileViewController *MineVC = [[MXProfileViewController alloc] init];
    [self setUpOneChildVcWithVc:MineVC Image:@"我的" selectedImage:@"我的1" title:@"我的"];
    
    
}

#pragma mark - 初始化设置tabBar上面单个按钮的方法

/**
 *  @author li bo, 16/05/10
 *
 *  设置单个tabBarButton
 *
 *  @param Vc            每一个按钮对应的控制器
 *  @param image         每一个按钮对应的普通状态下图片
 *  @param selectedImage 每一个按钮对应的选中状态下的图片
 *  @param title         每一个按钮对应的标题
 */
- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:Vc];
    
    
    Vc.view.backgroundColor = [UIColor whiteColor];
    
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    Vc.tabBarItem.image = myImage;
    
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    Vc.tabBarItem.selectedImage = mySelectedImage;
    
    Vc.tabBarItem.title = title;
    
    Vc.navigationItem.title = title;
    
    [self addChildViewController:nav];
    
}



#pragma mark - ------------------------------------------------------------------
#pragma mark - LBTabBarDelegate
//点击中间按钮的代理方法
- (void)tabBarPlusBtnClick:(LBTabBar *)tabBar
{
    WEAKSELF
    WQCodeScanner *wqCodeVC = [[WQCodeScanner alloc] init];
    wqCodeVC.view.backgroundColor = [self randomColor];
    NavigationController *navVc = [[NavigationController alloc] initWithRootViewController:wqCodeVC];
    [self presentViewController:navVc animated:YES completion:nil];
    
    wqCodeVC.resultBlock = ^(NSString *value) {
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3/*延迟执行时间*/ * NSEC_PER_SEC));
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            ChargerBeginController *codeVC = [[ChargerBeginController alloc] init];
            codeVC.codeNum = value;
            codeVC.view.backgroundColor = [UIColor whiteColor];
            NavigationController *navVc = [[NavigationController alloc] initWithRootViewController:codeVC];
            [weakSelf presentViewController:navVc animated:YES completion:nil];
        });
        

    };
    
}


- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
}


@end
