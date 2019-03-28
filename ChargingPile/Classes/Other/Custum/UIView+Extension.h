//
//  UIView+Extension.h
//  01-黑酷
//
//  Created by apple on 14-6-27.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

// changed by lisha on 16/12/31
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat bottom;

// changed by lisha on 2017-1-17
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;

@end
