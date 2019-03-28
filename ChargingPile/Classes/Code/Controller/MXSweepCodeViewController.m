//
//  MXSweepCodeViewController.m
//  ChargingPile
//
//  Created by MuXingXing on 2019/1/25.
//  Copyright © 2019 muxingxing. All rights reserved.
//

#import "MXSweepCodeViewController.h"
#import "WQCodeScanner.h"

@interface MXSweepCodeViewController ()

@end

@implementation MXSweepCodeViewController

- (void)viewDidLoad {
    self.title = @"电桩信息";
    [super viewDidLoad];
    [self setUpNav];
    
    [self setUpCodeNumLabel];

}

- (void)setUpCodeNumLabel {
    UILabel *codeLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 250, 70)];
    codeLabel.numberOfLines = 0;
    [codeLabel setTextColor:[UIColor blackColor]];
    codeLabel.text = [NSString stringWithFormat:@"电桩编码：%@",self.codeNum];
    [self.view addSubview:codeLabel];
    
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
        }else {
            
        }
    } failer:^(NSString *errorStr) {
        BSLog(@"失败%@",errorStr);
    }];
}

@end
