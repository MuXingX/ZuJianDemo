//
//  ConstHeader.h
//  BusilinqMall
//
//  Created by MuXingXing on 2018/5/8.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#ifndef ConstHeader_h
#define ConstHeader_h

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define ColorRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ColorRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define MineBackColor  [UIColor colorWithHexString:@"f2f2f2"]
#define GlobalColor ColorRGB(16, 74, 215)
#define GlobalTitleColor  [UIColor colorWithHexString:@"333333"]

#define kDefultImage [UIImage imageNamed:@"defultBackImg"]

#define LOGIN_UserModel @"LOGIN_UserModel"

#define PAGESIZE 20
#define MXPage 1

#define BSUserDefaults [NSUserDefaults standardUserDefaults]

#define WEAKSELF  typeof(self) __weak weakSelf = self;

#define kLoginPhoneNumber @"loginPhoneNumber"
#define kLoginPassworld @"loginPassworld"

#define Key_UserArea @"userArea"       // 用户位置

#endif /* ConstHeader_h */
