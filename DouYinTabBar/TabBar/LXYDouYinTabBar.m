//
//  LXYDouYinTabBar.m
//  DouYinTabBar
//
//  Created by liang lee on 2020/7/27.
//  Copyright © 2020 li xiao yang. All rights reserved.
//

#import "LXYDouYinTabBar.h"

@implementation LXYDouYinTabBar

// layoutSubviews遍历子控件寻找UITabBarButton，给UITabBarButton重新设置frame
- (void)layoutSubviews {
    [super layoutSubviews];
    [self addSubview:self.indicatorLine];
    CGFloat width = 50;
    self.issueBtn.frame = CGRectMake((ScreenWidth-width)/2, 2, width, width);
    CGFloat tabBarButtonW = ScreenWidth / 5;
    CGFloat tabBarButtonIndex = 0;
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            // 重新设置frame
            CGRect frame = CGRectMake(tabBarButtonIndex * tabBarButtonW, 0, tabBarButtonW, 49);
            child.frame = frame;
            // 增加索引
            if (tabBarButtonIndex == 1) {
                tabBarButtonIndex++;
            }
            tabBarButtonIndex++;
        }
    }
}

- (void)issueBtnAction:(UIButton *)sender{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"issueBtnActionNotification" object:nil];
}


- (UIButton *)issueBtn {
    if (!_issueBtn) {
        _issueBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_issueBtn];
        [_issueBtn setImage:[UIImage imageNamed:@"tabbar_camera_image_normal"] forState:UIControlStateNormal];
        _issueBtn.adjustsImageWhenHighlighted = false;
        [_issueBtn addTarget:self action:@selector(issueBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _issueBtn;
}
- (UIView *)indicatorLine{
    if (!_indicatorLine) {
        _indicatorLine = [[UIView alloc]initWithFrame:CGRectMake(1/15.0f*[UIScreen mainScreen].bounds.size.width, iPhoneX?45:40, 1/15.0f*[UIScreen mainScreen].bounds.size.width, 2)];
        _indicatorLine.backgroundColor = UIColor.whiteColor;
        [self addSubview:_indicatorLine];
    }
    return _indicatorLine;
}

@end
