//
//  GuidanceViewController.m
//  BusilinqMall
//
//  Created by MuXingXing on 2018/4/25.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import "GuidanceViewController.h"
#import "TabBarController.h"

@interface GuidanceViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scr;
//滚动的图片数
@property (nonatomic, assign) int i;

@end

@implementation GuidanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _i = 3;
    //
    self.scr = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.scr];
    //   －－－整页偏移－－－默认为 no
    self.scr.pagingEnabled = YES;
    //    关闭回弹效果
    self.scr.bounces = NO;
    //  隐藏水平滚动条
    self.scr.showsHorizontalScrollIndicator = NO;
    self.scr.delegate = self;
    self.scr.backgroundColor = [UIColor whiteColor];
    self.scr.contentSize = CGSizeMake(ScreenWidth * _i, 0);
    self.scr.contentOffset = CGPointMake(0, 0);
    
    
    for (int i = 1; i <= _i; i++) {
        
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth * (i - 1), 0, ScreenWidth, ScreenHeight)];
        image.image = [UIImage imageNamed:[NSString stringWithFormat:@"guidance_%d", i]];
        image.contentMode = UIViewContentModeScaleToFill;
        
        [_scr addSubview:image];
        
        
        if (i == _i) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            [button addTarget:self action:@selector(gotoMainVC) forControlEvents:UIControlEventTouchUpInside];
            
            button.frame = CGRectMake(ScreenWidth / 8 * 3 + ScreenWidth * (i-1), ScreenHeight - 180, ScreenWidth / 4 + 10, 30);
            
            button.backgroundColor = [UIColor redColor];
            
            [button.layer setMasksToBounds:YES];//设置按钮的圆角半径不会被遮挡
            
            [button.layer setCornerRadius:15];
            
            
            button.titleLabel.font = [UIFont systemFontOfSize:16];
            
            [button setTitle:@"立即体验" forState:UIControlStateNormal];
            
            [button setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
            
            [self.scr addSubview:button];
        }
    }
}


- (void)gotoMainVC {
    
    [self presentViewController:[[TabBarController alloc] init] animated:YES completion:nil];
}




@end
