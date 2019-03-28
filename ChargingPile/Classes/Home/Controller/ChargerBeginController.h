//
//  ChargerBeginController.h
//  ChargingPile
//
//  Created by MuXingXing on 2019/1/31.
//  Copyright © 2019 muxingxing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ConnectorInfosModel;
NS_ASSUME_NONNULL_BEGIN

@interface ChargerBeginController : UIViewController
@property (nonatomic, strong)ConnectorInfosModel *connectorInfosModel;
/** OperatorID */
@property (nonatomic, copy) NSString *OperatorID;
/** 电桩编号 */
@property (nonatomic, copy) NSString *codeNum;

//接收从订单列表来的参数
@property (nonatomic, strong)NSDictionary *orderDic;
/** 订单号 */
@property (nonatomic, copy) NSString *startchargeseq;

@end

NS_ASSUME_NONNULL_END
