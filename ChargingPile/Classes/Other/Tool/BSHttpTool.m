//
//  BSHttpTool.m
//  BusilinqMall
//
//  Created by MuXingXing on 2018/4/17.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import "BSHttpTool.h"
#import <AFNetworking.h>

@implementation BSHttpTool



+ (void)postData:(NSString *)url
           param:(NSDictionary *)param
         success:(RequestSuccessBlock)success
          failer:(RequestFailBlock)failure {
    
    NSString *urlStr = [ONLINEURL stringByAppendingString:url];
    BSLog(@"请求的地址是%@,参数是%@",urlStr,param);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
    manager.requestSerializer.timeoutInterval = 15.0f;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    /* 给请求头添加token*/
    NSString *modelString = [BSUserDefaults objectForKey:LOGIN_UserModel];
    UserModel *userModel = [UserModel mj_objectWithKeyValues:[modelString mj_JSONObject]];

    if (userModel.token.length > 0) {
        [manager.requestSerializer setValue:userModel.token forHTTPHeaderField:@"token"];
    }
    [SVProgressHUD show];
    [manager POST:urlStr parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        BSLog(@"地址%@请求成功的结果%@",url,responseObject);
        id response = [responseObject objectForKey:@"data"];
        NSString *message = [responseObject objectForKey:@"msg"];
        NSInteger result = [[responseObject objectForKey:@"code"] integerValue];
        
        if (success) {
            success(response,message,!result);
        }
        
        if (!result) {
            [SVProgressHUD dismiss];
        }else {
            [SVProgressHUD showErrorWithStatus:message];
//            NSInteger noLogin = [[responseObject objectForKey:@"data"] integerValue];
//            if (noLogin == 10004) {//未登录
//                UserInfoModel *userModel = [UserInfoModel shareInstance];
//                userModel = nil;
//                [BSUserDefaults setObject:userModel forKey:LOGIN_UserModel];
//                UIViewController *vc = [self getCurrentVC];
//                [vc presentViewController:[[MXLoginViewController alloc] init] animated:YES completion:nil];
//            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        NSData *errorData = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
        if (errorData.length) {
            NSDictionary *serializedData = [NSJSONSerialization JSONObjectWithData: errorData options:kNilOptions error:nil];
            NSString *errorStr = [serializedData objectForKey:@"msg"];
            BSLog(@"请求失败url-%@:%@", url,errorStr);
            failure(errorStr);
            
            NSString *errorCodeString = [[error.localizedDescription componentsSeparatedByString:@"("].lastObject stringByReplacingOccurrencesOfString:@")" withString:@""];
            
            if (![errorCodeString isEqual:@"401"] && serializedData.allKeys.count) {
                
            }else {
                
            }
        } else {
            BSLog(@"服务器错误:%@", error);
            failure(error.debugDescription);
        }
        
        BSLog(@"请求失败的结果%@",error);
        if (failure) {
            failure(error.debugDescription);
        }
    }];
}

+ (void)getData:(NSString *)url param:(NSDictionary *)param success:(RequestSuccessBlock)success failer:(RequestFailBlock)failure {
    NSString *urlStr = [ONLINEURL stringByAppendingString:url];
    BSLog(@"请求的地址是%@,参数是%@",urlStr,param);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
    manager.requestSerializer.timeoutInterval = 15.0f;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];

    /* 给请求头添加token*/
    NSString *modelString = [BSUserDefaults objectForKey:LOGIN_UserModel];
    UserModel *userModel = [UserModel mj_objectWithKeyValues:[modelString mj_JSONObject]];
    
    if (userModel.token.length > 0) {
        [manager.requestSerializer setValue:userModel.token forHTTPHeaderField:@"token"];
    }
    [SVProgressHUD show];
    
    [manager GET:urlStr parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        BSLog(@"地址%@请求成功的结果%@",url,responseObject);
        id response = [responseObject objectForKey:@"data"];
        NSString *message = [responseObject objectForKey:@"msg"];
        NSInteger result = [[responseObject objectForKey:@"code"] integerValue];
        
        if (success) {
            success(response,message,!result);
        }
        if (result) {
            [SVProgressHUD dismiss];
        }else {
            [SVProgressHUD dismiss];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        NSData *errorData = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
        if (errorData.length) {
            NSDictionary *serializedData = [NSJSONSerialization JSONObjectWithData: errorData options:kNilOptions error:nil];
            NSString *errorStr = [serializedData objectForKey:@"msg"];
            BSLog(@"请求失败url-%@:%@", url,errorStr);
            failure(errorStr);
            [SVProgressHUD showErrorWithStatus:errorStr];
            NSString *errorCodeString = [[error.localizedDescription componentsSeparatedByString:@"("].lastObject stringByReplacingOccurrencesOfString:@")" withString:@""];
            
            if (![errorCodeString isEqual:@"401"] && serializedData.allKeys.count) {
                
            }else {
                
            }
        } else {
            BSLog(@"服务器错误:%@", error);
            failure(error.debugDescription);
            [SVProgressHUD showErrorWithStatus:error.debugDescription];
        }
        
        BSLog(@"请求失败的结果%@",error);
        if (failure) {
            failure(error.debugDescription);
            [SVProgressHUD showErrorWithStatus:error.debugDescription];
        }
        
    }];
}


@end
