//
//  ChargeDetailViewController.m
//  ChargingPile
//
//  Created by MuXingXing on 2019/1/31.
//  Copyright © 2019 muxingxing. All rights reserved.
//

#import "ChargeDetailViewController.h"
#import "ChargeDetailTableViewCell.h"
#import "ChargeListModel.h"
#import "ChargerBeginController.h"

@interface ChargeDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *chargeDetailTableView;
/** 充电枪数组 */
@property (nonatomic, strong)NSMutableArray *connectorInfosAarry;
/** 状态数组 */
@property (nonatomic, strong)NSMutableArray *statusAarry;
@end

@implementation ChargeDetailViewController
static NSString * const ChargeDetailTableViewCellID = @"ChargeDetailTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"桩位详情";
    
    //循环遍历所有充电枪信息
    for(int i = 0;i<self.stationInfosModel.EquipmentInfos.count;i++){
        for (int j = 0; j<self.stationInfosModel.EquipmentInfos[i].ConnectorInfos.count;j++) {
            ConnectorInfosModel *connectorInfosModel = [[ConnectorInfosModel alloc] init];
            connectorInfosModel.ConnectorID = self.stationInfosModel.EquipmentInfos[i].ConnectorInfos[j].ConnectorID;
            connectorInfosModel.ConnectorName = self.stationInfosModel.EquipmentInfos[i].ConnectorInfos[j].ConnectorName;
            [self.connectorInfosAarry addObject:connectorInfosModel];
            connectorInfosModel.EquipmentID = self.stationInfosModel.EquipmentInfos[i].EquipmentID;
            connectorInfosModel.EquipmentType = self.stationInfosModel.EquipmentInfos[i].EquipmentType;
        }
    }
    

    [self httpGettSation_status];
}

- (NSMutableArray *)statusAarry {
    if (!_statusAarry) {
        _statusAarry = [NSMutableArray array];
    }
    return _statusAarry;
}

- (NSMutableArray *)connectorInfosAarry {
    if (!_connectorInfosAarry) {
        _connectorInfosAarry = [NSMutableArray array];
    }
    return _connectorInfosAarry;
}

/** 查询设备实时状态(批量查询) */
- (void)httpGettSation_status {
    
    [BSHttpTool postData:shevcs_query_station_status param:@{@"StationIDs":@[self.stationInfosModel.StationID]} success:^(id successResponse, NSString *message, NSInteger result) {
        if (result) {
            NSArray *StationStatusInfosArray = successResponse[@"StationStatusInfos"];
            NSArray *ConnectorStatusInfosArray = StationStatusInfosArray[0][@"ConnectorStatusInfos"];
            self.statusAarry = [ConnectorStatusInfosModel mj_objectArrayWithKeyValuesArray:ConnectorStatusInfosArray];
            for (int i = 0; i<self.connectorInfosAarry.count; i++) {
                ConnectorInfosModel *connectorInfosModel = self.connectorInfosAarry[i];
                for (int j = 0; j<self.statusAarry.count; j++) {
                    ConnectorStatusInfosModel *connectorStatusInfosModel = self.statusAarry[j];
                    if ([connectorInfosModel.ConnectorID isEqualToString:connectorStatusInfosModel.ConnectorID]) {
                        ConnectorInfosModel *connectorModel = self.connectorInfosAarry[i];
                        connectorModel.Status = connectorStatusInfosModel.Status;
                    }
                }

            }
            
            [self.view addSubview:self.chargeDetailTableView];

        }else {
            [MBProgressHUD showMessage:message];
        }
    } failer:^(NSString *errorStr) {
        BSLog(@"失败%@",errorStr);
    }];
    
}


- (UITableView *)chargeDetailTableView {
    if (_chargeDetailTableView == nil) {
        _chargeDetailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
        _chargeDetailTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _chargeDetailTableView.delegate = self;
        _chargeDetailTableView.dataSource = self;
        [_chargeDetailTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ChargeDetailTableViewCell class]) bundle:nil] forCellReuseIdentifier:ChargeDetailTableViewCellID];
        
        _chargeDetailTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
        }];
    }
    return _chargeDetailTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.connectorInfosAarry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    ChargeDetailTableViewCell *detailCell = [tableView dequeueReusableCellWithIdentifier:ChargeDetailTableViewCellID];
    detailCell.selectionStyle = UITableViewCellSelectionStyleNone;
    detailCell.connectorInfosModel = self.connectorInfosAarry[indexPath.row];
    return detailCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ChargerBeginController *beginVC = [[ChargerBeginController alloc] init];
    beginVC.OperatorID = self.stationInfosModel.OperatorID;
    beginVC.connectorInfosModel = self.connectorInfosAarry[indexPath.row];
    
    [self.navigationController pushViewController:beginVC animated:YES];
}

@end
