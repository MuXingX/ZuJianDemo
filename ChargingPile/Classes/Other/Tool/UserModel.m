//
//  UserModel.m
//  BusilinqMall
//
//  Created by MuXingXing on 2018/5/8.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
static UserModel *_instance;

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"userID":@"id"};
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;
}


+ (instancetype)shareInstance
{
    return [[self alloc]init];
}


@end



@implementation UserModelInfo

+ (UserModel *)getUserModel {
    NSString *modelString = [BSUserDefaults objectForKey:LOGIN_UserModel];
    UserModel *usermodel = [UserModel mj_objectWithKeyValues:[modelString mj_JSONObject]];
    return usermodel;
}


@end

