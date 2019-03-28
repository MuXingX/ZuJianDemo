//
//  RegistViewController.m
//  BusilinqMall
//
//  Created by MuXingXing on 2018/4/17.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import "RegistViewController.h"
#import <AFNetworking.h>


@interface RegistViewController ()
/** 发送验证码按钮 */
@property (weak, nonatomic) IBOutlet UIButton *getCodeBtn;
/** 手机号 */
@property (weak, nonatomic) IBOutlet UITextField *photoNumber;
/** 验证码 */
@property (weak, nonatomic) IBOutlet UITextField *verifiCode;
/** 密码 */
@property (weak, nonatomic) IBOutlet UITextField *passWord;
/** 确认密码 */
@property (weak, nonatomic) IBOutlet UITextField *passWord2;

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"用户注册";
    self.getCodeBtn.layer.cornerRadius = 12;
    self.getCodeBtn.layer.borderColor = [UIColor redColor].CGColor;
    self.getCodeBtn.layer.borderWidth = 1;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
/** 获取验证码 */
- (IBAction)getGodeAction:(id)sender {
    
    if (self.photoNumber.text.length != 11) {
        [MBProgressHUD showMessage:@"请输入11位手机号"];
        return;
    }
    
    [BSHttpTool postData:sms_code param:@{@"mobile":self.photoNumber.text} success:^(id successResponse, NSString *message, NSInteger result) {
        if (result) {
            [MBProgressHUD showMessage:@"验证码已发送"];
        }else {
            [MBProgressHUD showMessage:message];
        }
    } failer:^(NSString *errorStr) {
        BSLog(@"失败%@",errorStr);
    }];
    

}

/** 注册 */
- (IBAction)registAction:(id)sender {
    if (self.passWord.text.length < 6 || self.passWord.text.length > 20) {
        [MBProgressHUD showMessage:@"您输入的密码长度不正确"];
        return;
    }
//    if (self.passWord.text != self.passWord2.text) {
//        [MBProgressHUD showMessage:@"您两次输入的密码不一致"];
//        return;
//    }
    [BSHttpTool postData:app_register param:@{@"password":self.passWord.text,@"password":self.passWord2.text,@"mobile":self.photoNumber.text,@"code":self.verifiCode.text} success:^(id successResponse, NSString *message, NSInteger result) {
        if (result) {
            [MBProgressHUD showMessage:@"注册成功，赶紧登录吧"];
            [self.navigationController popViewControllerAnimated:YES];
        }else {
            
        }

    } failer:^(NSString *errorStr) {
        BSLog(@"失败%@",errorStr);
    }];
}


@end
