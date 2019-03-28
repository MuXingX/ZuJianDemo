//
//  ChargeListModel.m
//  ChargingPile
//
//  Created by MuXingXing on 2019/1/31.
//  Copyright © 2019 muxingxing. All rights reserved.
//

#import "ChargeListModel.h"

@implementation ChargeListModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"StationInfos":[StationInfosModel class]};
}

@end


@implementation StationInfosModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"EquipmentInfos":[EquipmentInfosModel class]};
}

@end



@implementation EquipmentInfosModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"ConnectorInfos":[ConnectorInfosModel class]};
}

@end


@implementation ConnectorInfosModel

@end


@implementation ConnectorStatusInfosModel

@end

