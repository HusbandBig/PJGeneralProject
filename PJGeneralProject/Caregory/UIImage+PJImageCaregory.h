//
//  UIView+PJImageCaregory.h
//  PJCommonProduct
//
//  Created by 张佩金 on 2018/9/26.
//  Copyright © 2018年 张佩金. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger,BitPixels) {
    PJAlpha = 0,
    PJBlue = 1,
    PJGreen = 2,
    PJRed = 3
};


@interface UIImage (PJImageCaregory)

/**
 截取View上的图片
 */
+ (UIImage *)shotWithView:(UIView *)view;

/**
  改变图片的颜色
 */
+ (UIImage *)imageWithColor:(UIColor *)color originalImage:(UIImage *)originalImage;

/**
  图片模糊处理
 */
+ (UIImage *)gaussianBlurImage:(UIImage *)image andInputRadius:(CGFloat)radius;

/**
 改变图片方向
 */
+ (UIImage *)fixOrientationWithImage:(UIImage *)image;

/**
 修改为圆形图片
 */
+ (UIImage *)clipRoundWithImage:(UIImage *)image;

/**
 根据CIImage生成指定大小的UIImage
 */
+ (UIImage *)createUIImageFormCIImage:(CIImage *)ciImage withSize:(CGFloat)size;

/**
 转成黑白图像
 */
+ (UIImage*)covertToGrayImageFromImage:(UIImage*)sourceImage;

/**
 获取图片指定位置的颜色
 */
+ (UIColor *)getColorFromImage:(UIImage *)image point:(CGPoint )point;




/**
 *  将图片转换为点阵图数据
 *
 *  @return 转化后的点阵图数据
 */
- (NSData *)bitmapData;

/**
 *  将图片绘制到绘图上下文中，并返回上下文
 *
 *  @return
 */
//+ (CGContextRef)bitmapRGBA8ContextFromImage:(CGImageRef)image;
- (CGContextRef)bitmapRGBA8Context;

/**
 *  缩放图片，会按照给定的最大宽度，等比缩放
 *
 *  @param maxWidth 缩放后的最大宽度
 *
 *  @return 返回缩放后的图片
 */
- (UIImage *)imageWithscaleMaxWidth:(CGFloat)maxWidth;

/**
 *  将图片转换为黑白图片
 *
 *  @return 黑白图片
 */
- (UIImage *)blackAndWhiteImage;


/**
 *  创建条形码
 *
 *  @param info 字符串信息
 *
 *  @return 条形码图片
 */
+ (UIImage *)barCodeImageWithInfo:(NSString *)info;


/**
 *  创建条形码
 *
 *  @param info 字符串信息
 *
 *  @param size 尺寸
 *
 *  @return 条形码图片
 */
+ (UIImage *)barCodeImageWithInfo:(NSString *)info size:(CGSize)size;

/**
 *  创建二维码
 *
 *  @param info  二维码内的信息
 *  @param image 二维码中心的logo图片
 *  @param width_height 二维码的宽度 高度
 *
 *  @return 二维码图片
 */
+ (UIImage *)qrCodeImageWithInfo:(NSString *)info centerImage:(UIImage *)image widthAndHeight:(CGFloat)width_height;

/**
 *  将CIImage 放大显示，并转换为UIImage。
 *
 *  @param image 原始CIImage
 *  @param size  最终尺寸的宽度
 *
 *  @return UIImage
 */
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGSize)size;

/**
 *  将原图转变为背景色透明，图片为设置的颜色
 *
 *  @param image 要改变的图片
 *  @param red   red
 *  @param green green
 *  @param blue  blue
 *
 *  @return 返回修改后的图片
 */
+ (UIImage*)imageBgColorToTransparentWith:(UIImage*)image withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue;


@end

NS_ASSUME_NONNULL_END
