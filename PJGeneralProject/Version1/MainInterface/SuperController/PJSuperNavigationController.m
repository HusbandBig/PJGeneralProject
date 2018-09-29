//
//  UFSuperNavigationController.m
//  MemberShip
//
//  Created by 张佩金 on 2017/6/29.
//  Copyright © 2017年 unitedfitness. All rights reserved.
//

#import "PJSuperNavigationController.h"

@interface PJSuperNavigationController ()

@end

@implementation PJSuperNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置透明
    self.navigationBar.translucent = NO;

    [self.navigationBar setBarTintColor:[UIColor colorWithRed:213.0/255 green:62.0/255 blue:64.0/255 alpha:1]];
    [self.navigationBar setTintColor:[UIColor whiteColor]];

}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //隐藏navigationBar分割线
    UIImageView *navImageView = [self findHairlineImageViewUnder:self.navigationBar];
    navImageView.hidden = YES;
}



#pragma mark - 获取navigationimageView （分割线）
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;

}

@end
