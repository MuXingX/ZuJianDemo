//
//  UIViewController+showNoData.m
//  BusilinqMall
//
//  Created by MuXingXing on 2018/5/12.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import "UIViewController+showNoData.h"
#import "NodataView.h"

@implementation UIViewController (showNoData)

- (void)showNoData:(NSString *)string {
    
    // 隐藏上次提示视图
    [self hideNoData];
    
    NodataView * nodataView = [[NodataView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    nodataView.remarkStr = string;
    nodataView.tag = 222;
    nodataView.alpha = 0;
    [self.view addSubview:nodataView];
    
    [UIView animateWithDuration:0.5 animations:^{
        nodataView.alpha = 1;
    }];
    
    [nodataView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.equalTo(self.view);
    }];
}
- (void) showRightNoData:(NSString *)string {
    // 隐藏上次提示视图
    [self hideNoData];
    
    NodataView * nodataView = [[NodataView alloc] initWithFrame:CGRectMake(ScreenWidth*0.12, 0, self.view.width, self.view.height)];
    nodataView.remarkStr = string;
    nodataView.tag = 222;
    nodataView.alpha = 0;
    [self.view addSubview:nodataView];
    
    [UIView animateWithDuration:0.5 animations:^{
        nodataView.alpha = 1;
    }];
    
    [nodataView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.equalTo(self.view);
        make.left.offset(self.view.left).offset(ScreenWidth*0.12);
    }];
}

- (void) hideNoData
{
    UIView * view = [self.view viewWithTag:222];
    if (view) {
        view.alpha = 1;
        [UIView animateWithDuration:0.3 animations:^{
            view.alpha = 0;
        } completion:^(BOOL finished) {
            [view removeFromSuperview];
        }];
        view = nil;
    }
}

@end
