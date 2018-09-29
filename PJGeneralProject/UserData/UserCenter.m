//
//  UserCenter.m
//  PJCommonProduct
//
//  Created by 张佩金 on 2018/9/26.
//  Copyright © 2018年 张佩金. All rights reserved.
//

#import "UserCenter.h"


#define USER_GUID @"USER_GUID"
#define USER_TOKEN @"USER_GUID"

static UserCenter *_userCenter = nil;


@implementation UserCenter



+ (instancetype)shareInstance{
    if (_userCenter == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _userCenter = [[UserCenter alloc] init];
        });
    }
    return _userCenter;
}

#pragma mark - 用户的GUID 的存取
- (void)setUserGUID:(NSString *)userGUID{
    
    NSString *userGUID1;
    if ([userGUID isKindOfClass:[NSNull class]] || [[NSString stringWithFormat:@"%@",userGUID] isEqualToString:@"<null>"] || [[NSString stringWithFormat:@"%@",userGUID] isEqualToString:@"null"] || [NSString stringWithFormat:@"%@",userGUID].length == 0) {
        userGUID1 = @"-";
    }else{
        userGUID1 = userGUID;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:userGUID forKey:USER_GUID];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (NSString *)userGUID{
    return [[NSUserDefaults standardUserDefaults] objectForKey:USER_GUID];
}


#pragma mark - 用户的Token 存取
- (void)setUserToken:(NSString *)userToken{
    
    NSString *userToken1;
    if ([userToken isKindOfClass:[NSNull class]] || [[NSString stringWithFormat:@"%@",userToken] isEqualToString:@"<null>"] || [[NSString stringWithFormat:@"%@",userToken] isEqualToString:@"null"] || [NSString stringWithFormat:@"%@",userToken].length == 0) {
        userToken1 = @"-";
    }else{
        userToken1 = userToken;
    }
    [[NSUserDefaults standardUserDefaults] setObject:userToken1 forKey:USER_TOKEN];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)userToken{
    return [[NSUserDefaults standardUserDefaults] objectForKey:USER_TOKEN];
}


#pragma mark - 退出
- (void)logout{
    
    self.userGUID = @"";
    self.userToken = @"";
    
//    //切换到登录界面
//    UFStartViewController *loginVC = [[UFStartViewController alloc] init];
//    UFSuperNavigationController *loginNaVC = [[UFSuperNavigationController alloc]initWithRootViewController:loginVC];
//    //设置透明
//    loginNaVC.navigationBar.translucent = NO;
//    //隐藏navigationBar分割线
//    UIImageView *navImageView = [self findHairlineImageViewUnder:loginNaVC.navigationBar];
//    navImageView.hidden = YES;
//    [[AppDelegate shareInstance] changeRootViewController:loginNaVC Animate:YES];
}


@end
