//
//  TPScreen.h
//  TPVeeU
//
//  Created by lingmeixie on 2018/6/4.
//  Copyright © 2018年 touchpal. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TP1PixHeight 0.5
#define kAPPWidth (MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height))
#define kAPPHeight (MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height))
#define kAPPWidthScane ([UIScreen mainScreen].bounds.size.width / 375.0)

#define KiPhoneX ((kAPPWidth == 375.f && kAPPHeight == 812.f) || (kAPPWidth == 812.f && kAPPHeight == 375.f))
#define KiPhoneXR ((kAPPWidth == 414.f && kAPPHeight == 896.f) || (kAPPWidth == 896.f && kAPPHeight == 414.f))
#define KiPhoneXAll (KiPhoneX || KiPhoneXR)

#define IS_IPHONE_5 (kAPPHeight == 568)
#define IS_IPHONE_6 (kAPPWidth == 375)
#define IS_IPHONE_6PLUS (kAPPWidth == 414)

#define IS_PAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define TPIPhoneXTopMargin ((KiPhoneX || KiPhoneXR) ? 24 : 0)
#define TPIPhoneXBottomMargin ((KiPhoneX || KiPhoneXR) ? 34 : 0)
#define TPIPhoneXBottom ((KiPhoneX || KiPhoneXR) ? 83 : 49)
#define TPIphoneXTop ((KiPhoneX || KiPhoneXR) ? 88.0 : 64.0)
#define TPIphoneXTopStatus ((KiPhoneX || KiPhoneXR) ? 44.0 : 20.0)
#define TPSepLineHeight (1/[UIScreen mainScreen].scale)

static const CGFloat TPCommonHeaderbarContentHeight = 44.0;
static const CGFloat TPCommonHeaderbarLargeTitleHeight = 52.0;

CGFloat TPScreenHeight(void);
CGFloat TPScreenWidth(void);
CGFloat TPStatusBarHeight(void);
