//
//  LXYDouYinTabBar.h
//  DouYinTabBar
//
//  Created by liang lee on 2020/7/27.
//  Copyright © 2020 li xiao yang. All rights reserved.
//
#define ScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight  ([UIScreen mainScreen].bounds.size.height)
#define rgba(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define randomColor [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0f]
#define iPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXYDouYinTabBar : UITabBar

@property (nonatomic, strong)UIView *indicatorLine;
@property (nonatomic, strong)UIButton *issueBtn;

@end

NS_ASSUME_NONNULL_END
