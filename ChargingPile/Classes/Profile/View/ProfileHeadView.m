//
//  ProfileHeadView.m
//  BusilinqMall
//
//  Created by MuXingXing on 2018/3/8.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import "ProfileHeadView.h"
#import <UIButton+WebCache.h>

@interface ProfileHeadView()
@property (weak, nonatomic) IBOutlet UILabel *userNumber;
@property (weak, nonatomic) IBOutlet UIButton *userHeadImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;

@end

@implementation ProfileHeadView

+ (instancetype)headView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];

}

- (void)setUsermodel:(UserModel *)usermodel {
//    if (usermodel) {
//        self.userName.text = usermodel.name;
//    }else {
//        self.userName.text = @"登录/注册";
//    }
//    self.userNumber.text = usermodel.phone;
//    [self.userHeadImage sd_setImageWithURL:[NSURL URLWithString:usermodel.header] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"mine_我的头像"]];
}

- (IBAction)headClickAction:(id)sender {
    if (0) {//判断是否登录
        if (self.profileInfomationBlock) {
            self.profileInfomationBlock();
        }
    }else {
        if (self.headActionBlock) {
            self.headActionBlock();
        }
    }

}

- (IBAction)settingClickAction:(id)sender {
    if (self.settingAction) {
        self.settingAction();
    }
}

@end
