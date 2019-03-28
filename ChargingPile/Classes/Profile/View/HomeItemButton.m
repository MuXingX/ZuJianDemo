//
//  HomeItemButton.m
//  BusilinqMall
//
//  Created by MuXingXing on 2018/3/8.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import "HomeItemButton.h"

#define MarkButtonTitleW 40

@implementation HomeItemButton

+ (instancetype)markButton
{
    return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 高亮的时候不要自动调整图标
        self.adjustsImageWhenHighlighted = NO;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        //self.titleLabel.textColor = [UIColor whiteColor];
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 背景
//        self.backgroundColor = [UIColor orangeColor];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0;
    CGFloat imageY = -20;
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.width;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = contentRect.size.width - 25;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - contentRect.size.width;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

@end
