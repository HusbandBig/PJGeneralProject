//
//  NSDate+PJDateCaregory.m
//  PJCommonProduct
//
//  Created by 张佩金 on 2018/9/26.
//  Copyright © 2018年 张佩金. All rights reserved.
//

#import "NSDate+PJDateCaregory.h"

@implementation NSDate (PJDateCaregory)

#pragma mark - 将本地日期字符串转为UTC日期字符串 本地日期格式: 2017-07-04 07:53:51
+ (NSString *)getUTCFromLocalDateString:(NSString *)localDateString{
    
    if (localDateString.length == 0) {
        return @"";
    }
    //输入格式 本地时间
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    //本地时区
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    NSDate *localDateFormatted = [dateFormatter dateFromString:localDateString];
    
    //UTC时区
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    NSDate *utcDateFormatted = [dateFormatter dateFromString:[dateFormatter stringFromDate:localDateFormatted]];
    //输出格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS"];
    NSString *dateString = [dateFormatter stringFromDate:utcDateFormatted];
   
    return dateString;
}
+ (NSString *)getUTCFromLocalDate:(NSDate *)localDate{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    //输出格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS"];
    NSString *dateString = [dateFormatter stringFromDate:localDate];
    return dateString;
    
}

#pragma mark - 将UTC日期字符串转为本地时间字符串 输入的UTC日期格式: 2017-07-04T18:15:34.258
+ (NSString *)getLocalDateFromUTCDateString:(NSString *)utcDatetring{
    if (utcDatetring.length == 0) {
        return @"";
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    //输入格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    NSDate *date = [dateFormatter dateFromString:utcDatetring];
    if (date == nil) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS"];
        date = [dateFormatter dateFromString:utcDatetring];
        if (date == nil) {
            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
            date = [dateFormatter dateFromString:utcDatetring];
            if (date == nil) {
                [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
                date = [dateFormatter dateFromString:utcDatetring];
            }
        }
    }
    
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    //输出格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;

    
}
+ (NSString *)getLocalDateFromUTCDate:(NSDate *)utcDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    //输入格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    NSString *utcDateStr = [dateFormatter stringFromDate:utcDate];
    
    return [NSDate getLocalDateFromUTCDateString:utcDateStr];
}


#pragma mark - 计算两个日期相差的天数
+ (NSDictionary *)calculateDaysWithStartTime:(NSString *)startTime endTime:(NSString *)endTime{
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    
    //开始时间
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *startDate =[dateFormatter dateFromString:startTime];
    if (startDate == nil) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        startDate =[dateFormatter dateFromString:startTime];
        if (startDate == nil) {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH"];
            startDate =[dateFormatter dateFromString:startTime];
            if (startDate == nil) {
                [dateFormatter setDateFormat:@"yyyy-MM-dd"];
                startDate =[dateFormatter dateFromString:startTime];
                if (startDate == nil) {
                    [dateFormatter setDateFormat:@"yyyy-MM"];
                    startDate =[dateFormatter dateFromString:startTime];
                    if (startDate == nil) {
                        [dateFormatter setDateFormat:@"yyyy"];
                        startDate =[dateFormatter dateFromString:startTime];
                    }
                }
            }
        }
    }
    //结束时间
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *endDate = [dateFormatter dateFromString:endTime];
    if (endDate == nil) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        endDate =[dateFormatter dateFromString:endTime];
        if (endDate == nil) {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH"];
            endDate =[dateFormatter dateFromString:endTime];
            if (endDate == nil) {
                [dateFormatter setDateFormat:@"yyyy-MM-dd"];
                endDate =[dateFormatter dateFromString:endTime];
                if (endDate == nil) {
                    [dateFormatter setDateFormat:@"yyyy-MM"];
                    endDate =[dateFormatter dateFromString:endTime];
                    if (endDate == nil) {
                        [dateFormatter setDateFormat:@"yyyy"];
                        endDate =[dateFormatter dateFromString:endTime];
                    }
                }
            }
        }
    }
    
    NSTimeInterval start = [startDate timeIntervalSince1970]*1;
    NSTimeInterval end = [endDate timeIntervalSince1970]*1;
    NSTimeInterval value = end - start;
    
    int days = ((int)value)/(3600*24);
    int hours = ((int)value)%(3600*24)/3600;
    int minutes = ((int)value)%(3600*24)%3600/60;
    int seconds = ((int)value)%(3600*24)%3600%60;
    
    NSString *daysStr = @"0";
    NSString *hoursStr = @"0";;
    NSString *minutesStr = @"0";;
    NSString *secondsStr = @"0";;
    
    if (days != 0) {
        daysStr = [NSString stringWithFormat:@"%d",days];
    }
    if (hours != 0) {
        hoursStr = [NSString stringWithFormat:@"%d",hours];
    }
    if (minutes != 0) {
        minutesStr = [NSString stringWithFormat:@"%d",minutes];
    }
    if (seconds != 0) {
        secondsStr = [NSString stringWithFormat:@"%d",seconds];
    }
    
    NSDictionary *dic = @{
                          @"days":daysStr,
                          @"hours":hoursStr,
                          @"minutes":minutesStr,
                          @"seconds":secondsStr
                          };
    return dic;
}

#pragma mark - 获取当前时间
+ (NSString *)getTodayDateWithFormatter:(NSString *)formatter{
    
    NSDate *date = [NSDate date];
    NSDateFormatter *dateF = [[NSDateFormatter alloc] init];
    [dateF setDateFormat:formatter];
    [dateF setTimeZone:[NSTimeZone localTimeZone]];
    NSString *todayDate = [dateF stringFromDate:date];
    return todayDate;
}

#pragma mark - 比较两个日期哪个在前
+ (int)compareOneDay:(NSString *)oneDay withAnotherDay:(NSString *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    NSDate *date1 = [dateFormatter dateFromString:oneDay];
    if (date1 == nil) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        date1 =[dateFormatter dateFromString:oneDay];
        if (date1 == nil) {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH"];
            date1 =[dateFormatter dateFromString:oneDay];
            if (date1 == nil) {
                [dateFormatter setDateFormat:@"yyyy-MM-dd"];
                date1 =[dateFormatter dateFromString:oneDay];
                if (date1 == nil) {
                    [dateFormatter setDateFormat:@"yyyy-MM"];
                    date1 =[dateFormatter dateFromString:oneDay];
                    if (date1 == nil) {
                        [dateFormatter setDateFormat:@"yyyy"];
                        date1 =[dateFormatter dateFromString:oneDay];
                    }
                }
            }
        }
    }

    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date2 = [dateFormatter dateFromString:anotherDay];
    if (date2 == nil) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        date2 =[dateFormatter dateFromString:anotherDay];
        if (date2 == nil) {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH"];
            date2 =[dateFormatter dateFromString:anotherDay];
            if (date2 == nil) {
                [dateFormatter setDateFormat:@"yyyy-MM-dd"];
                date2 =[dateFormatter dateFromString:anotherDay];
                if (date2 == nil) {
                    [dateFormatter setDateFormat:@"yyyy-MM"];
                    date2 =[dateFormatter dateFromString:anotherDay];
                    if (date2 == nil) {
                        [dateFormatter setDateFormat:@"yyyy"];
                        date2 =[dateFormatter dateFromString:anotherDay];
                    }
                }
            }
        }
    }

    NSComparisonResult result = [date1 compare:date2];
    if (result == NSOrderedDescending) {
        //NSLog(@"Date1  is in the future");
        return 1;
    }else if (result == NSOrderedAscending){
        //NSLog(@"Date1 is in the past");
        return -1;
    }else{
        //NSLog(@"Both dates are the same");
        return 0;
    }
    
    
}
@end
