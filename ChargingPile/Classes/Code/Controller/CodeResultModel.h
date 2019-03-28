//
//  CodeResultModel.h
//  ChargingPile
//
//  Created by MuXingXing on 2019/1/31.
//  Copyright © 2019 muxingxing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CodeResultModel : NSObject

@property (nonatomic, copy) NSString *OperatorID;
@property (nonatomic, copy) NSString *ConnectorID;
@property (nonatomic, copy) NSString *equipmentType;
@property (nonatomic, copy) NSString *equipmentID;

@end

NS_ASSUME_NONNULL_END
