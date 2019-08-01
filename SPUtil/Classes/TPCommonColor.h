//
//  TPDialerColor.h
//  TouchPalIME
//
//  Created by gan lu on 12/14/11.
//  Copyright (c) 2011 CooTek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPCommonResource.h"

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
