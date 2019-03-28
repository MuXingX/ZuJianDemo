//
//  MyOrderViewController.m
//  BusilinqMall
//
//  Created by MuXingXing on 2018/3/14.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import "MyOrderViewController.h"
#import "MyOrderTableViewCell.h"
#import "MXXTitleButton.h"
#import "OrderCompleteModel.h"
#import "ChargerBeginController.h"
#import "ChargingDetailController.h"

@interface MyOrderViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *myOrderTableView;
@property (nonatomic, strong)UIView *titleView;
/** 下划线 */
@property (nonatomic, weak) UIView *titleUnderline;
/** 上一次点击的标题按钮 */
@property (nonatomic, weak) MXXTitleButton *previousClickedTitleButton;
/** 订单数据 */
@property (nonatomic, strong)NSMutableArray *orderListArray;
/** 数据模型 */
@property (nonatomic, strong)OrderCompleteModel *orderCompleteModel;
/** 记录点击状态 */
@property (nonatomic, assign)NSInteger index;
@end

@implementation MyOrderViewController

static NSString * const MyOrderCellID = @"MyOrderTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的订单";
    self.view.backgroundColor = MineBackColor;

    // 标题栏
    [self.view addSubview:self.myOrderTableView];
    [self setupTitlesView];
    
    self.index = 0;
    [self httpGetOrderList:@""];
}

/** 获取我的订单列表 */
- (void)httpGetOrderList:(NSString *)orderState {
    
    [BSHttpTool postData:shevcs_query_order_info param:@{@"PageNo":@"1",@"PageSize":@"10"} success:^(id successResponse, NSString *message, NSInteger result) {
        if (result) {
            self.orderCompleteModel = [OrderCompleteModel mj_objectWithKeyValues:successResponse];
            [self.myOrderTableView reloadData];
        }else {
            [SVProgressHUD showErrorWithStatus:message];
        }
        [self.myOrderTableView reloadData];
    } failer:^(NSString *errorStr) {
        BSLog(@"失败%@",errorStr);
        [SVProgressHUD dismiss];
    }];
}

/** 获取充电中列表 */
- (void)httpGetChargingList:(NSString *)orderState {
    
    [BSHttpTool postData:shevcs_query_start_charge_list param:@{@"PageNo":@"1",@"PageSize":@"10"} success:^(id successResponse, NSString *message, NSInteger result) {
        if (result) {
            self.orderCompleteModel = [OrderCompleteModel mj_objectWithKeyValues:successResponse];
            [self.myOrderTableView reloadData];
        }else {
            [SVProgressHUD showErrorWithStatus:message];
        }
        [self.myOrderTableView reloadData];
    } failer:^(NSString *errorStr) {
        BSLog(@"失败%@",errorStr);
        [SVProgressHUD dismiss];
    }];
}
- (NSMutableArray *)orderListArray {
    if (!_orderListArray) {
        _orderListArray = [NSMutableArray array];
    }
    return _orderListArray;
}

- (OrderCompleteModel *)orderCompleteModel {
    if (!_orderCompleteModel) {
        _orderCompleteModel = [[OrderCompleteModel alloc] init];
    }
    return _orderCompleteModel;
}

#pragma mark -- UITableView Method

- (UITableView *)myOrderTableView {
    if (!_myOrderTableView) {
        _myOrderTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 35, ScreenWidth, ScreenHeight - 99) style:UITableViewStylePlain];
        _myOrderTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _myOrderTableView.delegate = self;
        _myOrderTableView.dataSource = self;
        _myOrderTableView.tableFooterView = [UIView new];
        _myOrderTableView.backgroundColor = MineBackColor;
        [_myOrderTableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyOrderTableViewCell class]) bundle:nil] forCellReuseIdentifier:MyOrderCellID];
    }
    return _myOrderTableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.orderCompleteModel.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyOrderCellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.listModel = self.orderCompleteModel.list[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (!self.index) {
        ChargerBeginController *chargeVC = [[ChargerBeginController alloc] init];
//        NSDictionary *orderDic = @{@"OperatorID":self.orderCompleteModel.list[indexPath.row].operatorid,
//                                   @"ConnectorID":self.orderCompleteModel.list[indexPath.row].connectorid,
//                                   @"equipmentID":self.orderCompleteModel.list[indexPath.row].equipmentid,
//                                   @"equipmentType":self.orderCompleteModel.list[indexPath.row].equipmenttype
//                                   };
//        chargeVC.orderDic = orderDic;
        chargeVC.startchargeseq = self.orderCompleteModel.list[indexPath.row].startchargeseq;
        [self.navigationController pushViewController:chargeVC animated:YES];
    }else {
        ChargingDetailController *chargingVC = [[ChargingDetailController alloc] init];
        chargingVC.index = indexPath.row;
        [self.navigationController pushViewController:chargingVC animated:YES];
    }

}



#pragma mark -- 自定义方法
/**
 *  标题栏
 */
- (void)setupTitlesView
{
    UIView *titlesView = [[UIView alloc] init];
    // 设置半透明背景色
    titlesView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    
    titlesView.frame = CGRectMake(0, 0, self.view.width, 35);
    [self.view addSubview:titlesView];
    self.titleView = titlesView;
    
    [self setupTitleButton];
    
    [self setupTitleUnderline];
    
}


/** 标题 */
- (void)setupTitleButton
{
    NSArray *titleArray = @[@"已完成",@"充电中"];
    CGFloat titleButtonW = self.titleView.width / titleArray.count;
    CGFloat titleButtonH = self.titleView.height;
    
    for (int i = 0; i < titleArray.count; i++) {
        MXXTitleButton *titleBtn = [[MXXTitleButton alloc] init];
        titleBtn.frame = CGRectMake(titleButtonW * i, 0, titleButtonW, titleButtonH);
        titleBtn.tag = i;
        [titleBtn setTitle:titleArray[i] forState:UIControlStateNormal];
        [titleBtn addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.titleView addSubview:titleBtn];
    }
}
/** 下划线 */
- (void)setupTitleUnderline
{
    MXXTitleButton *titleBtn = self.titleView.subviews.firstObject;
    UIView *titleUnderline = [[UIView alloc] init];
    titleUnderline.height = 2;
    titleUnderline.y = self.titleView.height - 2;
    titleUnderline.backgroundColor = [titleBtn titleColorForState:UIControlStateSelected];
    [self.titleView addSubview:titleUnderline];
    self.titleUnderline = titleUnderline;
    
    titleBtn.selected = YES;
    self.previousClickedTitleButton = titleBtn;
    [titleBtn.titleLabel sizeToFit];
//    self.titleUnderline.width = titleBtn.titleLabel.width + 10;
    self.titleUnderline.width = ScreenWidth/2-10;
    self.titleUnderline.centerX = titleBtn.centerX;
    
    
}

- (void)titleButtonClick:(MXXTitleButton *)button
{
    self.previousClickedTitleButton.selected = NO;
    button.selected = YES;
    self.previousClickedTitleButton = button;
    NSInteger index = button.tag;
    [UIView animateWithDuration:0.2 animations:^{
        self.titleUnderline.width = ScreenWidth/2-10;
        self.titleUnderline.centerX = button.centerX;
    } completion:^(BOOL finished) {
    }];
    
    NSString *orderState = @"";
    switch (index) {
        case 0:
            self.index = 0;
            orderState = @"";
            [self httpGetOrderList:orderState];
            break;
        case 1:
            self.index = 1;
            orderState = @"1";
            [self httpGetChargingList:orderState];
            break;
            
        default:
            break;
    }
}


@end
