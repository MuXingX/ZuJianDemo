//
//  ChargeDetailTableViewCell.h
//  ChargingPile
//
//  Created by MuXingXing on 2019/1/31.
//  Copyright © 2019 muxingxing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EquipmentInfosModel;
@class ConnectorInfosModel;
@class ConnectorStatusInfosModel;
NS_ASSUME_NONNULL_BEGIN

@interface ChargeDetailTableViewCell : UITableViewCell
@property (nonatomic, strong)ConnectorInfosModel *connectorInfosModel;
@property (nonatomic, strong)ConnectorStatusInfosModel *connectorStatusInfosModel;
@end

NS_ASSUME_NONNULL_END
