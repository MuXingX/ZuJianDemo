//
//  OrderCompleteModel.h
//  ChargingPile
//
//  Created by MuXingXing on 2019/1/31.
//  Copyright © 2019 muxingxing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class ListModel;

@interface OrderCompleteModel : NSObject
@property (nonatomic, copy) NSString *totalCount;
@property (nonatomic, copy) NSString *pageSize;
@property (nonatomic, copy) NSString *totalPage;
@property (nonatomic, copy) NSString *currPage;
@property (nonatomic, strong) NSArray<ListModel *> *list;

@end


@interface ListModel : NSObject
//已完成模型
@property (nonatomic, copy) NSString *listID;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *paystatus;
@property (nonatomic, copy) NSString *startchargeseq;
@property (nonatomic, copy) NSString *connectorid;
@property (nonatomic, copy) NSString *starttime;
@property (nonatomic, copy) NSString *endtime;
@property (nonatomic, copy) NSString *totalpower;
@property (nonatomic, copy) NSString *totalelecmoney;
@property (nonatomic, copy) NSString *totalsevicemoney;
@property (nonatomic, copy) NSString *totalmoney;
@property (nonatomic, copy) NSString *stopreason;
@property (nonatomic, copy) NSString *sumperiod;
@property (nonatomic, copy) NSString *chargedetails;
@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, copy) NSString *updateTime;

//充电中模型
@property (nonatomic, copy) NSString *chargeId;
@property (nonatomic, copy) NSString *operatorid;
@property (nonatomic, copy) NSString *equipmentid;
@property (nonatomic, copy) NSString *equipmenttype;
@property (nonatomic, copy) NSString *startchargeseqstat;
@property (nonatomic, copy) NSString *succstat;
@property (nonatomic, copy) NSString *failreason;

@end


NS_ASSUME_NONNULL_END
