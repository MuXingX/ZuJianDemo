//
//  LoginViewController.m
//  BusilinqMall
//
//  Created by MuXingXing on 2018/3/13.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import "LoginViewController.h"
#import "ForgetPasswordViewController.h"
#import "RegistViewController.h"

@interface LoginViewController ()
/** 手机号 */
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
/** 密码 */
@property (weak, nonatomic) IBOutlet UITextField *password;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
/** 返回 */
- (IBAction)cancelAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/** 登录 */
- (IBAction)loginAction:(id)sender {

    [BSHttpTool postData:app_login param:@{@"mobile":self.phoneNumber.text,@"password":self.password.text} success:^(id successResponse, NSString *message, NSInteger result) {
        if (result) {
            UserModel *userModel = [UserModel shareInstance];
            userModel = [UserModel mj_objectWithKeyValues:successResponse];
            userModel.loginNumber = self.phoneNumber.text;
            userModel.loginPassworld = self.password.text;
            
            [BSUserDefaults setObject:[userModel mj_JSONString] forKey:LOGIN_UserModel];
            
            [SVProgressHUD showSuccessWithStatus:@"登录成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }
    } failer:^(NSString *errorStr) {
        BSLog(@"失败%@",errorStr);
    }];

    
}

/** 忘记密码 */
- (IBAction)forgetPassword:(id)sender {
    ForgetPasswordViewController *getPaswordVc = [[ForgetPasswordViewController alloc] init];
    [self.navigationController pushViewController:getPaswordVc animated:YES];
}

/** 注册 */
- (IBAction)registAction:(id)sender {
    RegistViewController *registVc = [[RegistViewController alloc] init];
    [self.navigationController pushViewController:registVc animated:YES];
}
/** 清除输出 */
- (IBAction)cancelImportText:(id)sender {
    self.phoneNumber.text = @"";
}

/** 密码可视 */
- (IBAction)seePassword:(id)sender {
    self.password.secureTextEntry = !self.password.secureTextEntry;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
