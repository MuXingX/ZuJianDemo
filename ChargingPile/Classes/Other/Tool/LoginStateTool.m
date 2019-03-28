//
//  LoginStateTool.m
//  BusilinqMall
//
//  Created by MuXingXing on 2018/5/8.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import "LoginStateTool.h"

@implementation LoginStateTool

+ (BOOL)isSaveLoginInfo {
    NSString *usermodel = [BSUserDefaults objectForKey:LOGIN_UserModel];
    if (usermodel.length > 0) {
        
        return YES;
    }else {
        BSLog(@"未登录过");
        return NO;
    }
}

+ (void)loginUser {
    
//    UserModel *usermodel = [UserModelInfo getUserModel];
//
//    [BSHttpTool postData:dologin param:@{@"userName":usermodel.loginNumber,@"password":usermodel.loginPassworld} success:^(id successResponse, NSString *message, NSInteger result) {
//        if (result) {
//            UserModel *userModel = [UserModel shareInstance];
//            userModel = [UserModel mj_objectWithKeyValues:successResponse];
//
//            [BSUserDefaults setObject:[userModel mj_JSONString] forKey:LOGIN_UserModel];
//            BSLog(@"登录成功");
//        }
//    } failer:^(NSString *errorStr) {
//        BSLog(@"失败%@",errorStr);
//    }];
}



@end
