//
//  MyOrderTableViewCell.m
//  ChargingPile
//
//  Created by MuXingXing on 2019/1/31.
//  Copyright © 2019 muxingxing. All rights reserved.
//

#import "MyOrderTableViewCell.h"
#import "OrderCompleteModel.h"

@interface MyOrderTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *startTime;
@property (weak, nonatomic) IBOutlet UILabel *endTime;
@property (weak, nonatomic) IBOutlet UILabel *electricSum;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *status;

@end

@implementation MyOrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setListModel:(ListModel *)listModel {
    if (!listModel.chargeId) {
        self.startTime.text = [NSString stringWithFormat:@"开始时间:%@",listModel.starttime];
        self.endTime.text = [NSString stringWithFormat:@"结束时间:%@",listModel.endtime];
        self.electricSum.text = [NSString stringWithFormat:@"总电量:%@",listModel.totalpower];
        self.price.text = [NSString stringWithFormat:@"总价:%@",listModel.totalmoney];
        self.status.text = @"支付状态:未支付";
    }else {
        self.startTime.text = [NSString stringWithFormat:@"创建时间:%@",listModel.createTime];
        self.endTime.text = [NSString stringWithFormat:@"更新时间:%@",listModel.updateTime];
        self.electricSum.text = [NSString stringWithFormat:@"设备id:%@",listModel.equipmentid];
        self.price.text = [NSString stringWithFormat:@"充电id:%@",listModel.chargeId];
        self.status.text = @"充电状态:正在充电";
    }


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
