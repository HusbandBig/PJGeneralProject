//
//  PJNetworkRequestManager.h
//  PJGeneralProject
//
//  Created by 张佩金 on 2018/9/27.
//  Copyright © 2018年 张佩金. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PJNetworkRequestConfig;
@class PJNetworkRequestError;

NS_ASSUME_NONNULL_BEGIN

//GET
typedef void(^PJGETNetworkRequestProgress)(NSProgress *_Nonnull progress);
typedef void(^PJGETNetworkRequestSuccess)(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject);
typedef void(^PJGETNetworkRequestFailure)(NSURLSessionDataTask * _Nullable task, PJNetworkRequestError *_Nonnull error);

//HEAD
typedef void(^PJHEADNetworkRequestSuccess)(NSURLSessionDataTask *_Nonnull task);
typedef void(^PJHEADNetworkRequestFailure)(NSURLSessionDataTask * _Nullable task, PJNetworkRequestError *_Nonnull error);

//POST
typedef void(^PJPOSTNetworkRequestMultipartFormData)(id _Nonnull multipartFormData);
typedef void(^PJPOSTNetworkRequestProgress)(NSProgress *_Nonnull progress);
typedef void(^PJPOSTNetworkRequestSuccess)(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject);
typedef void(^PJPOSTNetworkRequestFailure)(NSURLSessionDataTask * _Nullable task, PJNetworkRequestError *_Nonnull error);

//PUT
typedef void(^PJPUTNetworkRequestSuccess)(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject);
typedef void(^PJPUTNetworkRequestFailure)(NSURLSessionDataTask * _Nullable task, PJNetworkRequestError *_Nonnull error);

//PATCH
typedef void(^PJPATCHNetworkRequestSuccess)(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject);
typedef void(^PJPATCHNetworkRequestFailure)(NSURLSessionDataTask * _Nullable task, PJNetworkRequestError *_Nonnull error);

//DELETE
typedef void(^PJDELETENetworkRequestSuccess)(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject);
typedef void(^PJDELETENetworkRequestFailure)(NSURLSessionDataTask * _Nullable task, PJNetworkRequestError *_Nonnull error);


@interface PJNetworkRequestManager : NSObject

/**
 创建网络请求
 */
+ (instancetype)manager;


/**
 GET请求 废弃 1
 */
- (nullable NSURLSessionDataTask *)GET:(PJNetworkRequestConfig *)requestConfig success:(nullable PJGETNetworkRequestSuccess)success failure:(nullable PJGETNetworkRequestFailure)failure DEPRECATED_ATTRIBUTE;
/**
 GET请求 废弃 2
 */
- (nullable NSURLSessionDataTask *)GET:(PJNetworkRequestConfig *)requestConfig progress:(nullable PJGETNetworkRequestProgress)progress success:(nullable PJGETNetworkRequestSuccess)success failure:(nullable PJGETNetworkRequestFailure)failure DEPRECATED_ATTRIBUTE;
/**
 GET请求
 */
- (nullable NSURLSessionDataTask *)GET:(PJNetworkRequestConfig *)requestConfig headers:(nullable NSDictionary <NSString *, NSString *> *)headers progress:(nullable PJGETNetworkRequestProgress)progress success:(nullable PJGETNetworkRequestSuccess)success failure:(nullable PJGETNetworkRequestFailure)failure;




/**
 HEAD请求 废弃 1
 */
- (nullable NSURLSessionDataTask *)HEAD:(PJNetworkRequestConfig *)requestConfig success:(nullable PJHEADNetworkRequestSuccess)success failure:(nullable PJHEADNetworkRequestFailure)failure DEPRECATED_ATTRIBUTE;
/**
 HEAD请求
 */
- (nullable NSURLSessionDataTask *)HEAD:(PJNetworkRequestConfig *)requestConfig headers:(nullable NSDictionary <NSString *, NSString *> *)headers success:(nullable PJHEADNetworkRequestSuccess)success failure:(nullable PJHEADNetworkRequestFailure)failure;





/**
 POST请求 废弃 1
 */
- (nullable NSURLSessionDataTask *)POST:(PJNetworkRequestConfig *)requestConfig success:(nullable PJPOSTNetworkRequestSuccess)success failure:(nullable PJPOSTNetworkRequestFailure)failure DEPRECATED_ATTRIBUTE;
/**
 POST请求 废弃 2
 */
- (nullable NSURLSessionDataTask *)POST:(PJNetworkRequestConfig *)requestConfig progress:(nullable PJPOSTNetworkRequestProgress)progress success:(nullable PJPOSTNetworkRequestSuccess)success failure:(nullable PJPOSTNetworkRequestFailure)failure DEPRECATED_ATTRIBUTE;
/**
 POST请求 废弃 3
 */
- (nullable NSURLSessionDataTask *)POST:(PJNetworkRequestConfig *)requestConfig multipartFormData:(nullable PJPOSTNetworkRequestMultipartFormData)multipartFormData success:(nullable PJPOSTNetworkRequestSuccess)success failure:(nullable PJPOSTNetworkRequestFailure)failure DEPRECATED_ATTRIBUTE;
/**
 POST请求 废弃 4
 */
- (nullable NSURLSessionDataTask *)POST:(PJNetworkRequestConfig *)requestConfig multipartFormData:(nullable PJPOSTNetworkRequestMultipartFormData)multipartFormData progress:(nullable PJPOSTNetworkRequestProgress)progress success:(nullable PJPOSTNetworkRequestSuccess)success failure:(nullable PJPOSTNetworkRequestFailure)failure DEPRECATED_ATTRIBUTE;
/**
 POST请求
 */
- (nullable NSURLSessionDataTask *)POST:(PJNetworkRequestConfig *)requestConfig headers:(nullable NSDictionary <NSString *, NSString *> *)headers progress:(nullable PJPOSTNetworkRequestProgress)progress success:(nullable PJPOSTNetworkRequestSuccess)success failure:(nullable PJPOSTNetworkRequestFailure)failure;
/**
 POST请求
 */
- (nullable NSURLSessionDataTask *)POST:(PJNetworkRequestConfig *)requestConfig headers:(nullable NSDictionary <NSString *, NSString *> *)headers multipartFormData:(nullable PJPOSTNetworkRequestMultipartFormData)multipartFormData progress:(nullable PJPOSTNetworkRequestProgress)progress success:(nullable PJPOSTNetworkRequestSuccess)success failure:(nullable PJPOSTNetworkRequestFailure)failure;





/**
 PUT请求 废弃 1
 */
- (nullable NSURLSessionDataTask *)PUT:(PJNetworkRequestConfig *)requestConfig success:(nullable PJPUTNetworkRequestSuccess)success failure:(nullable PJPUTNetworkRequestFailure)failure DEPRECATED_ATTRIBUTE;
/**
 PUT请求
 */
- (nullable NSURLSessionDataTask *)PUT:(PJNetworkRequestConfig *)requestConfig headers:(nullable NSDictionary <NSString *, NSString *> *)headers success:(nullable PJPUTNetworkRequestSuccess)success failure:(nullable PJPUTNetworkRequestFailure)failure;





/**
 PATCH请求 废弃 1
 */
- (nullable NSURLSessionDataTask *)PATCH:(PJNetworkRequestConfig *)requestConfig success:(nullable PJPATCHNetworkRequestSuccess)success failure:(nullable PJPATCHNetworkRequestFailure)failure DEPRECATED_ATTRIBUTE;
/**
 PATCH请求
 */
- (nullable NSURLSessionDataTask *)PATCH:(PJNetworkRequestConfig *)requestConfig headers:(nullable NSDictionary <NSString *, NSString *> *)headers success:(nullable PJPATCHNetworkRequestSuccess)success failure:(nullable PJPATCHNetworkRequestFailure)failure;





/**
 DELETE请求 废弃 1
 */
- (nullable NSURLSessionDataTask *)DELETE:(PJNetworkRequestConfig *)requestConfig success:(nullable PJDELETENetworkRequestSuccess)success failure:(nullable PJDELETENetworkRequestFailure)failure DEPRECATED_ATTRIBUTE;
/**
 DELETE请求
 */
- (nullable NSURLSessionDataTask *)DELETE:(PJNetworkRequestConfig *)requestConfig headers:(nullable NSDictionary <NSString *, NSString *> *)headers success:(nullable PJDELETENetworkRequestSuccess)success failure:(nullable PJDELETENetworkRequestFailure)failure;




@end

NS_ASSUME_NONNULL_END
