//
//  SPComonMacro.h
//  SPUtil
//
//  Created by zhaojiaqi on 2019/8/1.
//

#ifndef SPComonMacro_h
#define SPComonMacro_h

#define 1PixHeight 0.5
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

#define IPhoneXTopMargin ((KiPhoneX || KiPhoneXR) ? 24 : 0)
#define IPhoneXBottomMargin ((KiPhoneX || KiPhoneXR) ? 34 : 0)
#define IPhoneXBottom ((KiPhoneX || KiPhoneXR) ? 83 : 49)
#define IphoneXTop ((KiPhoneX || KiPhoneXR) ? 88.0 : 64.0)
#define IphoneXTopStatus ((KiPhoneX || KiPhoneXR) ? 44.0 : 20.0)
#define SepLineHeight (1/[UIScreen mainScreen].scale)

#define RGB2UIColor2(r, g, b) [UIColor \
colorWithRed:((float)r) / 255.0    \
green:((float)g) / 255.0    \
blue:((float)b) / 255.0    \
alpha:1.0]

#define RGB2UIColor(rgbValue) [UIColor                          \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0    \
blue:((float)(rgbValue & 0xFF)) / 255.0             \
alpha:1.0]

#define RGB2UIColorWithAlpha(rgbValue, a) [UIColor              \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0    \
blue:((float)(rgbValue & 0xFF)) / 255.0             \
alpha:a]

#define RGBA2UIColor2(r, g, b, a) [UIColor \
colorWithRed:((float)r) / 255.0        \
green:((float)g) / 255.0        \
blue:((float)b) / 255.0        \
alpha:((float)a) / 255.0]

#endif /* SPComonMacro_h */
