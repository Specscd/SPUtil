//
//  UIImage+TPExtension.h
//  AFNetworking
//
//  Created by zhaojiaqi on 2018/8/15.
//

#import <UIKit/UIKit.h>

@interface UIImage (TPExtension)

+ (UIImage *)drawLineByImageView:(UIImageView *)imageView lineColor:(UIColor *)lineColor;

/**
 *  旋转图片
 *
 *  @param radians 旋转角度 ⟲
 *  @param fitSize YES: 新图片会适应尺寸 NO:尺寸不会更改，content可能会改变
 *
 *  @return UIImage
 */
- (nullable UIImage *)tp_imageByRotate:(CGFloat)radians fitSize:(BOOL)fitSize;


+ (UIImage *)imageFromColor:(UIColor *)color size:(CGSize)size;
- (UIImage*)imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size;
- (UIImage *)blurredImageWithRadius:(CGFloat)radius iterations:(NSUInteger)iterations tintColor:(UIColor *)tintColor;
- (double)calulateImageFileSize;

+ (UIImage *)snapsView:(UIView *)view size:(CGSize)size;

//获取视频的第一帧截图
+ (UIImage *)getVideoPreViewImageWithPath:(NSURL *)videoPath;


@end
