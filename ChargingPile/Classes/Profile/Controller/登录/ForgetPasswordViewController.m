//
//  ForgetPasswordViewController.m
//  BusilinqMall
//
//  Created by MuXingXing on 2018/3/13.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "UIButton+Extend.h"

@interface ForgetPasswordViewController ()
@property (weak, nonatomic) IBOutlet UIButton *getVerifiCodeBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *verifiCode;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"忘记密码";
    self.getVerifiCodeBtn.layer.cornerRadius = 12;
    self.getVerifiCodeBtn.layer.borderColor = [UIColor redColor].CGColor;
    self.getVerifiCodeBtn.layer.borderWidth = 1;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)getCodeAtion:(id)sender {
    if (self.phoneNumber.text.length != 11) {
        [MBProgressHUD showMessage:@"请输入11位手机号"];
        return;
    }
    
    [self.getVerifiCodeBtn sixtySecondsCountdown:self.getVerifiCodeBtn titelColor:[UIColor whiteColor]];
//    [BSHttpTool postData:regist_sendVerifySMS param:@{@"mob":self.phoneNumber.text} success:^(id successResponse, NSString *message, NSInteger result) {
//        if (result) {
//            [MBProgressHUD showMessage:@"验证码已发送"];
//        }else {
//            [MBProgressHUD showMessage:message];
//        }
//    } failer:^(NSString *errorStr) {
//        BSLog(@"失败%@",errorStr);
//    }];
}

- (IBAction)resetPasswordAction:(id)sender {
    if (self.verifiCode.text.length < 4) {
        [MBProgressHUD showMessage:@"请输入验证码"];
        return;
    }
    if (self.password.text.length < 6 || self.password.text.length >20) {
        [MBProgressHUD showMessage:@"您输入的密码长度不正确"];
        return;
    }
//    [BSHttpTool postData:doforgetpassword param:@{@"mob":self.phoneNumber.text} success:^(id successResponse, NSString *message, NSInteger result) {
//        if (result) {
//            [MBProgressHUD showMessage:@"密码已重置，赶紧登录吧"];
//            [self.navigationController popViewControllerAnimated:YES];
//        }else {
//            [MBProgressHUD showMessage:message];
//        }
//    } failer:^(NSString *errorStr) {
//        BSLog(@"失败%@",errorStr);
//    }];
}


@end
