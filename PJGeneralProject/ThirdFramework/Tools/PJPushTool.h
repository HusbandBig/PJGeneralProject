//
//  PJPushTool.h
//  MemberShip
//
//  Created by 张佩金 on 2018/9/19.
//  Copyright © 2018年 unitedfitness. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PJPushTool : NSObject

/**
 push到相应的控制器
 */
+ (void)runtimePushViewController:(NSString *)vcName parameterDictionary:(NSDictionary *)parameterDic navigationController:(UINavigationController *)naC;


@end
