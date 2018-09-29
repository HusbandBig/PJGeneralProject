//
//  AppGlobalData.h
//  PJCommonProduct
//
//  Created by 张佩金 on 2018/9/26.
//  Copyright © 2018年 张佩金. All rights reserved.
//

#ifndef AppGlobalData_h
#define AppGlobalData_h

#import "AppDelegate.h"
#import "UserCenter.h"

/**屏幕的宽*/
#define kMainScreen_width [UIScreen mainScreen].bounds.size.width
/**屏幕的高*/
#define kMainScreen_height [UIScreen mainScreen].bounds.size.height

/**keyWindow*/
#define kMainWindow [UIApplication sharedApplication].keyWindow
/**kAppDelegate*/
#define kAppDelegate [AppDelegate shareInstance]

/**key-value*/
#define kUserDefaults [NSUserDefaults standardUserDefaults]
/**通知中心*/
#define kNotificationCenter [NSNotificationCenter defaultCenter]

/**document路径*/
#define kDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
/**temp路径*/
#define kTempPath NSTemporaryDirectory()
/**cache路径*/
#define kCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
/**Home文件夹路径*/
#define kHomeDirectory NSHomeDirectory


/**打印 NSLog*/
#ifdef DEBUG
#define PJLog(...) NSLog(@"\n=========== 打印信息 ==========\n文件：%@\n方法：%s\n行数：%d\n打印：%@\n\n\n",[[[NSString stringWithFormat:@"%s",__FILE__] componentsSeparatedByString:@"/"] lastObject],__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define PJLog(...) 
#endif


/**RGB颜色 PJColor(120,25,46,1)*/
#define PJColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

#define IS_IPHONE_X ([UIScreen mainScreen].bounds.size.height == 812.0f) ? YES : NO


#endif /* AppGlobalData_h */
