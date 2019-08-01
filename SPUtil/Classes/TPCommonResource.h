//
//  TPVideoResource.h
//  TPVideoFeeds
//
//  Created by lingmeixie on 2018/8/3.
//

#import <Foundation/Foundation.h>
#import "NSCommonBundle.h"


#define TPCommon_FrameworkSrcName(file) [@"Frameworks/TPCommon.framework/" stringByAppendingPathComponent:file]
#define TPCommonSrcName(file) [@"TPCommon.bundle" stringByAppendingPathComponent:file]
#define TPCommonBundle [NSCommonBundle bundle]
#define TPCommon_Image(file) [UIImage imageNamed:file inBundle:TPCommonBundle compatibleWithTraitCollection:nil]

#define TPCommonLocalizedString(key, comment) \
    NSLocalizedStringFromTableInBundle((key), @"TPCommon", TPCommonBundle, (comment))

