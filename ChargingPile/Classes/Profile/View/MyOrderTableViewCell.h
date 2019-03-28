//
//  MyOrderTableViewCell.h
//  ChargingPile
//
//  Created by MuXingXing on 2019/1/31.
//  Copyright © 2019 muxingxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListModel;
NS_ASSUME_NONNULL_BEGIN

@interface MyOrderTableViewCell : UITableViewCell
@property (nonatomic, strong)ListModel *listModel;
@end

NS_ASSUME_NONNULL_END
