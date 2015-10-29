//
//  ViewController.m
//  WaterView
//
//  Created by MyMac on 15/10/29.
//  Copyright © 2015年 MyMac. All rights reserved.
//

#import "ViewController.h"
#import "WaterView.h"

@interface ViewController ()

@property (nonatomic,strong) WaterView *waterView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.waterView];
    
}


- (WaterView *)waterView{
    if (!_waterView) {
        _waterView = [[WaterView alloc] init];
        self.waterView.frame = CGRectMake(10, 10, 200, 200);
        _waterView.backgroundColor = [UIColor redColor];//页面背景颜色改背景
        _waterView.currentWaterColor = [UIColor blueColor];//水波颜色
        _waterView.percentNum = 0.6f;
    }
    return _waterView;
}

@end
