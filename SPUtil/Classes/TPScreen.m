//
//  TPScreen.m
//  TPVeeU
//
//  Created by lingmeixie on 2018/6/4.
//  Copyright © 2018年 touchpal. All rights reserved.
//

#import "TPScreen.h"

CGFloat TPStatusBarHeight(void)
{
    // 状态栏未渲染 frame为0
//    CGRect rect = [[UIApplication sharedApplication] statusBarFrame];
    return TPIphoneXTopStatus;
}

CGFloat TPHeaderBarHeight(void)
{
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if ((UIInterfaceOrientationLandscapeLeft == orientation || UIInterfaceOrientationLandscapeRight == orientation) && [[UIApplication sharedApplication] isStatusBarHidden]) {
        return TPCommonHeaderbarContentHeight;
    } else {
        return TPCommonHeaderbarContentHeight + TPStatusBarHeight();
    }
}

CGFloat TPScreenHeight(void)
{
    CGRect rect = [[UIScreen mainScreen] bounds];
    return rect.size.width > rect.size.height ? rect.size.width : rect.size.height;
}

CGFloat TPScreenWidth(void)
{
    CGRect rect = [[UIScreen mainScreen] bounds];
    return rect.size.width > rect.size.height ? rect.size.height : rect.size.width;
}

