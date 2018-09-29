//
//  AppDelegate.h
//  PJCommonProduct
//
//  Created by 张佩金 on 2018/9/26.
//  Copyright © 2018年 张佩金. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 获取AppDelegate
 */
+ (AppDelegate*)shareInstance;

/**
 切换根控制器
 */
- (void)changeRootViewController:(UIViewController *)rootViewController Animate:(BOOL)animate;

@end

