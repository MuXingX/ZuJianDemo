//
//  MXXTitleButton.m
//  BusilinqMall
//
//  Created by MuXingXing on 2018/4/23.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import "MXXTitleButton.h"

@implementation MXXTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self setTitleColor:GlobalTitleColor forState:UIControlStateNormal];
        [self setTitleColor:GlobalColor forState:UIControlStateSelected];
    }
    return self;
}
@end
