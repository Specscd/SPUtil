//
//  UIButton+TPExtension.m
//  TPVeeU
//
//  Created by lingmeixie on 2018/6/5.
//  Copyright © 2018年 touchpal. All rights reserved.
//

#import "UIButton+TPExtension.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

@implementation UIButton (TPExtension)

- (void)verticalImageLabel
{
    [self setTitleEdgeInsets:UIEdgeInsetsMake(self.imageView.frame.size.height, -self.imageView.frame.size.width, 0.0, 0.0)];     //文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [self setImageEdgeInsets:UIEdgeInsetsMake(-self.titleLabel.bounds.size.height, 0.0, 0.0, self.titleLabel.bounds.size.width)]; //图片距离右边框距离减少图片的宽度，其它不边
}

- (void)verticalImageLabel:(CGFloat)offset
{
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -self.imageView.frame.size.width, -self.imageView.frame.size.height - offset / 2, 0);
    self.imageEdgeInsets = UIEdgeInsetsMake(-self.titleLabel.intrinsicContentSize.height - offset / 2, 0, 0, -self.titleLabel.intrinsicContentSize.width);
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    if (highlighted) {
        self.alpha = 0.4;
    } else {
        self.alpha = 1.0;
    }
}
@end
