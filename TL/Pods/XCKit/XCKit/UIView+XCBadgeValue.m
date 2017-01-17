//
//  UIView+XCBadgeValue.m
//  MVVM-ViewModel-NetWork-Model
//
//  Created by 刘小椿 on 16/11/17.
//  Copyright © 2016年 刘小椿. All rights reserved.
//

#import "UIView+XCBadgeValue.h"
#import <objc/runtime.h>

static char xc_badgeValue_static;

@implementation UIView (XCBadgeValue)

- (void)setXc_badgeValue:(NSString *)xc_badgeValue
{
    [self xc_clearBadgeValue];
    objc_setAssociatedObject(self, &xc_badgeValue_static, xc_badgeValue, OBJC_ASSOCIATION_COPY);
    if (xc_badgeValue == nil) {
        [self xc_clearBadgeValue];
    }else{
        CGRect rect = [xc_badgeValue  boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:[UIFont smallSystemFontSize]]} context:nil];
        // 红点
        CGFloat badgeHeight = 0;
        UIButton * redBtn = [[UIButton alloc]init];
        if ([self xc_isAllNumber:xc_badgeValue]) {
            badgeHeight = 12;
            [redBtn setTitle:xc_badgeValue forState:UIControlStateNormal];
            redBtn.frame = CGRectMake(0, 0, rect.size.width > badgeHeight ? rect.size.width + 6 : badgeHeight, badgeHeight);
            redBtn.center = CGPointMake(self.frame.size.width / 2 + 30, badgeHeight / 2);
        }else{
            badgeHeight = 8;
            redBtn.frame = CGRectMake(0, 0, badgeHeight, badgeHeight);
            redBtn.center = CGPointMake(self.frame.size.width / 2 + 20, badgeHeight / 2);
        }
        redBtn.tag = 10086;
        redBtn.layer.cornerRadius = badgeHeight / 2;
        redBtn.layer.masksToBounds = YES;
        redBtn.titleLabel.font = [UIFont systemFontOfSize:[UIFont smallSystemFontSize]];
        redBtn.backgroundColor = [UIColor redColor];
        [self addSubview:redBtn];
    }
}

- (NSString *)xc_badgeValue
{
    NSString *badgeValue = objc_getAssociatedObject(self, &xc_badgeValue_static);
    if (badgeValue.integerValue <= 0) {
        return @"";
    }
    else{
        return badgeValue;
    }
}

#pragma mark --Private Method
- (void)xc_clearBadgeValue{
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]] && view.tag == 10086) {
            [view removeFromSuperview];
        }
    }
}

- (BOOL)xc_isAllNumber:(NSString *)text{
    unichar str;
    if (0 == text.length || text.integerValue <= 0) {
        return NO;
    }
    for (NSInteger index = 0; index < text.length; index ++) {
        str = [text characterAtIndex:index];
        if (isdigit(str)) {
            return YES;
        }
    }
    return NO;
}

@end
