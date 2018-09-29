//
//  UIView+PJViewCaregory.m
//  PJCommonProduct
//
//  Created by 张佩金 on 2018/9/26.
//  Copyright © 2018年 张佩金. All rights reserved.
//

#import "UIView+PJViewCaregory.h"

@implementation UIView (PJViewCaregory)

#pragma mark - 控件起点X
- (CGFloat)x {
    
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.x = x;
    self.frame        = newFrame;
}


#pragma mark - 控件起点Y
- (CGFloat)y {
    
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.y = y;
    self.frame        = newFrame;
}


#pragma mark - 控件宽
- (CGFloat)width {
    
    return CGRectGetWidth(self.bounds);
}
- (void)setWidth:(CGFloat)width {
    
    CGRect newFrame     = self.frame;
    newFrame.size.width = width;
    self.frame          = newFrame;
}


#pragma mark - 控件高
- (CGFloat)height {
    
    return CGRectGetHeight(self.bounds);
}
- (void)setHeight:(CGFloat)height {
    
    CGRect newFrame      = self.frame;
    newFrame.size.height = height;
    self.frame           = newFrame;
}


#pragma mark - 控件中心点X
- (CGFloat)centerX {
    
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX {
    
    CGPoint newCenter = self.center;
    newCenter.x       = centerX;
    self.center       = newCenter;
}


#pragma mark - 控件中心点Y
- (CGFloat)centerY {
    
    return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY {
    
    CGPoint newCenter = self.center;
    newCenter.y       = centerY;
    self.center       = newCenter;
}


#pragma mark - 控件顶部Y
- (CGFloat)top {
    
    return self.frame.origin.y;
}
- (void)setTop:(CGFloat)top {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.y = top;
    self.frame        = newFrame;
}


#pragma mark - 控件底部Y
- (CGFloat)bottom {
    
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setBottom:(CGFloat)bottom {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.y = bottom - self.frame.size.height;
    self.frame        = newFrame;
}


#pragma mark - 控件左边X
- (CGFloat)left {
    
    return self.frame.origin.x;
}
- (void)setLeft:(CGFloat)left {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.x = left;
    self.frame        = newFrame;
}


#pragma mark - 控件右边X
- (CGFloat)right {
    
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setRight:(CGFloat)right {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.x = right - self.frame.size.width;
    self.frame        = newFrame;
}


#pragma mark - 控件左上X、Y
- (CGPoint)topLeft{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}
- (void)setTopLeft:(CGPoint)topLeft{
    
    CGFloat left = topLeft.x;
    CGFloat top = topLeft.y;
    
    CGRect newFrame   = self.frame;
    newFrame.origin.x = left;
    newFrame.origin.y = top;
    self.frame  = newFrame;
}


#pragma mark - 控件右上X、Y
- (CGPoint)topRight{
 
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}
- (void)setTopRight:(CGPoint)topRight{
    
    CGFloat right = topRight.x;
    CGFloat top = topRight.y;
    
    CGRect newFrame   = self.frame;
    newFrame.origin.x = right - self.frame.size.width;
    newFrame.origin.y = top;
    self.frame  = newFrame;
}


#pragma mark - 控件左下X、Y
- (CGPoint)bottomLeft{
   
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}
- (void)setBottomLeft:(CGPoint)bottomLeft{
    
    CGFloat left = bottomLeft.x;
    CGFloat bottom = bottomLeft.y;
    
    CGRect newFrame   = self.frame;
    newFrame.origin.x = left;
    newFrame.origin.y = bottom - self.frame.size.height;
    self.frame  = newFrame;
}


#pragma mark - 控件右下X、Y
- (CGPoint)bottomRight{
    
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (void)setBottomRight:(CGPoint)bottomRight{
    
    CGFloat right = bottomRight.x;
    CGFloat bottom = bottomRight.y;
    
    CGRect newFrame   = self.frame;
    newFrame.origin.x = right - self.frame.size.width;
    newFrame.origin.y = bottom - self.frame.size.height;
    self.frame  = newFrame;
}


#pragma mark - 设置上边圆角
- (void)setCornerOnTop:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}


#pragma mark - 设置下边圆角
- (void)setCornerOnBottom:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight)
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}


#pragma mark - 设置左边圆角
- (void)setCornerOnLeft:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft)
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}


#pragma mark - 设置右边圆角
- (void)setCornerOnRight:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerTopRight | UIRectCornerBottomRight)
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}


#pragma mark - 设置左上圆角
- (void)setCornerOnTopLeft:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:UIRectCornerTopLeft
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}


#pragma mark - 设置右上圆角
- (void)setCornerOnTopRight:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:UIRectCornerTopRight
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}


#pragma mark - 设置左下圆角
- (void)setCornerOnBottomLeft:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:UIRectCornerBottomLeft
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}


#pragma mark - 设置右下圆角
- (void)setCornerOnBottomRight:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:UIRectCornerBottomRight
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}


#pragma mark - 设置所有圆角
- (void)setAllCorner:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                          cornerRadius:conner];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}



@end
