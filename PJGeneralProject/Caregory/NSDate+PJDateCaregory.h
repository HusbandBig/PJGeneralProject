//
//  NSDate+PJDateCaregory.h
//  PJCommonProduct
//
//  Created by 张佩金 on 2018/9/26.
//  Copyright © 2018年 张佩金. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (PJDateCaregory)

/**
 将本地日期字符串转为UTC日期字符串 本地日期格式: 2017-07-04 07:53:51
 */
+ (NSString *)getUTCFromLocalDateString:(NSString *)localDateString;
+ (NSString *)getUTCFromLocalDate:(NSDate *)localDate;

/**
 将UTC日期字符串转为本地时间字符串 输入的UTC日期格式: 2017-07-04T18:15:34.258
 */
+ (NSString *)getLocalDateFromUTCDateString:(NSString *)utcDatetring;
+ (NSString *)getLocalDateFromUTCDate:(NSDate *)utcDate;

/**
 计算两个日期相差的天数
 */
+ (NSDictionary *)calculateDaysWithStartTime:(NSString *)startTime endTime:(NSString *)endTime;

/**
 今天的日期
 */
+ (NSString *)getTodayDateWithFormatter:(NSString *)formatter;

/**
 比较两个日期哪个在前
 */
+ (int)compareOneDay:(NSString *)oneDay withAnotherDay:(NSString *)anotherDay;



@end

NS_ASSUME_NONNULL_END
