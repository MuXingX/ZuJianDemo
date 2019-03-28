//
//  BSSearchButton.m
//  BusilinqMall
//
//  Created by MuXingXing on 2018/4/18.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import "BSSearchButton.h"

@implementation BSSearchButton

static BSSearchButton * _instance = nil;

+ (instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [self buttonWithType:UIButtonTypeCustom];
    }) ;
    
    return _instance ;
}


+ (instancetype)buttonWithType:(UIButtonType)buttonType{
    BSSearchButton *searchButton = [super buttonWithType:buttonType];
    if (searchButton) {
        CGFloat searchBarHeight = 30;
        searchButton.frame = CGRectMake(40, 5, ScreenWidth - 80, searchBarHeight);
        [searchButton setTitle:@"商品搜索" forState:UIControlStateNormal];
        [searchButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -100, 0, 100)];
        searchButton.titleLabel.font = [UIFont systemFontOfSize:12];
        searchButton.titleLabel.textAlignment = NSTextAlignmentLeft;
        [searchButton setImage:[UIImage imageNamed:@"搜索"] forState:UIControlStateNormal];
        [searchButton setImageEdgeInsets:UIEdgeInsetsMake(0, (ScreenWidth - 80)/2, 0, -(ScreenWidth - 80)/2)];
        searchButton.backgroundColor = ColorRGBA(240, 240, 240,0.25);
        searchButton.layer.cornerRadius = searchBarHeight/2;
        searchButton.layer.masksToBounds = YES;
    }
    return searchButton;
}




@end
