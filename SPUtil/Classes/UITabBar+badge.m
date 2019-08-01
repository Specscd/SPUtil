//
//  UITabBar+badge.m
//  Pods
//
//  Created by Joe.l on 2019/1/23.
//

#import "UITabBar+badge.h"

static NSInteger TabBarTagBase = 20190123;

@implementation UITabBar (badge)

//显示红点
- (void)showBadgeOnItemIndex:(int)index
{
    [self removeBadgeOnItemIndex:index];
    //新建小红点
    UIImageView *bview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dis_red_point"]];
    bview.tag = TabBarTagBase + index;
    CGRect tabFram = self.frame;
    
    float percentX = (index + 0.5) / self.items.count;
    CGFloat x = ceilf(percentX * tabFram.size.width) + 4;
    CGFloat y = 4;
    bview.frame = CGRectMake(x, y, TabbarRedWidth, TabbarRedWidth);
    [self addSubview:bview];
    [self bringSubviewToFront:bview];
}
- (void)showBadgeOnItemIndex:(int)index badge:(NSString *)badgeValue
{
    [self removeBadgeOnItemIndex:index];
    //新建小红点
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, TabbarItemHeight)];
    messageLabel.tag = TabBarTagBase + index;
    messageLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightBold];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.textColor = UIColor.whiteColor;
    messageLabel.layer.cornerRadius = TabbarItemHeight * 0.5;
    messageLabel.layer.masksToBounds = YES;
    messageLabel.backgroundColor = [UIColor colorWithRed:255/255.0 green:82/255.0 blue:82/255.0 alpha:1.0];
    messageLabel.text = badgeValue;
    
    CGFloat mesWidth = ceilf([messageLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, TabbarItemHeight)].width) + 8;
    CGRect tabFram = self.frame;
    
    float percentX = (index + 0.5) / self.items.count;
    CGFloat x = ceilf(percentX * tabFram.size.width) + 4;
    CGFloat y = 8;
    CGFloat w = TabbarItemHeight;
    if (w < mesWidth) {
        w = mesWidth;
    }
    messageLabel.frame = CGRectMake(x, y, w, TabbarItemHeight);
    [self addSubview:messageLabel];
    [self bringSubviewToFront:messageLabel];
}
//隐藏红点
-(void)hideBadgeOnItemIndex:(int)index{
    [self removeBadgeOnItemIndex:index];
}
//移除控件
- (void)removeBadgeOnItemIndex:(int)index
{
    for (UIView*subView in self.subviews) {
        if (subView.tag == TabBarTagBase + index) {
            [subView removeFromSuperview];
        }
    }
}

@end
