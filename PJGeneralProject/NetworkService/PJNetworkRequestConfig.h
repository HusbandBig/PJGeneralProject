//
//  PJNetworkRequestConfig.h
//  PJGeneralProject
//
//  Created by 张佩金 on 2018/9/27.
//  Copyright © 2018年 张佩金. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
  请求数据序列化
 */
typedef NS_ENUM(NSInteger, PJRequestSerializerType) {
    
    PJRequestSerializerTypeHTTP,
    PJRequestSerializerTypeJSON,
    PJRequestSerializerTypePropertyList
    
};

/**
 返回数据序列化
 */
typedef NS_ENUM(NSInteger, PJResponseSerializerType) {
 
    PJResponseSerializerTypeHTTP,
    PJResponseSerializerTypeJSON,
    PJResponseSerializerTypeXMLParser,
    PJResponseSerializerTypePropertyList

};



@interface PJNetworkRequestConfig : NSObject

/** 网络请求URL */
@property(nonatomic,copy) NSString *requestURL;

/** 网络请求参数 */
@property(nonatomic,copy) NSDictionary *requestParameter;

/** 网络请求超时时间 */
@property(nonatomic,assign) NSTimeInterval requestTimeout;

/** 请求数据序列化 */
@property (nonatomic, assign) PJRequestSerializerType requestSerializer;

/** 返回数据序列化 */
@property (nonatomic, assign) PJResponseSerializerType responseSerializer;

/**
 创建PJNetworkRequestConfig
 */
+ (instancetype)config;

@end

NS_ASSUME_NONNULL_END
