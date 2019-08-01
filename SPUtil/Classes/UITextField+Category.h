//
//  UITextField+Category.h
//  Pods
//
//  Created by Joe.l on 2018/12/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Category)

#pragma mark - For length
//- (void)limitTextFieldWithLength:(NSInteger)maxLength;

#pragma mark - For bytes length
//你需要实现下面两个方法配合TextField代理使用
//通知中实现
- (void)limitTextFieldWithBytesLength:(NSInteger)maxLength;

//需要在 textField: shouldChangeCharactersInRange: replacementString: 方法中实现
- (BOOL)isEnabledWithBytesLength:(NSInteger)maxLength shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string;


@end

NS_ASSUME_NONNULL_END
