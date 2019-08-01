//
//  TPUIFactory.h
//  VeeU
//
//  Created by zhaojiaqi on 2018/7/12.
//  Copyright © 2018年 touchpal. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TPUIFactory : NSObject

UIKIT_EXTERN UIButton *createImageButton(NSString *imageName, UIEdgeInsets insets);

UIKIT_EXTERN UIButton *createNormalButton(NSString *titleString, UIImage *image, UIFont *font);

UIKIT_EXTERN UIButton *createTextButton(NSString *title, UIColor *textColor, UIFont *font);

UIKIT_EXTERN UILabel *createTextLabel(NSString *title, UIColor *textColor, UIFont *font);

UIKIT_EXTERN UILabel *createNormalLabel(NSString *title, UIFont *font, UIColor *textColor, NSTextAlignment textAlignment);

@end
