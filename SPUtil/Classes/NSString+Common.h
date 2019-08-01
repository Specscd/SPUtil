//
//  NSString+Comment.h
//  VeeU
//
//  Created by zhaojiaqi on 2018/7/19.
//  Copyright © 2018年 touchpal. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NSString (Common)

/**
 *  点赞人数转换
 *  @param count      目标字符串
 *  @return 转换后的富文本
 */
+ (NSString *)countFormat:(NSInteger)count;
+ (NSString *)countFormatNoPoint:(NSInteger)count;

- (NSString *)toShowDateString;

- (NSDate *)toUTCDate;
/**
 *  彩票时间转换
 *  @return 转换后的时间
 */
- (NSString *)toLotteryDate;

+ (NSString *)convertDate:(NSDate *)date;

/**
 *  富文本转换
 *
 *  @param keyword      目标字符串
 *  @param textColor    目标颜色
 *  @param font         目标字体
 *
 *  @return 转换后的富文本
 */
- (NSMutableAttributedString *)changeWithKeyword:(NSString *)keyword
                                       textColor:(UIColor *)textColor
                                        textFont:(UIFont *)font;
/**
 *  判断文本是否全部是空格或者空字符串
 *
 *  @return 是否为空
 */
- (BOOL)isEmptyText;

/**
 *  判断文本是否空
 *
 *  @return 是否为空
 */
+ (BOOL)isEmpty:(NSString *)string;

+ (BOOL)isNotEmpty:(NSString *)string;

/**
 *  计算String的尺寸
 *
 *  @param font            字体大小
 *  @param constrainedSize 最大尺寸
 *
 *  @return 字体大小
 */
- (CGSize)tp_sizeFromStringWithFont:(UIFont *)font
                  constrainedToSize:(CGSize)constrainedSize;

/**
 *  计算字母换行String的尺寸
 *
 *  @param font            字体大小
 *  @param constrainedSize 最大尺寸
 *
 *  @return 字体大小
 */
- (CGSize)tp_sizeFromCharLineBreakStringWithFont:(UIFont *)font
                               constrainedToSize:(CGSize)constrainedSize;
- (NSString *)formatCoin;
/// 根据URL 获取当前URL里面的参数 Dict,  此url为完整URL
- (NSDictionary *)dictionaryWithUrlParamater;

+ (NSString *)dictionaryToString:(NSDictionary *)dic;
/// 00:00:00  h:m:s
+ (NSString *)getTimeString:(NSInteger)timeseconds;
/// 00:00 m:s  (h >= 1 00:00:00 h:m:s)
+ (NSString *)getMTimeString:(NSInteger)timeseconds;

- (NSInteger)byteLength;

//判断字符串的字符个数
+ (int)getCharacterFormStr:(NSString *)tempStr;

//过滤emoji
- (BOOL)stringContainsEmoji;
/// 给URL后拼接额外参数
- (NSString *)appendParamForUrl:(NSDictionary *)params;
/**
 *  点赞人数转换
 *  @param Email  邮箱字符串
 *  @return 是否是邮箱格式
 */
+ (BOOL)isEmailAdress:(NSString *)Email;
/**
 *  点赞人数转换
 *  @param string 字符串
 *  @return 是否是数字和字符组合
 */
+ (BOOL)isnumberAndChar:(NSString *)string;

/**
 *  十六进制字符串转换成UIColor
 *  @param string 字符串 @"0xFFFFFF0E" @"#ffeeee"
 *  @param CGFloat alpha < 0放弃定义透明度
 *  @return 是否是数字和字符组合
 */

+ (UIColor *)colorWithHexString:(NSString *)color
                          alpha:(CGFloat)alpha;

@end
