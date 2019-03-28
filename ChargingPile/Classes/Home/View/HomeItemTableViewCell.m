//
//  HomeItemTableViewCell.m
//  BusilinqMall
//
//  Created by MuXingXing on 2018/3/8.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import "HomeItemTableViewCell.h"
#import "HomeItemButton.h"

@implementation HomeItemTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
     
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    NSArray *titleNameAry = @[@"电桩列表",@"我的收藏",@"我的预约",@"优惠充电"];
    NSInteger rowCount = 4;
    for (int i = 0; i < titleNameAry.count; i++) {
        HomeItemButton *itemBtn = [HomeItemButton markButton];
        itemBtn.tag = 200+i;
        NSInteger x = i%rowCount;
        NSInteger y = i/rowCount;
        NSInteger kMagin = 10;
        CGFloat width = (ScreenWidth - (rowCount+1) * kMagin) / rowCount;
        CGFloat height = 60;
        itemBtn.frame = CGRectMake(kMagin + (kMagin + width) * x,25 + (kMagin + height) * y, width, height);
        [itemBtn setTitle:titleNameAry[i] forState:UIControlStateNormal];
        [itemBtn setImage:[UIImage imageNamed:titleNameAry[i]] forState:UIControlStateNormal];
        [itemBtn addTarget:self action:@selector(itemButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:itemBtn];
    }
}

- (void)itemButtonClick:(UIButton *)button {
    if (self.itemButtonClickBlock) {
        self.itemButtonClickBlock(button.tag);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
