//
//  UIFont+TPCommon.m
//  VeeU
//
//  Created by zhaojiaqi on 2018/7/26.
//  Copyright © 2018年 touchpal. All rights reserved.
//

#import "UIFont+TPCommon.h"

@implementation UIFont (TPCommon)

/**
 *  常用字体，一般都用这个
 *
 *  @param fontSize 字号
 *
 *  @return UIFont对象
 */
+ (UIFont *)tp_regularFontWithSize:(CGFloat)fontSize {
    return [self systemFontOfSize:fontSize weight:UIFontWeightRegular];
}

/**
 *  黑体，比较粗的字用这个
 *
 *  @param fontSize 字号
 *
 *  @return UIFont对象
 */
+ (UIFont *)tp_boldFontWithSize:(CGFloat)fontSize {
    return [self systemFontOfSize:fontSize weight:UIFontWeightBold];
}

/**
 *  数字字体，数字显示用这个
 *
 *  @param fontSize 字号
 *
 *  @return UIFont对象
 */
+ (UIFont *)tp_numberFontWithSize:(CGFloat)fontSize {
    return [self fontWithName:@"AvenirNext-Bold" size:fontSize];
}

+ (UIFont *)tp_lightFontWithSize:(CGFloat)fontSize {
    return [self systemFontOfSize:fontSize weight:UIFontWeightLight];
}

+ (UIFont *)tp_heavyFontWithSize:(CGFloat)fontSize {
    return [self systemFontOfSize:fontSize weight:UIFontWeightHeavy];
}

+ (UIFont *)tp_mediumFontWithSize:(CGFloat)fontSize {
    return [self systemFontOfSize:fontSize weight:UIFontWeightMedium];
}

+ (UIFont *)tp_semiboldFontWithSize:(CGFloat)fontSize {
    return [self systemFontOfSize:fontSize weight:UIFontWeightSemibold];
}

+ (UIFont *)tp_blackFontWithSize:(CGFloat)fontSize {
    return [self systemFontOfSize:fontSize weight:UIFontWeightBlack];
}

+ (UIFont *)tp_italicFont:(UIFont *)font slopeAngle:(NSInteger)angle {
    CGAffineTransform matrix = CGAffineTransformMake(1, 0, tanf(angle * (CGFloat)M_PI / 180), 1, 0, 0);
    UIFontDescriptor *desc = [UIFontDescriptor fontDescriptorWithName:font.fontName matrix:matrix];
    return [UIFont fontWithDescriptor:desc size:font.pointSize];
}
@end
