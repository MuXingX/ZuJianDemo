//
//  BorderLayerView.m
//  BusilinqMall
//
//  Created by MuXingXing on 2018/4/17.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import "BorderLayerView.h"

@implementation BorderLayerView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 20;
    self.layer.borderColor = [UIColor colorWithHexString:@"e6e6e6"].CGColor;
    self.layer.borderWidth = 1;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderColor = [UIColor colorWithHexString:@"e6e6e6"].CGColor;
        self.layer.borderWidth = 1;
    }
    return self;
}

@end
