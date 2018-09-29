//
//  PJNetworkRequestError.h
//  PJGeneralProject
//
//  Created by 张佩金 on 2018/9/28.
//  Copyright © 2018年 张佩金. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PJNetworkRequestError : NSObject

@property (nonatomic,assign) NSInteger code;

@property (copy, nonatomic) NSString *message;

+ (instancetype)error;

@end

NS_ASSUME_NONNULL_END
