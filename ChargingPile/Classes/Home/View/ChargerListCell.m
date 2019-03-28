//
//  ChargerListCell.m
//  ChargingPile
//
//  Created by MuXingXing on 2019/1/30.
//  Copyright © 2019 muxingxing. All rights reserved.
//

#import "ChargerListCell.h"
#import "ChargeListModel.h"

@interface ChargerListCell ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *phoneNum;

@end

@implementation ChargerListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setStationInfosModel:(StationInfosModel *)stationInfosModel {
    _stationInfosModel = stationInfosModel;
    self.name.text = stationInfosModel.StationName;
    self.address.text = stationInfosModel.Address;
    self.phoneNum.text = stationInfosModel.ServiceTel;
}

@end
