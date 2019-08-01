//
//  TPUIFactory.m
//  VeeU
//
//  Created by zhaojiaqi on 2018/7/12.
//  Copyright © 2018年 touchpal. All rights reserved.
//

#import "TPUIFactory.h"


@implementation TPUIFactory

UIKIT_EXTERN UIButton *createImageButton(NSString *imageName, UIEdgeInsets insets)
{
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImageEdgeInsets:insets];
    return button;
}

UIKIT_EXTERN UIButton *createNormalButton(NSString *titleString, UIImage *image, UIFont *font)
{
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:titleString forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = font;
    return button;
}

UIKIT_EXTERN UIButton *createTextButton(NSString *title, UIColor *textColor, UIFont *font)
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button.titleLabel setFont:font];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    return button;
}

UIKIT_EXTERN UILabel *createTextLabel(NSString *title, UIColor *textColor, UIFont *font)
{
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.textColor = textColor;
    label.font = font;
    return label;
}

UIKIT_EXTERN UILabel *createNormalLabel(NSString *title, UIFont *font, UIColor *textColor, NSTextAlignment textAlignment)
{
    UILabel *lb_normal = [UILabel new];
    lb_normal.text = title;
    lb_normal.font = font;
    lb_normal.textColor = textColor;
    lb_normal.textAlignment = textAlignment;
    return lb_normal;
}

@end
