//
//  ProfileHeadView.h
//  BusilinqMall
//
//  Created by MuXingXing on 2018/3/8.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^HeadActionBlock)(void);
typedef void (^SettingAction)(void);
typedef void (^ProfileInfomationBlock)(void);

@interface ProfileHeadView : UIView


/** 头像点击 */
@property (nonatomic, copy) HeadActionBlock headActionBlock;
/** 设置点击 */
@property (nonatomic, copy) SettingAction settingAction;
/** 名字点击，个人资料 */
@property (nonatomic, copy) ProfileInfomationBlock profileInfomationBlock;

@property (nonatomic, strong)UserModel *usermodel;

+ (instancetype)headView;
@end
