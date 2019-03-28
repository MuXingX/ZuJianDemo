//
//  ChargerBeginController.m
//  ChargingPile
//
//  Created by MuXingXing on 2019/1/31.
//  Copyright © 2019 muxingxing. All rights reserved.
//

#import "ChargerBeginController.h"
#import "ChargeListModel.h"

@interface ChargerBeginController ()
@property (weak, nonatomic) IBOutlet UILabel *chargeStatus;
@property (nonatomic, copy)NSString *StartChargeSeq;
@property (nonatomic, copy)NSString *ConnectorID;

@property (nonatomic, strong)NSDictionary *paramDic;
//充电订单状态
@property (weak, nonatomic) IBOutlet UILabel *orderStatus;
//充电设备接口状态
@property (weak, nonatomic) IBOutlet UILabel *deviceStatus;

@end

@implementation ChargerBeginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"充电控制";
    self.chargeStatus.text = @"等待充电";
   
    if (!self.OperatorID && !self.startchargeseq) {
        [self setUpCodeNumLabel];
        [self setUpNav];
    }
    if (self.startchargeseq) {
        [self httpGetCharge_status:self.startchargeseq];
    }
}
/** 开始充电 */
- (IBAction)beginChargeAction:(id)sender {
    NSDictionary *param = [NSDictionary dictionary];
    if (self.OperatorID) {
        //判断是否来自订单
        if (self.orderDic) {
            param = self.orderDic;
        }else {
            param =                  @{@"OperatorID":self.OperatorID,
                                       @"ConnectorID":self.connectorInfosModel.ConnectorID,
                                       @"equipmentID":self.connectorInfosModel.EquipmentID,
                                       @"equipmentType":self.connectorInfosModel.EquipmentType
                                       };
        }
        
    }else {
        param = self.paramDic;
    }
    
    [BSHttpTool postData:shevcs_query_query_start_charge param:param success:^(id successResponse, NSString *message, NSInteger result) {
        if (result) {
            [SVProgressHUD showSuccessWithStatus:@"充电已启动"];
            self.chargeStatus.text = @"正在充电中....";
            self.StartChargeSeq = successResponse[@"StartChargeSeq"];
            self.ConnectorID = successResponse[@"ConnectorID"];
            [self httpGetCharge_status:self.StartChargeSeq];
        }else {
            [MBProgressHUD showMessage:message];
        }
    } failer:^(NSString *errorStr) {
        BSLog(@"失败%@",errorStr);
    }];
    
}


- (IBAction)stopChargeAction:(id)sender {
    if (self.StartChargeSeq.length < 1) {
        [MBProgressHUD showLoading:@"还未进行充电" toView:self.view];
        return;
    }
    NSDictionary *paramDic = @{@"StartChargeSeq":self.StartChargeSeq,
                               @"ConnectorID":self.ConnectorID
                               };
    [BSHttpTool postData:shevcs_query_query_stop_charge param:paramDic success:^(id successResponse, NSString *message, NSInteger result) {
        if (result) {
            [SVProgressHUD showSuccessWithStatus:@"充电已停止"];
            self.chargeStatus.text = @"充电已停止！";
            self.StartChargeSeq = successResponse[@"StartChargeSeq"];
            [self httpGetCharge_status:self.StartChargeSeq];

        }else {
            [MBProgressHUD showMessage:message];
        }
    } failer:^(NSString *errorStr) {
        BSLog(@"失败%@",errorStr);
    }];
}

//查询充电状态
- (void)httpGetCharge_status:(NSString *)StartChargeSeq {
    
    [BSHttpTool postData:shevcs_query_equip_charge_status param:@{@"StartChargeSeq":StartChargeSeq} success:^(id successResponse, NSString *message, NSInteger result) {
        if (result) {
            NSString *StartChargeSeqStat = successResponse[@"StartChargeSeqStat"];
            NSString *ConnectorStatus = successResponse[@"ConnectorStatus"];
            
            switch (StartChargeSeqStat.integerValue) {//充电订单状态 1启动中，2充电中，3停止中4,已结束5未知
                case 1:
                    self.orderStatus.text = @"充电订单状态:启动中";
                    break;
                case 2:
                    self.orderStatus.text = @"充电订单状态:充电中";
                    break;
                case 3:
                    self.orderStatus.text = @"充电订单状态:停止中";
                    break;
                case 4:
                    self.orderStatus.text = @"充电订单状态:已结束";
                    break;
                case 5:
                    self.orderStatus.text = @"充电订单状态:未知";
                    break;
                    
                default:
                    break;
            }
            
            switch (ConnectorStatus.integerValue) {//充电设备接口状态 1空闲2占用（未充中）3占用（充电中）4占用（预约锁定）255故障
                case 1:
                    self.deviceStatus.text = @"充电设备接口状态:空闲";
                    break;
                case 2:
                    self.deviceStatus.text = @"充电设备接口状态:占用(未充中)";
                    break;
                case 3:
                    self.deviceStatus.text = @"充电设备接口状态:占用（充电中）";
                    break;
                case 4:
                    self.deviceStatus.text = @"充电设备接口状态:占用（预约锁定）";
                    break;
                case 255:
                    self.deviceStatus.text = @"充电设备接口状态:故障";
                    break;
                default:
                    break;
            }
        }else {
            [MBProgressHUD showMessage:message];
        }
    } failer:^(NSString *errorStr) {
        BSLog(@"失败%@",errorStr);
    }];
}

- (void)setUpCodeNumLabel {
    
    //分割字符串
    NSArray *array = [self.codeNum componentsSeparatedByString:@"."];
    NSString *connectorID = [array[0] substringFromIndex:7];
    NSString *operatorID = [array[1] substringToIndex:9];
    
    NSUInteger idLoc = [self.codeNum rangeOfString:@">"].location + 1;  //"t"得位置
    //  @"</" loc
    NSUInteger typeLoc = [self.codeNum rangeOfString:@"?"].location +1;  //要截取的字符的长度
    
    NSRange idRange = NSMakeRange(idLoc, 8);
    NSRange typeRange = NSMakeRange(typeLoc, 1);
    
    NSString *equipmentID = [self.codeNum substringWithRange:idRange];
    NSString *equipmentType = [self.codeNum substringWithRange:typeRange];
    
    NSLog(@"截取的 -- > OperatorID为：%@ -- ConnectorID为：%@ -- equipmentID为：%@ -- equipmentType为：%@",operatorID,connectorID,equipmentID,equipmentType);
    [self httpQueryEquipAuth:operatorID andConnectorID:connectorID andEquipmentID:equipmentID andEquipmentType:equipmentType];
}

- (void)setUpNav
{
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"箭头"] style:UIBarButtonItemStyleDone target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = backItem;
    
}


- (void)pop
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)httpQueryEquipAuth:(NSString *)OperatorID andConnectorID:(NSString *)ConnectorID andEquipmentID:(NSString *)equipmentID andEquipmentType:(NSString *)equipmentType{
    NSDictionary *paramDic = @{@"OperatorID":OperatorID,@"ConnectorID":ConnectorID,@"equipmentID":equipmentID,@"equipmentType":equipmentType};
    [BSHttpTool postData:shevcs_query_equip_auth param:paramDic success:^(id successResponse, NSString *message, NSInteger result) {
        if (result) {
            [MBProgressHUD showMessage:@"认证成功"];
            self.paramDic = paramDic;
        }else {
            
        }
    } failer:^(NSString *errorStr) {
        BSLog(@"失败%@",errorStr);
    }];
}

@end
