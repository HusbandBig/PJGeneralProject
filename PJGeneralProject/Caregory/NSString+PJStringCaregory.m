//
//  NSString+PJStringCaregory.m
//  PJCommonProduct
//
//  Created by 张佩金 on 2018/9/26.
//  Copyright © 2018年 张佩金. All rights reserved.
//

#import "NSString+PJStringCaregory.h"

@implementation NSString (PJStringCaregory)

#pragma mark - 正则匹配电话号码
+ (BOOL)valiMobileNumber:(NSString *)mobileNumber{
    
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mobileNumber.length != 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobileNumber];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobileNumber];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobileNumber];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
}

#pragma mark - 正则匹配邮箱
+ (BOOL)isValidEmail:(NSString *)emailAddress{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTestPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [emailTestPredicate evaluateWithObject:emailAddress];
}

#pragma mark - 正则匹配URL地址
+ (BOOL)isValidURL:(NSString *)urlAddress{
    NSString *regex =@"[a-zA-z]+://[^\\s]*";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [urlTest evaluateWithObject:urlAddress];
}

#pragma mark - 判断字符串是否以某个字符串开头
- (BOOL)isBeginWithThisString:(NSString *)string{
    return ([self hasPrefix:string]) ? YES : NO;
}

#pragma mark - 判断字符串是否以某个字符串结尾
- (BOOL)isEndWithThisString:(NSString *)string{
    return ([self hasSuffix:string]) ? YES : NO;
}

#pragma mark - 新字符串替换老字符串
- (NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar{
    return  [self stringByReplacingOccurrencesOfString:olderChar withString:newerChar];
}

#pragma mark - 截取字符串（字符串都是从第0个字符开始数的哦~）
- (NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end{
    NSRange r;
    r.location = begin;
    r.length = end - begin;
    return [self substringWithRange:r];
}

#pragma mark - 添加字符串
- (NSString *)addString:(NSString *)string{
    
    if(!string || string.length == 0)
        return self;
    
    return [self stringByAppendingString:string];
}

#pragma mark - 从主字符串中移除某个字符串
- (NSString *)removeSubString:(NSString *)subString
{
    if ([self containsString:subString])
    {
        NSRange range = [self rangeOfString:subString];
        return  [self stringByReplacingCharactersInRange:range withString:@""];
    }
    return self;
}

#pragma mark - 去掉字符串中的空格
- (NSString *)removeWhiteSpacesFromString{
    
    NSString *trimmedString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmedString;
}


#pragma mark - 判断字符串是否只包含数字和字母
- (BOOL)containsOnlyNumbersAndLetters{
    
    NSCharacterSet *numAndLetterCharSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:numAndLetterCharSet].location == NSNotFound);
}

#pragma mark - 判断数组中是否包含某个字符串
- (BOOL)isInThisArray:(NSArray*)array{
    for(NSString *string in array) {
        if([self isEqualToString:string]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - 字符串转Data
- (NSData *)convertToData{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

#pragma mark - Data转字符串
+ (NSString *)getStringFromData:(NSData *)data{
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

#pragma mark - 获取系统版本号
+ (NSString *)getMyApplicationVersion{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *shortVersion = [info objectForKey:@"CFBundleShortVersionString"];
    return [NSString stringWithFormat:@"%@", shortVersion];
}

#pragma mark - 计算属性字符文本占用的宽高
+ (CGSize)calculateSizeWithString:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize lineSpacing:(CGFloat)lineSpacing{
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    NSDictionary *dict = @{NSFontAttributeName: font,
                           NSParagraphStyleAttributeName: paragraphStyle};
    CGSize size = [string boundingRectWithSize:maxSize // 用于计算文本绘制时占据的矩形块
                                          options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading // 文本绘制时的附加选项
                                       attributes:dict        // 文字的属性
                                          context:nil].size; // context上下文。包括一些信息，例如如何调整字间距以及缩放。该对象包含的信息将用于文本绘制。该参数可为nil
    return size;
}





@end
