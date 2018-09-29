//
//  PJNetworkRequestConfig.h
//  PJGeneralProject
//
//  Created by 张佩金 on 2018/9/27.
//  Copyright © 2018年 张佩金. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PJNetworkRequestConfig : NSObject

/** 网络请求URL */
@property(nonatomic,copy) NSString *requestURL;

/** 网络请求参数 */
@property(nonatomic,copy) NSDictionary *requestParameter;

/** 网络请求超时时间 */
@property(nonatomic,assign) NSTimeInterval requestTimeout;

/**
 创建PJNetworkRequestConfig
 */
+ (instancetype)config;

@end

NS_ASSUME_NONNULL_END
