//
//  ProfilItemTableViewCell.m
//  BusilinqMall
//
//  Created by MuXingXing on 2018/3/8.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import "ProfilItemTableViewCell.h"
#import "HomeItemButton.h"

@implementation ProfilItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSArray *titleNameAry = @[@"我的订单",@"退货单",@"付款单",@"发货单"];
    NSArray *imageNameAry = @[@"mine_我的订单",@"mine_退货单",@"mine_付款单",@"mine_发货单"];
    NSInteger rowCount = 4;
    for (int i = 0; i < titleNameAry.count; i++) {
        HomeItemButton *itemBtn = [HomeItemButton markButton];
        itemBtn.tag = i;
        NSInteger x = i%rowCount;
        NSInteger y = i/rowCount;
        NSInteger kMagin = 10;
        CGFloat width = (ScreenWidth - (rowCount+1) * kMagin) / rowCount;
        CGFloat height = 60;
        itemBtn.frame = CGRectMake(kMagin + (kMagin + width) * x,kMagin + (kMagin + height) * y, width, height);
        itemBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [itemBtn setTitle:titleNameAry[i] forState:UIControlStateNormal];
        [itemBtn setImage:[UIImage imageNamed:imageNameAry[i]] forState:UIControlStateNormal];
        [itemBtn addTarget:self action:@selector(profileItemTouchAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:itemBtn];
    }
}

- (void)profileItemTouchAction:(UIButton *)button {
    NSLog(@"点击了第%ld",(long)button.tag);
}

@end
