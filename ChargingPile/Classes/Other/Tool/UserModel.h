//
//  UserModel.h
//  BusilinqMall
//
//  Created by MuXingXing on 2018/5/8.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
/** 生日 */
//@property (nonatomic, copy) NSString *birthday;
///** email */
//@property (nonatomic, copy) NSString *email;
///** 性别0、保密；1、男；2、女 , */
//@property (nonatomic, copy) NSString *gender;
///** 会员等级 */
//@property (nonatomic, copy) NSString *grade;
///** 会员经验值  */
//@property (nonatomic, copy) NSString *gradeValue;
///** 头像 */
//@property (nonatomic, copy) NSString *header;
///** ID */
//@property (nonatomic, copy) NSString *userID;
///** 会员积分 */
//@property (nonatomic, copy) NSString *integral;
///** 手机 */
//@property (nonatomic, copy) NSString *mobile;
///** 用户名 */
//@property (nonatomic, copy) NSString *name;
///** 电话 */
//@property (nonatomic, copy) NSString *phone;
///** qq */
//@property (nonatomic, copy) NSString *qq;
/** token */
@property (nonatomic, copy) NSString *token;
/** 过期时间 */
@property (nonatomic, copy) NSString *expire;


/** 登录电话 */
@property (nonatomic, copy) NSString *loginNumber;
/** 登录密码 */
@property (nonatomic, copy) NSString *loginPassworld;

+ (instancetype)shareInstance;

@end


@interface UserModelInfo : NSObject

+ (UserModel *)getUserModel;

@end
