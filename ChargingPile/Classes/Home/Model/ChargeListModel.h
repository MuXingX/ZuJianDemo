//
//  ChargeListModel.h
//  ChargingPile
//
//  Created by MuXingXing on 2019/1/31.
//  Copyright © 2019 muxingxing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class StationInfosModel;
@class EquipmentInfosModel;
@class ConnectorInfosModel;

@interface ChargeListModel : NSObject

/**  */
@property (nonatomic, copy) NSString *PageCount;
@property (nonatomic, copy) NSString *PageNo;
@property (nonatomic, copy) NSString *ItemSize;
@property (nonatomic, strong) NSArray<StationInfosModel *> *StationInfos;


@end


@interface StationInfosModel : NSObject

/**  */
@property (nonatomic, copy) NSString *Construction;
@property (nonatomic, copy) NSString *EquipmentOwnerID;
@property (nonatomic, copy) NSString *StationLng;
@property (nonatomic, copy) NSString *Address;
@property (nonatomic, copy) NSString *ServiceTel;
@property (nonatomic, copy) NSString *SupportOrder;
@property (nonatomic, copy) NSString *OperatorID;
@property (nonatomic, copy) NSString *StationID;
@property (nonatomic, copy) NSString *StationBname;
@property (nonatomic, copy) NSString *StationName;
@property (nonatomic, copy) NSString *StationLat;
@property (nonatomic, copy) NSString *AreaCode;
@property (nonatomic, copy) NSString *StationStatus;
@property (nonatomic, copy) NSString *CountryCode;
@property (nonatomic, copy) NSString *ParkNums;
@property (nonatomic, copy) NSString *Distance;
@property (nonatomic, copy) NSString *StationType;

@property (nonatomic, strong) NSArray<EquipmentInfosModel *> *EquipmentInfos;


@end



@interface EquipmentInfosModel : NSObject

@property (nonatomic, copy) NSString *Status;
@property (nonatomic, copy) NSString *EquipmentID;
@property (nonatomic, copy) NSString *ManufacturerID;
@property (nonatomic, copy) NSString *EquipmentLng;
@property (nonatomic, copy) NSString *EquipmentModel;
@property (nonatomic, copy) NSString *DbTime;
@property (nonatomic, copy) NSString *EquipmentType;
@property (nonatomic, copy) NSString *EquipmentLat;
@property (nonatomic, copy) NSString *Power;
@property (nonatomic, copy) NSString *Distance;

@property (nonatomic, strong) NSArray<ConnectorInfosModel *> *ConnectorInfos;


@end


@interface ConnectorInfosModel : NSObject

/**  */
@property (nonatomic, copy) NSString *VoltageLowerLimits;
@property (nonatomic, copy) NSString *ConnectorType;
@property (nonatomic, copy) NSString *VoltageUpperLimits;
@property (nonatomic, copy) NSString *ConnectorName;
@property (nonatomic, copy) NSString *nationalStandard;
@property (nonatomic, copy) NSString *Current;
@property (nonatomic, copy) NSString *Power;
@property (nonatomic, copy) NSString *ConnectorID;

//额外增加3个属性
@property (nonatomic, copy) NSString *EquipmentID;
@property (nonatomic, copy) NSString *EquipmentType;
/** 状态 */
@property (nonatomic, copy) NSString *Status;
@end


//状态模型
@interface ConnectorStatusInfosModel : NSObject
/** 状态 */
@property (nonatomic, copy) NSString *Status;
/** 设备id */
@property (nonatomic, copy) NSString *ConnectorID;

@end

NS_ASSUME_NONNULL_END
