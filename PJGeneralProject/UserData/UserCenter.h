//
//  UserCenter.h
//  PJCommonProduct
//
//  Created by 张佩金 on 2018/9/26.
//  Copyright © 2018年 张佩金. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserCenter : NSObject


@property (nonatomic, copy) NSString *userGUID;
@property (nonatomic, copy) NSString *userToken;

/**
 获取UserCenter
 */
+ (instancetype)shareInstance;

/**
 退出
 */
- (void)logout;


@end

NS_ASSUME_NONNULL_END
