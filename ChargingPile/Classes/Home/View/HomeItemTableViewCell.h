//
//  HomeItemTableViewCell.h
//  BusilinqMall
//
//  Created by MuXingXing on 2018/3/8.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ItemButtonClickBlock)(NSInteger btnTag);

@interface HomeItemTableViewCell : UITableViewCell
/** 事件点击 */
@property (nonatomic, copy) ItemButtonClickBlock itemButtonClickBlock;

@end
