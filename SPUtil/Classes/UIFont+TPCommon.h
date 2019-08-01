//
//  UIFont+TPCommon.h
//  VeeU
//
//  Created by zhaojiaqi on 2018/7/26.
//  Copyright © 2018年 touchpal. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIFont (TPCommon)

/**
 *  常用字体，一般都用这个
 *
 *  @param fontSize 字号
 *
 *  @return UIFont对象
 */
+ (UIFont *)tp_regularFontWithSize:(CGFloat)fontSize;

/**
 *  黑体，比较粗的字用这个
 *
 *  @param fontSize 字号
 *
 *  @return UIFont对象
 */
+ (UIFont *)tp_boldFontWithSize:(CGFloat)fontSize;

/**
 *  数字字体，数字显示用这个
 *
 *  @param fontSize 字号
 *
 *  @return UIFont对象
 */
+ (UIFont *)tp_numberFontWithSize:(CGFloat)fontSize;

+ (UIFont *)tp_lightFontWithSize:(CGFloat)fontSize;

+ (UIFont *)tp_heavyFontWithSize:(CGFloat)fontSize;

+ (UIFont *)tp_mediumFontWithSize:(CGFloat)fontSize;

+ (UIFont *)tp_semiboldFontWithSize:(CGFloat)fontSize;

+ (UIFont *)tp_blackFontWithSize:(CGFloat)fontSize;

/**
 *  倾斜字体
 *  @param font 需要倾斜的字体
 *  @param angle 倾斜角度
 *  @return UIFont对象
 */
+ (UIFont *)tp_italicFont:(UIFont *)font slopeAngle:(NSInteger)angle;

@end
