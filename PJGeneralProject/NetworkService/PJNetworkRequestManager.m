//
//  PJNetworkRequestManager.m
//  PJGeneralProject
//
//  Created by 张佩金 on 2018/9/27.
//  Copyright © 2018年 张佩金. All rights reserved.
//

#import "PJNetworkRequestManager.h"
#import "AFNetworking.h"
#import "PJNetworkRequestConfig.h"
#import "PJNetworkStatusManager.h"
#import "PJNetworkRequestError.h"
#import "AppGlobalData.h"

@implementation PJNetworkRequestManager

+ (instancetype)manager{
    PJNetworkRequestManager *manager = [[PJNetworkRequestManager alloc] init];
    return manager;
}

#pragma mark - GET请求 废弃 1
- (NSURLSessionDataTask *)GET:(PJNetworkRequestConfig *)requestConfig success:(PJGETNetworkRequestSuccess)success failure:(PJGETNetworkRequestFailure)failure{
   
    if ([PJNetworkStatusManager isNetworkEnable]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = requestConfig.requestTimeout;
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
        
        [self setRequestSerializerWithRequestConfig:requestConfig sessionManager:manager];
        [self setResponseSerializerWithRequestConfig:requestConfig sessionManager:manager];
        
        NSURLSessionDataTask *task = [manager GET:requestConfig.requestURL parameters:requestConfig.requestParameter success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                PJNetworkRequestError *pjError = [PJNetworkRequestError error];
                pjError.code = error.code;
                pjError.message = error.localizedDescription;
                failure(task,pjError);
            }
        }];
        return task;
    }else{
        if (failure) {
            PJNetworkRequestError *pjError = [PJNetworkRequestError error];
            pjError.code = 103;
            pjError.message = @"network is error";
            failure(nil,pjError);
        }
        return nil;
    }
    
}
#pragma mark - GET请求 废弃 2
- (NSURLSessionDataTask *)GET:(PJNetworkRequestConfig *)requestConfig progress:(PJGETNetworkRequestProgress)progress success:(PJGETNetworkRequestSuccess)success failure:(PJGETNetworkRequestFailure)failure{
    
    if ([PJNetworkStatusManager isNetworkEnable]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = requestConfig.requestTimeout;
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
        
        [self setRequestSerializerWithRequestConfig:requestConfig sessionManager:manager];
        [self setResponseSerializerWithRequestConfig:requestConfig sessionManager:manager];
        

        NSURLSessionDataTask *task = [manager GET:requestConfig.requestURL parameters:requestConfig.requestParameter progress:^(NSProgress * _Nonnull downloadProgress) {
            if (progress) {
                progress(downloadProgress);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                PJNetworkRequestError *pjError = [PJNetworkRequestError error];
                pjError.code = error.code;
                pjError.message = error.localizedDescription;
                failure(task,pjError);
            }
        }];
        return task;
    }else{
        if (failure) {
            PJNetworkRequestError *pjError = [PJNetworkRequestError error];
            pjError.code = 103;
            pjError.message = @"network is error";
            failure(nil,pjError);
        }
        return nil;
    }
    
}
#pragma mark - GET请求
- (NSURLSessionDataTask *)GET:(PJNetworkRequestConfig *)requestConfig headers:(NSDictionary <NSString *, NSString *> *)headers progress:(PJGETNetworkRequestProgress)progress success:(PJGETNetworkRequestSuccess)success failure:(PJGETNetworkRequestFailure)failure{

    if ([PJNetworkStatusManager isNetworkEnable]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = requestConfig.requestTimeout;
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
       
        [self setRequestSerializerWithRequestConfig:requestConfig sessionManager:manager];
        [self setResponseSerializerWithRequestConfig:requestConfig sessionManager:manager];
        

        NSURLSessionDataTask *task = [manager GET:requestConfig.requestURL parameters:requestConfig.requestParameter headers:headers progress:^(NSProgress * _Nonnull downloadProgress) {
            if (progress) {
               progress(downloadProgress);
            }
       } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           if (success) {
             success(task,responseObject);
           }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                PJNetworkRequestError *pjError = [PJNetworkRequestError error];
                pjError.code = error.code;
                pjError.message = error.localizedDescription;
                failure(task,pjError);
            }
        }];
        return task;
    }else{
        if (failure) {
            PJNetworkRequestError *pjError = [PJNetworkRequestError error];
            pjError.code = 103;
            pjError.message = @"network is error";
            failure(nil,pjError);
        }
        return nil;
    }
}





#pragma mark - HEAD请求 废弃 1
- (NSURLSessionDataTask *)HEAD:(PJNetworkRequestConfig *)requestConfig success:(PJHEADNetworkRequestSuccess)success failure:(PJHEADNetworkRequestFailure)failure{
    if ([PJNetworkStatusManager isNetworkEnable]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = requestConfig.requestTimeout;
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
        
        [self setRequestSerializerWithRequestConfig:requestConfig sessionManager:manager];
        [self setResponseSerializerWithRequestConfig:requestConfig sessionManager:manager];
        

        NSURLSessionDataTask *task = [manager HEAD:requestConfig.requestURL parameters:requestConfig.requestParameter success:^(NSURLSessionDataTask * _Nonnull task) {
            if (success) {
                success(task);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                PJNetworkRequestError *pjError = [PJNetworkRequestError error];
                pjError.code = error.code;
                pjError.message = error.localizedDescription;
                failure(task,pjError);
            }
        }];
        return task;
    }else{
        if (failure) {
            PJNetworkRequestError *pjError = [PJNetworkRequestError error];
            pjError.code = 103;
            pjError.message = @"network is error";
            failure(nil,pjError);
        }
        return nil;
    }
}
#pragma mark - HEAD请求
- (NSURLSessionDataTask *)HEAD:(PJNetworkRequestConfig *)requestConfig headers:(NSDictionary <NSString *, NSString *> *)headers success:(PJHEADNetworkRequestSuccess)success failure:(PJHEADNetworkRequestFailure)failure{
    if ([PJNetworkStatusManager isNetworkEnable]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = requestConfig.requestTimeout;
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
        
        [self setRequestSerializerWithRequestConfig:requestConfig sessionManager:manager];
        [self setResponseSerializerWithRequestConfig:requestConfig sessionManager:manager];
        

        NSURLSessionDataTask *task = [manager HEAD:requestConfig.requestURL parameters:requestConfig.requestParameter headers:headers success:^(NSURLSessionDataTask * _Nonnull task) {
            if (success) {
                success(task);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                PJNetworkRequestError *pjError = [PJNetworkRequestError error];
                pjError.code = error.code;
                pjError.message = error.localizedDescription;
                failure(task,pjError);
            }
        }];
        return task;
    }else{
        if (failure) {
            PJNetworkRequestError *pjError = [PJNetworkRequestError error];
            pjError.code = 103;
            pjError.message = @"network is error";
            failure(nil,pjError);
        }
        return nil;
    }
}





#pragma mark - POST请求 废弃 1
- (NSURLSessionDataTask *)POST:(PJNetworkRequestConfig *)requestConfig success:(PJPOSTNetworkRequestSuccess)success failure:(PJPOSTNetworkRequestFailure)failure{
    
    if ([PJNetworkStatusManager isNetworkEnable]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = requestConfig.requestTimeout;
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
        
        [self setRequestSerializerWithRequestConfig:requestConfig sessionManager:manager];
        [self setResponseSerializerWithRequestConfig:requestConfig sessionManager:manager];
        

        NSURLSessionDataTask *task = [manager POST:requestConfig.requestURL parameters:requestConfig.requestParameter success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                PJNetworkRequestError *pjError = [PJNetworkRequestError error];
                pjError.code = error.code;
                pjError.message = error.localizedDescription;
                failure(task,pjError);
            }
        }];
        return task;
    }else{
        if (failure) {
            PJNetworkRequestError *pjError = [PJNetworkRequestError error];
            pjError.code = 103;
            pjError.message = @"network is error";
            failure(nil,pjError);
        }
        return nil;
    }
}
#pragma mark - POST请求 废弃 2
- (NSURLSessionDataTask *)POST:(PJNetworkRequestConfig *)requestConfig progress:(PJPOSTNetworkRequestProgress)progress success:(PJPOSTNetworkRequestSuccess)success failure:(PJPOSTNetworkRequestFailure)failure{
    
    if ([PJNetworkStatusManager isNetworkEnable]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = requestConfig.requestTimeout;
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
       
        [self setRequestSerializerWithRequestConfig:requestConfig sessionManager:manager];
        [self setResponseSerializerWithRequestConfig:requestConfig sessionManager:manager];
        

        NSURLSessionDataTask *task = [manager POST:requestConfig.requestURL parameters:requestConfig.requestParameter progress:^(NSProgress * _Nonnull uploadProgress) {
            if (progress) {
                progress(uploadProgress);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                PJNetworkRequestError *pjError = [PJNetworkRequestError error];
                pjError.code = error.code;
                pjError.message = error.localizedDescription;
                failure(task,pjError);
            }
        }];
        return task;
    }else{
        if (failure) {
            PJNetworkRequestError *pjError = [PJNetworkRequestError error];
            pjError.code = 103;
            pjError.message = @"network is error";
            failure(nil,pjError);
        }
        return nil;
    }
}
#pragma mark - POST请求 废弃 3
- (NSURLSessionDataTask *)POST:(PJNetworkRequestConfig *)requestConfig multipartFormData:(PJPOSTNetworkRequestMultipartFormData)multipartFormData success:(PJPOSTNetworkRequestSuccess)success failure:(PJPOSTNetworkRequestFailure)failure{
    
    if ([PJNetworkStatusManager isNetworkEnable]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = requestConfig.requestTimeout;
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
        
        [self setRequestSerializerWithRequestConfig:requestConfig sessionManager:manager];
        [self setResponseSerializerWithRequestConfig:requestConfig sessionManager:manager];
        

        NSURLSessionDataTask *task = [manager POST:requestConfig.requestURL parameters:requestConfig.requestParameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            if (multipartFormData) {
                multipartFormData(formData);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                PJNetworkRequestError *pjError = [PJNetworkRequestError error];
                pjError.code = error.code;
                pjError.message = error.localizedDescription;
                failure(task,pjError);
            }
        }];
        return task;
    }else{
        if (failure) {
            PJNetworkRequestError *pjError = [PJNetworkRequestError error];
            pjError.code = 103;
            pjError.message = @"network is error";
            failure(nil,pjError);
        }
        return nil;
    }
    
    
}
#pragma mark - POST请求 废弃 4
- (NSURLSessionDataTask *)POST:(PJNetworkRequestConfig *)requestConfig multipartFormData:(PJPOSTNetworkRequestMultipartFormData)multipartFormData progress:(PJPOSTNetworkRequestProgress)progress success:(PJPOSTNetworkRequestSuccess)success failure:(PJPOSTNetworkRequestFailure)failure{
    
    if ([PJNetworkStatusManager isNetworkEnable]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = requestConfig.requestTimeout;
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
        
        [self setRequestSerializerWithRequestConfig:requestConfig sessionManager:manager];
        [self setResponseSerializerWithRequestConfig:requestConfig sessionManager:manager];
        

        NSURLSessionDataTask *task = [manager POST:requestConfig.requestURL parameters:requestConfig.requestParameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            if (multipartFormData) {
                multipartFormData(formData);
            }
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            if (progress) {
                progress(uploadProgress);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                PJNetworkRequestError *pjError = [PJNetworkRequestError error];
                pjError.code = error.code;
                pjError.message = error.localizedDescription;
                failure(task,pjError);
            }
        }];
        return task;
    }else{
        if (failure) {
            PJNetworkRequestError *pjError = [PJNetworkRequestError error];
            pjError.code = 103;
            pjError.message = @"network is error";
            failure(nil,pjError);
        }
        return nil;
    }
    
    
}
#pragma mark - POST请求
- (NSURLSessionDataTask *)POST:(PJNetworkRequestConfig *)requestConfig headers:(NSDictionary <NSString *, NSString *> *)headers progress:(PJPOSTNetworkRequestProgress)progress success:(PJPOSTNetworkRequestSuccess)success failure:(PJPOSTNetworkRequestFailure)failure{
    
    if ([PJNetworkStatusManager isNetworkEnable]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = requestConfig.requestTimeout;
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
       
        [self setRequestSerializerWithRequestConfig:requestConfig sessionManager:manager];
        [self setResponseSerializerWithRequestConfig:requestConfig sessionManager:manager];
        

        NSURLSessionDataTask *task = [manager POST:requestConfig.requestURL parameters:requestConfig.requestParameter headers:headers progress:^(NSProgress * _Nonnull uploadProgress) {
            if (progress) {
                progress(uploadProgress);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                PJNetworkRequestError *pjError = [PJNetworkRequestError error];
                pjError.code = error.code;
                pjError.message = error.localizedDescription;
                failure(task,pjError);
            }
        }];
        return task;
    }else{
        if (failure) {
            PJNetworkRequestError *pjError = [PJNetworkRequestError error];
            pjError.code = 103;
            pjError.message = @"network is error";
            failure(nil,pjError);
        }
        return nil;
    }
}
#pragma mark - POST请求
- (NSURLSessionDataTask *)POST:(PJNetworkRequestConfig *)requestConfig headers:(NSDictionary <NSString *, NSString *> *)headers multipartFormData:(PJPOSTNetworkRequestMultipartFormData)multipartFormData progress:(PJPOSTNetworkRequestProgress)progress success:(PJPOSTNetworkRequestSuccess)success failure:(PJPOSTNetworkRequestFailure)failure{
    
    if ([PJNetworkStatusManager isNetworkEnable]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = requestConfig.requestTimeout;
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
     
        [self setRequestSerializerWithRequestConfig:requestConfig sessionManager:manager];
        [self setResponseSerializerWithRequestConfig:requestConfig sessionManager:manager];
        

        NSURLSessionDataTask *task = [manager POST:requestConfig.requestURL parameters:requestConfig.requestParameter headers:headers constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            if (multipartFormData) {
                multipartFormData(formData);
            }
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            if (progress) {
                progress(uploadProgress);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                PJNetworkRequestError *pjError = [PJNetworkRequestError error];
                pjError.code = error.code;
                pjError.message = error.localizedDescription;
                failure(task,pjError);
            }
        }];
        return task;
    }else{
        if (failure) {
            PJNetworkRequestError *pjError = [PJNetworkRequestError error];
            pjError.code = 103;
            pjError.message = @"network is error";
            failure(nil,pjError);
        }
        return nil;
    }
    
    
}





#pragma mark - PUT请求 废弃 1
- (NSURLSessionDataTask *)PUT:(PJNetworkRequestConfig *)requestConfig success:(PJPUTNetworkRequestSuccess)success failure:(PJPUTNetworkRequestFailure)failure{
    if ([PJNetworkStatusManager isNetworkEnable]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = requestConfig.requestTimeout;
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
        
        [self setRequestSerializerWithRequestConfig:requestConfig sessionManager:manager];
        [self setResponseSerializerWithRequestConfig:requestConfig sessionManager:manager];
        

        NSURLSessionDataTask *task = [manager PUT:requestConfig.requestURL parameters:requestConfig.requestParameter success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                PJNetworkRequestError *pjError = [PJNetworkRequestError error];
                pjError.code = error.code;
                pjError.message = error.localizedDescription;
                failure(task,pjError);
            }
        }];
        return task;
    }else{
        if (failure) {
            PJNetworkRequestError *pjError = [PJNetworkRequestError error];
            pjError.code = 103;
            pjError.message = @"network is error";
            failure(nil,pjError);
        }
        return nil;
    }
}
#pragma mark - PUT请求
- (NSURLSessionDataTask *)PUT:(PJNetworkRequestConfig *)requestConfig headers:(NSDictionary <NSString *, NSString *> *)headers success:(PJPUTNetworkRequestSuccess)success failure:(PJPUTNetworkRequestFailure)failure{
    if ([PJNetworkStatusManager isNetworkEnable]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = requestConfig.requestTimeout;
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
       
        [self setRequestSerializerWithRequestConfig:requestConfig sessionManager:manager];
        [self setResponseSerializerWithRequestConfig:requestConfig sessionManager:manager];
        

        NSURLSessionDataTask *task = [manager PUT:requestConfig.requestURL parameters:requestConfig.requestParameter headers:headers success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                PJNetworkRequestError *pjError = [PJNetworkRequestError error];
                pjError.code = error.code;
                pjError.message = error.localizedDescription;
                failure(task,pjError);
            }
        }];
        return task;
    }else{
        if (failure) {
            PJNetworkRequestError *pjError = [PJNetworkRequestError error];
            pjError.code = 103;
            pjError.message = @"network is error";
            failure(nil,pjError);
        }
        return nil;
    }
}





#pragma mark - PATCH请求 废弃 1
- (NSURLSessionDataTask *)PATCH:(PJNetworkRequestConfig *)requestConfig success:(PJPATCHNetworkRequestSuccess)success failure:(PJPATCHNetworkRequestFailure)failure{
    if ([PJNetworkStatusManager isNetworkEnable]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = requestConfig.requestTimeout;
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
        
        [self setRequestSerializerWithRequestConfig:requestConfig sessionManager:manager];
        [self setResponseSerializerWithRequestConfig:requestConfig sessionManager:manager];
        

        NSURLSessionDataTask *task = [manager PATCH:requestConfig.requestURL parameters:requestConfig.requestParameter success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                PJNetworkRequestError *pjError = [PJNetworkRequestError error];
                pjError.code = error.code;
                pjError.message = error.localizedDescription;
                failure(task,pjError);
            }
        }];
        return task;
    }else{
        if (failure) {
            PJNetworkRequestError *pjError = [PJNetworkRequestError error];
            pjError.code = 103;
            pjError.message = @"network is error";
            failure(nil,pjError);
        }
        return nil;
    }
}
#pragma mark - PATCH请求
- (NSURLSessionDataTask *)PATCH:(PJNetworkRequestConfig *)requestConfig headers:(NSDictionary <NSString *, NSString *> *)headers success:(PJPATCHNetworkRequestSuccess)success failure:(PJPATCHNetworkRequestFailure)failure{
    if ([PJNetworkStatusManager isNetworkEnable]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = requestConfig.requestTimeout;
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
        
        [self setRequestSerializerWithRequestConfig:requestConfig sessionManager:manager];
        [self setResponseSerializerWithRequestConfig:requestConfig sessionManager:manager];
        

        NSURLSessionDataTask *task = [manager PATCH:requestConfig.requestURL parameters:requestConfig.requestParameter headers:headers success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                PJNetworkRequestError *pjError = [PJNetworkRequestError error];
                pjError.code = error.code;
                pjError.message = error.localizedDescription;
                failure(task,pjError);
            }
        }];
        return task;
    }else{
        if (failure) {
            PJNetworkRequestError *pjError = [PJNetworkRequestError error];
            pjError.code = 103;
            pjError.message = @"network is error";
            failure(nil,pjError);
        }
        return nil;
    }
}





#pragma mark - DELETE请求 废弃 1
- (NSURLSessionDataTask *)DELETE:(PJNetworkRequestConfig *)requestConfig success:(PJDELETENetworkRequestSuccess)success failure:(PJDELETENetworkRequestFailure)failure{
    if ([PJNetworkStatusManager isNetworkEnable]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = requestConfig.requestTimeout;
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
       
        [self setRequestSerializerWithRequestConfig:requestConfig sessionManager:manager];
        [self setResponseSerializerWithRequestConfig:requestConfig sessionManager:manager];
        

        NSURLSessionDataTask *task = [manager DELETE:requestConfig.requestURL parameters:requestConfig.requestParameter success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                PJNetworkRequestError *pjError = [PJNetworkRequestError error];
                pjError.code = error.code;
                pjError.message = error.localizedDescription;
                failure(task,pjError);
            }
        }];
        return task;
    }else{
        if (failure) {
            PJNetworkRequestError *pjError = [PJNetworkRequestError error];
            pjError.code = 103;
            pjError.message = @"network is error";
            failure(nil,pjError);
        }
        return nil;
    }
}
#pragma mark - DELETE请求
- (NSURLSessionDataTask *)DELETE:(PJNetworkRequestConfig *)requestConfig headers:(NSDictionary <NSString *, NSString *> *)headers success:(PJDELETENetworkRequestSuccess)success failure:(PJDELETENetworkRequestFailure)failure{
    if ([PJNetworkStatusManager isNetworkEnable]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = requestConfig.requestTimeout;
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
        
        [self setRequestSerializerWithRequestConfig:requestConfig sessionManager:manager];
        [self setResponseSerializerWithRequestConfig:requestConfig sessionManager:manager];
        

        NSURLSessionDataTask *task = [manager DELETE:requestConfig.requestURL parameters:requestConfig.requestParameter headers:headers success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                PJNetworkRequestError *pjError = [PJNetworkRequestError error];
                pjError.code = error.code;
                pjError.message = error.localizedDescription;
                failure(task,pjError);
            }
        }];
        return task;
    }else{
        if (failure) {
            PJNetworkRequestError *pjError = [PJNetworkRequestError error];
            pjError.code = 103;
            pjError.message = @"network is error";
            failure(nil,pjError);
        }
        return nil;
    }
}




#pragma mark - 设置请求数据序列化
- (void)setRequestSerializerWithRequestConfig:(PJNetworkRequestConfig *)requestConfig sessionManager:(AFHTTPSessionManager *)manager{
    switch (requestConfig.requestSerializer) {
        case PJRequestSerializerTypeHTTP:
            manager.requestSerializer = [AFHTTPRequestSerializer serializer];
            break;
        case PJRequestSerializerTypeJSON:
            manager.requestSerializer=[AFJSONRequestSerializer serializer];
            break;
        case PJRequestSerializerTypePropertyList:
            manager.requestSerializer=[AFPropertyListRequestSerializer serializer];
            break;
        default:
            break;
    }
}
#pragma mark - 设置返回数据序列化
- (void)setResponseSerializerWithRequestConfig:(PJNetworkRequestConfig *)requestConfig sessionManager:(AFHTTPSessionManager *)manager{
    switch (requestConfig.responseSerializer) {
        case PJResponseSerializerTypeHTTP:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        case PJResponseSerializerTypeJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case PJResponseSerializerTypeXMLParser:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        case PJResponseSerializerTypePropertyList:
            manager.responseSerializer = [AFPropertyListResponseSerializer serializer];
            break;
        default:
            break;
    }
}
@end
