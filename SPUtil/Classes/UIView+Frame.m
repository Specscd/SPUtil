//
//  UIView+Frame.m
//  ItcastWeibo
//
//  Created by yz on 14/11/5.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (CGFloat)tp_width
{
    return self.frame.size.width;
}
- (void)setTPWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)tp_height
{
    return self.frame.size.height;
}
- (void)setTPHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)tp_x
{
    return self.frame.origin.x;
}

- (void)setTPX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;

}

- (CGFloat)tp_y
{
    return self.frame.origin.y;
}
- (void)setTPY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;

}

- (CGSize)tp_size
{
    return self.frame.size;
}
- (void)setTPSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)tp_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setTp_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)tp_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setTp_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (void)setTp_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)tp_centerX {
    return self.center.x;
}

- (CGFloat)tp_centerY {
    return self.center.y;
}

- (void)setTp_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}


@end
