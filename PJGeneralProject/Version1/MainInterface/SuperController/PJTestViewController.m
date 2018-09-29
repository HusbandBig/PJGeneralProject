//
//  UFTestViewController.m
//  MemberShip
//
//  Created by 张佩金 on 2017/7/24.
//  Copyright © 2017年 unitedfitness. All rights reserved.
//

#import "PJTestViewController.h"

@interface PJTestViewController ()

@end

@implementation PJTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0.5*[UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:25];
    label.text = @"暂无数据...";
    label.textColor = [UIColor lightGrayColor];
    [self.view addSubview:label];
}

@end
