//
//  ChargerListCell.h
//  ChargingPile
//
//  Created by MuXingXing on 2019/1/30.
//  Copyright © 2019 muxingxing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StationInfosModel;
NS_ASSUME_NONNULL_BEGIN

@interface ChargerListCell : UITableViewCell
@property (nonatomic, strong)StationInfosModel *stationInfosModel;
@end

NS_ASSUME_NONNULL_END
