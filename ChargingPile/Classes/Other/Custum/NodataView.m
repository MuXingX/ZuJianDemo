//
//  NodataView.m
//  BusilinqMall
//
//  Created by MuXingXing on 2018/5/12.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import "NodataView.h"

@interface NodataView ()
@property (weak, nonatomic) IBOutlet UILabel *reminderLabel;


@end

@implementation NodataView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"NodataView" owner:self options:nil] lastObject];
    }
    return self;
}

- (void)setRemarkStr:(NSString *)remarkStr
{
    _reminderLabel.text = remarkStr;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self.nextResponder touchesBegan:touches withEvent:event];
}

/**
 * 设置点穿视图
 */
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    return nil;
}

@end
