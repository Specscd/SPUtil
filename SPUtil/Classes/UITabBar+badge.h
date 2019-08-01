//
//  UITabBar+badge.h
//  Pods
//
//  Created by Joe.l on 2019/1/23.
//

#import <UIKit/UIKit.h>

#define TabbarRedWidth 13.0 //tabbar 红点宽

#define TabbarItemHeight 17.0 //tabbar 消息提醒高


NS_ASSUME_NONNULL_BEGIN


@interface UITabBar (badge)

- (void)showBadgeOnItemIndex:(int)index;

- (void)hideBadgeOnItemIndex:(int)index;

- (void)showBadgeOnItemIndex:(int)index badge:(NSString *)badgeValue;

@end

NS_ASSUME_NONNULL_END
