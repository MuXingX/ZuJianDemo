//
//  ChargeDetailTableViewCell.m
//  ChargingPile
//
//  Created by MuXingXing on 2019/1/31.
//  Copyright © 2019 muxingxing. All rights reserved.
//

#import "ChargeDetailTableViewCell.h"
#import "ChargeListModel.h"

@interface ChargeDetailTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *chargeImage;
@property (weak, nonatomic) IBOutlet UILabel *deviceID;
@property (weak, nonatomic) IBOutlet UILabel *deviceName;
@property (weak, nonatomic) IBOutlet UILabel *state;

@end


@implementation ChargeDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setConnectorInfosModel:(ConnectorInfosModel *)connectorInfosModel {
    self.deviceID.text = connectorInfosModel.ConnectorID;
    self.deviceName.text = connectorInfosModel.ConnectorName;
    switch (connectorInfosModel.Status.intValue) {
        case 0:
            self.state.text = @"离网";
            break;
        case 1:
            self.state.text = @"空闲";
            break;
        case 2:
            self.state.text = @"占用(未充电)";
            break;
        case 3:
            self.state.text = @"占用(充电中)";
            break;
        case 4:
            self.state.text = @"占用(预约锁定)";
            break;
        case 255:
            self.state.text = @"故障";
            break;
        default:
            break;
    }
}

//- (void)setConnectorStatusInfosModel:(ConnectorStatusInfosModel *)connectorStatusInfosModel {
//    switch (connectorStatusInfosModel.Status.intValue) {
//        case 0:
//            self.state.text = @"离网";
//            break;
//        case 1:
//            self.state.text = @"空闲";
//            break;
//        case 2:
//            self.state.text = @"占用(未充电)";
//            break;
//        case 3:
//            self.state.text = @"占用(充电中)";
//            break;
//        case 4:
//            self.state.text = @"占用(预约锁定)";
//            break;
//        case 255:
//            self.state.text = @"故障";
//            break;
//        default:
//            break;
//    }
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
