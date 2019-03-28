//
//  ChargingDetailController.m
//  ChargingPile
//
//  Created by MuXingXing on 2019/2/1.
//  Copyright © 2019 muxingxing. All rights reserved.
//

#import "ChargingDetailController.h"
#import "OrderCompleteModel.h"

@interface ChargingDetailController ()
@property (weak, nonatomic) IBOutlet UILabel *startTime;
@property (weak, nonatomic) IBOutlet UILabel *endTime;
@property (weak, nonatomic) IBOutlet UILabel *electricSum;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *status;

/** 数据模型 */
@property (nonatomic, strong)OrderCompleteModel *orderCompleteModel;

@end

@implementation ChargingDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"充电详情";
    [self httpGetChargingList];
}

- (IBAction)refleshStatus:(id)sender {
    [self httpGetChargingList];
}

- (IBAction)stopChargeAction:(id)sender {
    ListModel *listModel = self.orderCompleteModel.list[self.index];

    NSDictionary *paramDic = @{@"StartChargeSeq":listModel.startchargeseq,
                               @"ConnectorID":listModel.connectorid
                               };
    [BSHttpTool postData:shevcs_query_query_stop_charge param:paramDic success:^(id successResponse, NSString *message, NSInteger result) {
        if (result) {
            [SVProgressHUD showSuccessWithStatus:@"充电已停止"];
            [self.navigationController popViewControllerAnimated:YES];
            
        }else {
            [MBProgressHUD showMessage:message];
        }
    } failer:^(NSString *errorStr) {
        BSLog(@"失败%@",errorStr);
    }];
}

- (void)refleshData {
    ListModel *listModel = self.orderCompleteModel.list[self.index];
    self.startTime.text = [NSString stringWithFormat:@"创建时间:%@",listModel.createTime];
    self.endTime.text = [NSString stringWithFormat:@"更新时间:%@",listModel.updateTime];
    self.electricSum.text = [NSString stringWithFormat:@"设备id:%@",listModel.equipmentid];
    self.price.text = [NSString stringWithFormat:@"充电id:%@",listModel.chargeId];
    self.status.text = @"充电状态:正在充电";
}

/** 获取充电中列表 */
- (void)httpGetChargingList {
    
    [BSHttpTool postData:shevcs_query_start_charge_list param:@{@"PageNo":@"1",@"PageSize":@"10"} success:^(id successResponse, NSString *message, NSInteger result) {
        if (result) {
            self.orderCompleteModel = [OrderCompleteModel mj_objectWithKeyValues:successResponse];
            [self refleshData];
        }else {
            [SVProgressHUD showErrorWithStatus:message];
        }
    } failer:^(NSString *errorStr) {
        BSLog(@"失败%@",errorStr);
        [SVProgressHUD dismiss];
    }];
}

@end
