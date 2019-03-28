//
//  MXHomeViewController.m
//  ChargingPile
//
//  Created by MuXingXing on 2019/1/25.
//  Copyright © 2019 muxingxing. All rights reserved.
//

#import "MXHomeViewController.h"
#import "DCPicScrollView.h"
#import "HomeItemTableViewCell.h"
#import "HomeRecommendTableViewCell.h"
#import "ChargerListViewController.h"

@interface MXHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *homeTableView;
@property (nonatomic, strong)DCPicScrollView  *picView;

@end

@implementation MXHomeViewController

static NSString * const HomeItemCellID = @"HomeItemTableViewCell";
static NSString * const HomeRecommendCellID = @"HomeRecommendTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:self.homeTableView];
    [self setupCarouselsData];

}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (UITableView *)homeTableView {
    if (_homeTableView == nil) {
        _homeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, ScreenWidth, ScreenHeight-30) style:UITableViewStylePlain];
        _homeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _homeTableView.delegate = self;
        _homeTableView.dataSource = self;
        _homeTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight / 3 - 20)];
        [_homeTableView registerNib:[UINib nibWithNibName:NSStringFromClass([HomeItemTableViewCell class]) bundle:nil] forCellReuseIdentifier:HomeItemCellID];
        [_homeTableView registerNib:[UINib nibWithNibName:NSStringFromClass([HomeRecommendTableViewCell class]) bundle:nil] forCellReuseIdentifier:HomeRecommendCellID];
        
        _homeTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
        }];
    }
    return _homeTableView;
}

/* 设置轮播图 */
- (void)setupCarouselsData {
    
//    NSMutableArray *urlStringArray = [NSMutableArray array];

//    for (int i = 0; i < self.carouselsData.count; i++) {
//        CarouselsModel *model = self.carouselsData[i];
//        NSString *urlStr = [MainImageUrl stringByAppendingString:model.image];
//        [urlStringArray addObject:urlStr];
//    }
    NSArray *UrlStringArray = @[@"http://p1.qqyou.com/pic/UploadPic/2013-3/19/2013031923222781617.jpg",
                                @"http://cdn.duitang.com/uploads/item/201409/27/20140927192649_NxVKT.thumb.700_0.png",
                                @"http://img4.duitang.com/uploads/item/201409/27/20140927192458_GcRxV.jpeg",
                                @"http://cdn.duitang.com/uploads/item/201304/20/20130420192413_TeRRP.thumb.700_0.jpeg"];
    
   
    //设置图片url数组,和滚动视图位置
    DCPicScrollView  *picView = [DCPicScrollView picScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight / 3 - 20) WithImageUrls:UrlStringArray];
    self.picView = picView;
    //显示顺序和数组顺序一致
    //设置标题显示文本数组
    //    picView.titleData = titleArray;
    
    //占位图片,你可以在下载图片失败处修改占位图片
    
    picView.placeImage = [UIImage imageNamed:@"place.png"];
    
    //图片被点击事件,当前第几张图片被点击了,和数组顺序一致
    
    [picView setImageViewDidTapAtIndex:^(NSInteger index) {
        printf("第%zd张图片\n",index);
    }];
    
    //default is 2.0f,如果小于0.5不自动播放
    picView.AutoScrollDelay = 2.0f;
    //    picView.textColor = [UIColor redColor];
    
    self.homeTableView.tableHeaderView = picView;
    
}

#pragma mark - tableViewDelegate and dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return 10;
    }else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HomeItemTableViewCell *itemCell = [tableView dequeueReusableCellWithIdentifier:HomeItemCellID];
        itemCell.selectionStyle = UITableViewCellSelectionStyleNone;
        itemCell.itemButtonClickBlock = ^(NSInteger btnTag) {
            switch (btnTag-200) {
                case 0://电桩列表
                {
                    ChargerListViewController *listVC = [[ChargerListViewController alloc] init];
                    [self.navigationController pushViewController:listVC animated:YES];
                }
                    break;
                case 1://会员中心
                {
                    
                }
                    break;
                case 2://优惠集市
                {
                    
                }
                    break;
                case 3://积分商城
                {
                    
                }
                    break;
                default:
                    break;
            }
        };
        return itemCell;
        
    }else {
        HomeRecommendTableViewCell *recommendCell = [tableView dequeueReusableCellWithIdentifier:HomeRecommendCellID];
        recommendCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return recommendCell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 100;
    }else{
        return 155;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return 10;
    }else {
        return 0.0001;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 10;
    }else {
        return 0.0001;
    }
}


@end
