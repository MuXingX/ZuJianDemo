//
//  OrderCompleteModel.m
//  ChargingPile
//
//  Created by MuXingXing on 2019/1/31.
//  Copyright © 2019 muxingxing. All rights reserved.
//

#import "OrderCompleteModel.h"

@implementation OrderCompleteModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"list":[ListModel class]};
}

@end

@implementation ListModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"listID":@"id"};
}
@end
