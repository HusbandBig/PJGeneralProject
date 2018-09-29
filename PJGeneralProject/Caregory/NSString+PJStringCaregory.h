//
//  NSString+PJStringCaregory.h
//  PJCommonProduct
//
//  Created by 张佩金 on 2018/9/26.
//  Copyright © 2018年 张佩金. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (PJStringCaregory)

/**
 正则匹配电话号码
 */
+ (BOOL)valiMobileNumber:(NSString *)mobileNumber;

/**
 正则匹配邮箱
 */
+ (BOOL)isValidEmail:(NSString *)emailAddress;

/**
 正则匹配URL地址
 */
+ (BOOL)isValidURL:(NSString *)urlAddress;

/**
 判断字符串是否以某个字符串开头
 */
- (BOOL)isBeginWithThisString:(NSString *)string;

/**
 判断字符串是否以某个字符串结尾
 */
- (BOOL)isEndWithThisString:(NSString *)string;

/**
 新字符串替换老字符串
 */
- (NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar;

/**
 截取字符串（字符串都是从第0个字符开始数的哦~）
 */
- (NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end;

/**
 添加字符串
 */
- (NSString *)addString:(NSString *)string;

/**
 从主字符串中移除某个字符串
 */
- (NSString *)removeSubString:(NSString *)subStrin;

/**
 去掉字符串中的空格
 */
- (NSString *)removeWhiteSpacesFromString;

/**
 判断字符串是否只包含数字和字母
 */
- (BOOL)containsOnlyNumbersAndLetters;

/**
 判断数组中是否包含某个字符串
 */
- (BOOL)isInThisArray:(NSArray*)array;

/**
 字符串转Data
 */
- (NSData *)convertToData;

/**
 Data转字符串
 */
+ (NSString *)getStringFromData:(NSData *)data;

/**
 获取系统版本号
 */
+ (NSString *)getMyApplicationVersion;

/**
 计算属性字符文本占用的宽高
 */
+ (CGSize)calculateSizeWithString:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize lineSpacing:(CGFloat)lineSpacing;


@end

NS_ASSUME_NONNULL_END
