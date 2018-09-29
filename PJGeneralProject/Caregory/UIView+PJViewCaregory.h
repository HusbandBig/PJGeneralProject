//
//  UIView+PJViewCaregory.h
//  PJCommonProduct
//
//  Created by 张佩金 on 2018/9/26.
//  Copyright © 2018年 张佩金. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (PJViewCaregory)

/**
 控件起点X
 */
@property (nonatomic) CGFloat x;

/**
 控件起点Y
 */
@property (nonatomic) CGFloat y;

/**
 控件宽
 */
@property (nonatomic) CGFloat width;

/**
 控件高
 */
@property (nonatomic) CGFloat height;

/**
 控件中心点X
 */
@property (nonatomic) CGFloat centerX;

/**
 控件中心点Y
 */
@property (nonatomic) CGFloat centerY;

/**
 控件顶部Y
 */
@property (nonatomic) CGFloat top;

/**
 控件底部Y
 */
@property (nonatomic) CGFloat bottom;

/**
 控件左边X
 */
@property (nonatomic) CGFloat left;

/**
 控件右边X
 */
@property (nonatomic) CGFloat right;

/**
 控件左上X、Y
 */
@property(nonatomic) CGPoint topLeft ;
/**
 控件右上X、Y
 */
@property(nonatomic) CGPoint topRight ;

/**
 控件左下X、Y
 */
@property(nonatomic) CGPoint bottomLeft ;

/**
 控件右下X、Y
 */
@property(nonatomic) CGPoint bottomRight ;

/**
 设置上边圆角
 */
- (void)setCornerOnTop:(CGFloat) conner;

/**
 设置下边圆角
 */
- (void)setCornerOnBottom:(CGFloat) conner;

/**
 设置左边圆角
 */
- (void)setCornerOnLeft:(CGFloat) conner;

/**
 设置右边圆角
 */
- (void)setCornerOnRight:(CGFloat) conner;

/**
 设置左上圆角
 */
- (void)setCornerOnTopLeft:(CGFloat) conner;

/**
 设置右上圆角
 */
- (void)setCornerOnTopRight:(CGFloat) conner;

/**
 设置左下圆角
 */
- (void)setCornerOnBottomLeft:(CGFloat) conner;

/**
 设置右下圆角
 */
- (void)setCornerOnBottomRight:(CGFloat) conner;

/**
 设置所有圆角
 */
- (void)setAllCorner:(CGFloat) conner;



@end

NS_ASSUME_NONNULL_END
