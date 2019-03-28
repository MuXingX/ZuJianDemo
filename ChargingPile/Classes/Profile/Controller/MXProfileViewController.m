//
//  MXProfileViewController.m
//  ChargingPile
//
//  Created by MuXingXing on 2019/1/25.
//  Copyright © 2019 muxingxing. All rights reserved.
//

#import "MXProfileViewController.h"
#import "LoginViewController.h"
#import "ProfilItemTableViewCell.h"
#import "ProfileHeadView.h"
#import "MyOrderViewController.h"

@interface MXProfileViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *profileTableView;
@property (nonatomic, strong)ProfileHeadView *profileHeadView;

@end

@implementation MXProfileViewController

static NSString * const ProfilItemCellID = @"ProfilItemTableViewCell";
static NSString * const ProfileExitCellID = @"ProfileExitTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的";
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self setupTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}


#pragma mark - getters and setters

- (UITableView *)profileTableView {
    if (_profileTableView == nil) {
        _profileTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, ScreenWidth, ScreenHeight-30) style:UITableViewStylePlain];
        _profileTableView.delegate = self;
        _profileTableView.dataSource = self;
        _profileTableView.backgroundColor = MineBackColor;
        [_profileTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ProfilItemTableViewCell class]) bundle:nil] forCellReuseIdentifier:ProfilItemCellID];
        
        _profileTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
        }];
    }
    return _profileTableView;
}

- (ProfileHeadView *)profileHeadView {
    if (!_profileHeadView) {
        _profileHeadView = [ProfileHeadView headView];
    }
    return _profileHeadView;
}

#pragma mark - setupUI
- (void)setupTableView {
    self.view.backgroundColor = MineBackColor;
    [self.view addSubview:self.profileTableView];
    
    self.profileHeadView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight/3 - 20);
    self.profileTableView.tableHeaderView = self.profileHeadView;
    
    WEAKSELF
    //登录
    self.profileHeadView.headActionBlock = ^{
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        [weakSelf.navigationController pushViewController:loginVC animated:YES];
    };
//    //个人资料
//    self.profileHeadView.profileInfomationBlock = ^{
//        ProfileInfomationController *infomationVC = [[ProfileInfomationController alloc] init];
//        [weakSelf.navigationController pushViewController:infomationVC animated:YES];
//    };
//    //设置
//    self.profileHeadView.settingAction = ^{
//        SettingViewController *setVC = [[SettingViewController alloc] init];
//        [weakSelf.navigationController pushViewController:setVC animated:YES];
//    };
}

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;

}

#pragma mark - tableViewdataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSArray *profileOptionAry = @[@"订单中心",@"我的收藏",@"客户服务",@"会员中心"];
    NSArray *imageAry = @[@"mine_订单",@"mine_收藏",@"mine_客户",@"mine_会员"];
    UITableViewCell *defuleCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    defuleCell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    defuleCell.textLabel.text = profileOptionAry[indexPath.row];
    defuleCell.textLabel.font = [UIFont systemFontOfSize:14];
    defuleCell.textLabel.textColor = [UIColor lightGrayColor];
    defuleCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [defuleCell.imageView setImage:[UIImage imageNamed:imageAry[indexPath.row]]];
    return defuleCell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
    grayView.backgroundColor = MineBackColor;
    return grayView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
        switch (indexPath.row) {
            case 0://订单中心
            {
                MyOrderViewController *myOrderVC = [[MyOrderViewController alloc] init];
                [self.navigationController pushViewController:myOrderVC animated:YES];
            }
                break;
            case 1://我的收藏
            {
//                MyCollectionController *collecVC = [[MyCollectionController alloc] init];
//                [self.navigationController pushViewController:collecVC animated:YES];
            }
                break;
            case 2://客户服务
                
                break;
            case 3://会员中心
            {
//                MembershipCenterController *memberVC = [[MembershipCenterController alloc] init];
//                [self.navigationController pushViewController:memberVC animated:YES];
            }
                break;
            default:
                break;
        }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES];
}

@end
