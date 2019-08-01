//
//  NSString+Common.m
//  VeeU
//
//  Created by zhaojiaqi on 2018/7/19.
//  Copyright © 2018年 touchpal. All rights reserved.
//

#import "NSString+Common.h"

@implementation NSString (Common)

+ (NSString *)countFormat:(NSInteger)count
{
    BOOL isPositive = count >= 0;
    NSString *resultString = @"";
    NSInteger abCount = count > 0 ? count : -count;
    if (abCount < 10000) {
        resultString = [self stringWithFormat:@"%ld", abCount];
    } else if (abCount < 1000000) {
        NSInteger frontCount = abCount / 1000;
        NSInteger decimalCount = (abCount - frontCount * 1000) / 100;
        if (decimalCount > 0) {
            resultString = [NSString stringWithFormat:@"%ld.%ldK", frontCount, decimalCount];
        } else {
            resultString = [NSString stringWithFormat:@"%ldK", frontCount];
        }
    } else if (abCount < 1000000000) {
        NSInteger frontCount = abCount / 1000000;
        NSInteger decimalCount = (abCount - frontCount * 1000000) / 100000;
        if (decimalCount > 0) {
            resultString = [NSString stringWithFormat:@"%ld.%ldM", frontCount, decimalCount];
        } else {
            resultString = [NSString stringWithFormat:@"%ldM", frontCount];
        }
    } else {
        resultString = @"999.9M";
    }
    if (!isPositive) {
        return [self stringWithFormat:@"-%@", resultString];
    }
    return resultString;
}

+ (NSString *)countFormatNoPoint:(NSInteger)count
{
    BOOL isPositive = count >= 0;
    NSString *resultString = @"";
    NSInteger abCount = count > 0 ? count : -count;
    if (abCount < 10000) {
        resultString = [self stringWithFormat:@"%ld", abCount];
    } else if (abCount < 1000000) {
        NSInteger frontCount = abCount / 1000;
        NSInteger decimalCount = (abCount - frontCount * 1000) / 100;
        if (decimalCount > 0 && frontCount < 100) {
            resultString = [NSString stringWithFormat:@"%ld.%ldK", frontCount, decimalCount];
        } else {
            resultString = [NSString stringWithFormat:@"%ldK", frontCount];
        }
    } else if (abCount < 1000000000) {
        NSInteger frontCount = abCount / 1000000;
        NSInteger decimalCount = (abCount - frontCount * 1000000) / 100000;
        if (decimalCount > 0 && frontCount < 100) {
            resultString = [NSString stringWithFormat:@"%ld.%ldM", frontCount, decimalCount];
        } else {
            resultString = [NSString stringWithFormat:@"%ldM", frontCount];
        }
    } else {
        resultString = @"999M";
    }
    if (!isPositive) {
        return [self stringWithFormat:@"-%@", resultString];
    }
    return resultString;
}


- (NSString *)toShowDateString
{
    NSDate *date = [self toUTCDate];
    return [NSString convertDate:date];
}

- (NSDate *)toUTCDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    dateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    dateFormatter.locale = [NSLocale systemLocale];
    NSDate *date = [dateFormatter dateFromString:self];
    return date;
}

- (NSString *)toLotteryDate
{
    NSDate *lotteryDate = [self toUTCDate];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd MMM yyyy"];
    NSString *lotteryDateString = [dateFormatter stringFromDate:lotteryDate];
    return lotteryDateString;
}

+ (NSString *)convertDate:(NSDate *)date
{
    if (date == nil) {
        return @"1s";
    }
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger upToHours = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *difference = [calendar components:upToHours fromDate:date toDate:[NSDate date] options:0];

    if (difference.year >= 1) { //年
        return [NSString stringWithFormat:@"%ldy", (long)difference.year];
    } else {
        if (difference.month >= 1) { //月
            return [NSString stringWithFormat:@"%ldmon", (long)difference.month];
        } else {
            if (difference.day >= 1) { //日
                return [NSString stringWithFormat:@"%ldd", (long)difference.day];
            } else {
                if (difference.hour >= 1) { //时
                    return [NSString stringWithFormat:@"%ldh", (long)difference.hour];
                } else {
                    if (difference.minute >= 1) { //分
                        return [NSString stringWithFormat:@"%ldm", (long)difference.minute];
                    } else {
                        if (difference.second >= 1) { //秒
                            return [NSString stringWithFormat:@"%lds", (long)difference.second];
                        } else {
                            return @"1s";
                        }
                    }
                }
            }
        }
    }
    return @"1s";
}

- (NSMutableAttributedString *)changeWithKeyword:(NSString *)keyword
                                       textColor:(UIColor *)textColor
                                        textFont:(UIFont *)font
{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:self];
    NSRange keywordRange = [self rangeOfString:keyword];
    NSDictionary *attributeDic = @{
        NSForegroundColorAttributeName : textColor,
        NSFontAttributeName : font
    };
    [attributedStr setAttributes:attributeDic range:keywordRange];

    return attributedStr;
}

- (BOOL)isEmptyText
{
    if (!self) {
        return YES;
    } else {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [self stringByTrimmingCharactersInSet:set];
        if (0 == [trimedString length]) {
            return YES;
        } else {
            return NO;
        }
    }
}

/**
 *  计算String的尺寸
 *
 *  @param font            字体大小
 *  @param constrainedSize 最大尺寸
 *
 *  @return 字体大小
 */
- (CGSize)tp_sizeFromStringWithFont:(UIFont *)font
                  constrainedToSize:(CGSize)constrainedSize
{
    if (font) {
        NSDictionary *attributes = @{NSFontAttributeName : font};
        CGRect rect = [self boundingRectWithSize:constrainedSize
                                         options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                      attributes:attributes
                                         context:nil];
        return rect.size;
    }
    return CGSizeZero;
}

- (CGSize)tp_sizeFromCharLineBreakStringWithFont:(UIFont *)font
                               constrainedToSize:(CGSize)constrainedSize
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary *attributes = @{
        NSFontAttributeName : font,
        NSParagraphStyleAttributeName : paragraphStyle
    };
    if (font) {
        CGRect rect = [self boundingRectWithSize:constrainedSize
                                         options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                      attributes:attributes
                                         context:nil];
        return rect.size;
    }
    return CGSizeZero;
}

- (NSString *)formatCoin
{
    NSString *decimalString;
    NSString *intString;
    NSString *locale;
    NSString *strLanguage = [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0];
    if ([strLanguage length] > 0) {
        locale = [strLanguage stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    }
    if (![locale containsString:@"_"]) {
        locale = @"en_US";
    }
    // 越南符号特殊
    if ([locale isEqualToString:@"vi_VN"]) {
        intString = @".";
        decimalString = @",";
    } else {
        intString = @",";
        decimalString = @".";
    }

    int count = 0;
    NSInteger decimal = (self.floatValue - self.integerValue) * 10;
    NSString *formatString = self;
    if (decimal > 0) {
        formatString = [NSString stringWithFormat:@"%ld", self.integerValue];
    }
    long long int a = self.longLongValue;
    while (a != 0) {
        count++;
        a /= 10;
    }
    NSMutableString *string = [NSMutableString stringWithString:formatString];
    NSMutableString *newstring = [NSMutableString string];
    while (count > 3) {
        count -= 3;
        NSRange rang = NSMakeRange(string.length - 3, 3);
        NSString *str = [string substringWithRange:rang];
        [newstring insertString:str atIndex:0];
        [newstring insertString:intString atIndex:0];
        [string deleteCharactersInRange:rang];
    }
    [newstring insertString:string atIndex:0];
    if (decimal > 0) {
        [newstring appendFormat:@"%@%ld", decimalString, decimal];
    }
    return newstring;
}

+ (BOOL)isNotEmpty:(NSString *)string
{
    return ![NSString isEmpty:string];
}

+ (BOOL)isEmpty:(NSString *)string
{
    if ([string isKindOfClass:[NSString class]]) {
        return (string.length == 0);
    }
    return YES;
}

- (NSDictionary *)dictionaryWithUrlParamater
{
    if (self.length) {
        NSURL *url = [NSURL URLWithString:self];
        if (url == nil) {
            return nil;
        }
        NSMutableDictionary *paramsDict = [NSMutableDictionary dictionary];
        NSURLComponents *components = [[NSURLComponents alloc] initWithString:url.absoluteString];
        [components.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
            //NSLog(@"%@=%@",obj.name,obj.value);
            [paramsDict setObject:obj.value forKey:obj.name];
        }];
        return paramsDict;
    }
    return nil;
}

+ (NSString *)dictionaryToString:(NSDictionary *)dic
{
    if (dic == nil) {
        return nil;
    }
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (jsonData) {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

+ (NSString *)getTimeString:(NSInteger)timeseconds
{
    NSInteger hours = timeseconds / 3600;
    NSInteger minutes = (timeseconds % 3600) / 60;
    NSInteger seconds = timeseconds % 3600 % 60;
    return [NSString stringWithFormat:@"%ld:%02ld:%02ld", hours, minutes, seconds];
}

+ (NSString *)getMTimeString:(NSInteger)timeseconds
{
    NSInteger hours = timeseconds / 3600;
    NSInteger minutes = (timeseconds % 3600) / 60;
    NSInteger seconds = timeseconds % 3600 % 60;
    if (hours > 0) {
        return [NSString stringWithFormat:@"%ld:%02ld:%02ld", hours, minutes, seconds];
    }
    return [NSString stringWithFormat:@"%02ld:%02ld", minutes, seconds];
}

//注：第一个方法 emoji也按2个字符算， 第二个方法用Unicode编码后是按4个字符算的

#pragma mark - func one
- (NSInteger)byteLength
{
    //拿到所有str的length长度（包括中文英文..都算为1个字符）
    NSUInteger len = self.length;
    //汉字字符集
    NSString *pattern = @"[\u4e00-\u9fa5]";
    //正则表达式筛选条件
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    //计算中文字符的个数
    NSInteger numMatch = [regex numberOfMatchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, len)];
    //len已经把中文算进去了，中文少的一个字符通过numMatch个数来补充，效果就是中文2个字符，英文1个字符
    return len + numMatch;
}

#pragma mark - func two
//判断字符串的字符个数
+ (int)getCharacterFormStr:(NSString *)tempStr
{
    int strlength = 0;
    char *p = (char *)[tempStr cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i = 0; i < [tempStr lengthOfBytesUsingEncoding:NSUnicodeStringEncoding]; i++) {
        if (*p) {
            p++;
            strlength++;
        } else {
            p++;
        }
    }
    return strlength;
}

- (BOOL)stringContainsEmoji
{
    // 过滤所有表情。returnValue为NO表示不含有表情，YES表示含有表情
    __block BOOL returnValue = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {

        const unichar hs = [substring characterAtIndex:0];
        // surrogate pair
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                returnValue = YES;
            }
        } else {
            // non surrogate
            if (0x2100 <= hs && hs <= 0x27ff) {
                returnValue = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                returnValue = YES;
            }
        }
    }];
    return returnValue;
}

- (NSString *)appendParamForUrl:(NSDictionary *)params
{
    if (self == nil || [self isEqualToString:@""]) {
        return self;
    }
    NSURL *url = [NSURL URLWithString:self];
    if (url == nil) {
        return self;
    }

    NSString *strFragment = nil;
    if (url.fragment.length > 0) {
        strFragment = url.fragment;
    }
    //NSString *str = @"&";
    NSMutableString *strParam = nil;
    if (url.query.length == 0) {
        strParam = [[NSMutableString alloc] initWithString:@"?"];
    } else {
        strParam = [[NSMutableString alloc] initWithString:@"&"];
    }
    NSString *charters = @"!$&'()*+,-./:;=?@_~%#[]";
    NSCharacterSet *encode_set = [NSCharacterSet characterSetWithCharactersInString:charters];
    // 快速遍历参数数组
    for (id key in params) {
        [strParam appendString:key];
        [strParam appendString:@"="];
        [strParam appendString:[[params objectForKey:key] stringByAddingPercentEncodingWithAllowedCharacters:encode_set]];
        [strParam appendString:@"&"];
    }
    // 处理多余的&以及返回含参url
    if (strParam.length > 1) {
        // 去掉末尾的&
        strParam = [strParam substringToIndex:strParam.length - 1];

        //若有锚点，把锚点添加进去
        if (strFragment.length > 0) {
            NSString *strURL = [self stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"#%@", strFragment] withString:@""];
            strURL = [strURL stringByAppendingString:strParam];
            strURL = [strURL stringByAppendingFormat:@"#%@", strFragment];
            return strURL;
        }
        // 返回含参url
        return [self stringByAppendingString:strParam];
    }
    return nil;
}

+ (BOOL)isEmailAdress:(NSString *)Email
{
    NSString *emailCheck = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", emailCheck];
    return [emailTest evaluateWithObject:Email];
}

+ (BOOL)isnumberAndChar:(NSString *)string
{
    NSString *stringCheck = @"^[A-Za-z0-9]+$";
    NSPredicate *stringTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", stringCheck];
    return [stringTest evaluateWithObject:string];
}

+ (UIColor *)colorWithHexString:(NSString *)color
                          alpha:(CGFloat)alpha
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }

    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 8 && [cString length] != 6) {
        return [UIColor clearColor];
    }

    CGFloat insideAlpha = 1.0f;
    if ([cString length] == 8) {
        NSString *aString = [cString substringWithRange:NSMakeRange(0, 2)];
        unsigned int a;
        [[NSScanner scannerWithString:aString] scanHexInt:&a];
        insideAlpha = (float)a / 255.0f;
        cString = [cString substringWithRange:NSMakeRange(2, 6)];
    }
    if (alpha > 0) {
        insideAlpha = alpha;
    }

    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;

    //r
    NSString *rString = [cString substringWithRange:range];

    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];

    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];

    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];

    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:insideAlpha];
}
@end
