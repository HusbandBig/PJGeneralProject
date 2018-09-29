//
//  UFTabBarController.m
//  MemberShip
//
//  Created by 张佩金 on 2017/6/23.
//  Copyright © 2017年 unitedfitness. All rights reserved.
//

#import "PJTabBarController.h"
//自定义导航控制器


@interface PJTabBarController ()

@end

@implementation PJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSDictionary *normalTextAttributes = @{
                                           NSFontAttributeName:[UIFont systemFontOfSize:10],
                                           NSForegroundColorAttributeName:[UIColor blackColor]
                                           };
    [[UITabBarItem appearance] setTitleTextAttributes:normalTextAttributes forState:UIControlStateNormal];
    
    
    NSDictionary *selectedTextAttributes = @{
                                             NSFontAttributeName:[UIFont systemFontOfSize:10],
                                             NSForegroundColorAttributeName:[UIColor colorWithRed:213.0/255 green:62.0/255 blue:64.0/255 alpha:1]
                                             };
    [[UITabBarItem appearance] setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];
    
    
    
     //初始化界面
     
  
}




@end
