//
//  PJPushTool.m
//  MemberShip
//
//  Created by 张佩金 on 2018/9/19.
//  Copyright © 2018年 unitedfitness. All rights reserved.
//

#import "PJPushTool.h"
#import <objc/runtime.h>

@implementation PJPushTool

#pragma mark - push到相应的控制器
+ (void)runtimePushViewController:(NSString *)vcName parameterDictionary:(NSDictionary *)parameterDic navigationController:(UINavigationController *)naC{
    //类名(对象名)
    
    NSString *class = vcName;
    const char *className = [class cStringUsingEncoding:NSASCIIStringEncoding];
    Class newClass = objc_getClass(className);
    
    if (!newClass) {
        //创建一个类
        Class superClass = [UIViewController class];
        newClass = objc_allocateClassPair(superClass, className, 0);
        //注册你创建的这个类
        objc_registerClassPair(newClass);
        
        return;
    }
    // 创建对象(写到这里已经可以进行随机页面跳转了)
    id instance = [[newClass alloc] init];
 
    
    
    // 两种方法传值
    
    
    //1 这个传值是知道属性名字才行
    [parameterDic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([self checkIsExistPropertyWithInstance:instance verifyPropertyName:key]) {//要push的controller含有这个属性
            //kvc给属性赋值
            [instance setValue:obj forKey:key];
        }
    }];
    
    
    //2 这个传值是不知道属性名字然后顺序赋值
//    NSMutableArray *keys = [NSMutableArray array];
//    [parameterDic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
//        [keys addObject:key];
//    }];
//    [self setValueWithWithInstance:instance dataDictionary:parameterDic keyArray:[keys copy]];
    
    
    ((UIViewController *)instance).hidesBottomBarWhenPushed = YES;
    [naC pushViewController:instance animated:YES];
    
}


#pragma mark - 检测对象是否存在该属性
+ (BOOL)checkIsExistPropertyWithInstance:(id)instance verifyPropertyName:(NSString *)verifyPropertyName
{
    
    unsigned int outCount, i;
    // 获取对象里的属性列表
    objc_property_t * properties = class_copyPropertyList([instance
                                                           class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property =properties[i];
        //  属性名转成字符串
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        // 判断该属性是否存在
        if ([propertyName isEqualToString:verifyPropertyName]) {
            free(properties);
            return YES;
        }
    }
    free(properties);
    
    // 再遍历父类中的属性
    Class superClass = class_getSuperclass([instance class]);
    
    //通过下面的方法获取属性列表
    unsigned int outCount2;
    objc_property_t *properties2 = class_copyPropertyList(superClass, &outCount2);
    
    for (int i = 0 ; i < outCount2; i++) {
        objc_property_t property2 = properties2[i];
        //  属性名转成字符串
        NSString *propertyName2 = [[NSString alloc] initWithCString:property_getName(property2) encoding:NSUTF8StringEncoding];
        // 判断该属性是否存在
        if ([propertyName2 isEqualToString:verifyPropertyName]) {
            free(properties2);
            return YES;
        }
    }
    free(properties2); //释放数组
    
    return NO;
}



#pragma mark - 顺序赋值
+ (void)setValueWithWithInstance:(id)instance dataDictionary:(NSDictionary *)dic keyArray:(NSArray *)keys{
    
    unsigned int methodCount = 0;
    Ivar * ivars = class_copyIvarList([instance class], &methodCount);
    for (unsigned int i = 0; i < keys.count; i ++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        const char * type = ivar_getTypeEncoding(ivar);
        
        NSString *propertyName = [NSString stringWithUTF8String:name];
        NSString *propertyType = [NSString stringWithUTF8String:type];
        if ([propertyType containsString:@"NSString"]) {
            [instance setValue:dic[keys[i]] forKey:propertyName];
        }
    }
    
    free(ivars);
    
}


@end
