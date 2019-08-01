//
//  NSString+MD5.m
//  TouchPalDialer
//
//  Created by Scyuan on 14-8-28.
//
//
#import <CommonCrypto/CommonDigest.h>
#import "NSString+MD5.h"


@implementation NSString (MD5)
- (NSString *)MD5Hash
{
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    CC_MD5_Update(&md5, [self UTF8String], (uint32_t)[self length]);
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);

    NSString *md5String = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                                                     digest[0], digest[1],
                                                     digest[2], digest[3],
                                                     digest[4], digest[5],
                                                     digest[6], digest[7],
                                                     digest[8], digest[9],
                                                     digest[10], digest[11],
                                                     digest[12], digest[13],
                                                     digest[14], digest[15]];

    return md5String;
}


@end
