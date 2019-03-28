//
//  ChargerListViewController.m
//  ChargingPile
//
//  Created by MuXingXing on 2019/1/30.
//  Copyright © 2019 muxingxing. All rights reserved.
//

#import "ChargerListViewController.h"
#import "ChargerListCell.h"
#import "ChargeListModel.h"
#import "ChargeDetailViewController.h"

@interface ChargerListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *chargeListTableView;
@property (nonatomic, strong)ChargeListModel *chargeListModel;
@end

@implementation ChargerListViewController

static NSString * const chargeListCellID = @"ChargerListCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"充电桩列表";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.chargeListTableView];
    
    [self httpGetChargeListData];
}

- (void)httpGetChargeListData {
//    @{@"LastQueryTime":@"",@"PageNo":@"1",@"PageSize":@"10",@"positionLng":@"106.782745",@"positionLat":@"26.538608"}
    [BSHttpTool postData:shevcs_query_stations_info param:@{@"PageSize":@"20"} success:^(id successResponse, NSString *message, NSInteger result) {
        if (result) {
            self.chargeListModel = [ChargeListModel mj_objectWithKeyValues:successResponse];
            [self.chargeListTableView reloadData];
        }else {
            [MBProgressHUD showMessage:message];
        }
    } failer:^(NSString *errorStr) {
        BSLog(@"失败%@",errorStr);
    }];
    
}

- (UITableView *)chargeListTableView {
    if (_chargeListTableView == nil) {
        _chargeListTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64-49) style:UITableViewStylePlain];
        _chargeListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _chargeListTableView.delegate = self;
        _chargeListTableView.dataSource = self;
        [_chargeListTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ChargerListCell class]) bundle:nil] forCellReuseIdentifier:chargeListCellID];
        
        _chargeListTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
        }];
    }
    return _chargeListTableView;
}
- (ChargeListModel *)chargeListModel {
    if (!_chargeListModel) {
        _chargeListModel = [[ChargeListModel alloc] init];
    }
    return _chargeListModel;
}
#pragma mark - tableViewDelegate and dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.chargeListModel.StationInfos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChargerListCell *listCell = [tableView dequeueReusableCellWithIdentifier:chargeListCellID];
    listCell.selectionStyle = UITableViewCellSelectionStyleNone;
    listCell.stationInfosModel = self.chargeListModel.StationInfos[indexPath.row];
    return listCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 100;
    }else{
        return 155;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
        return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

        return 0.0001;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ChargeDetailViewController *detailVC = [[ChargeDetailViewController alloc] init];
    detailVC.stationInfosModel = self.chargeListModel.StationInfos[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
