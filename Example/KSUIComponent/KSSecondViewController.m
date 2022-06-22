//
//  KSSecondViewController.m
//  KSUIComponent_Example
//
//  Created by Hello Cai on 2022/6/21.
//  Copyright © 2022 johncahong. All rights reserved.
//

#import "KSSecondViewController.h"
#import <KSUIComponent/KSLoadingView.h>

@interface KSSecondViewController ()

@end

@implementation KSSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 返回按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:backButton];
    backButton.frame = CGRectMake(0, 20, 80, 44);
    [backButton setTitle:@"返 回" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    // 加载按钮
    UIButton *dataBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:dataBtn];
    dataBtn.frame = CGRectMake(0, 20, 80, 44);
    dataBtn.center = CGPointMake(self.view.center.x, 200);
    [dataBtn setTitle:@"请求数据" forState:UIControlStateNormal];
    [dataBtn addTarget:self action:@selector(requestData:) forControlEvents:UIControlEventTouchUpInside];
}

/** 返回上一页按钮点击 */
- (void)backButtonClicked:(UIButton *)backButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)requestData:(UIButton *)button{
    [KSLoadingView showLoadingWithMessage:@"正在加载..."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [KSLoadingView dismiss];
    });
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    // 展示loading图
    [KSLoadingView showLoading];
//    [GHLoadingView showLoadingWithMessage:@"加载中..."];
    // 允许用户交互（默认不允许交互）
    [KSLoadingView enableUserInteraction:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [KSLoadingView dismiss];
    });
    
    // 或者
    //[GHLoadingView showLoadingWithEnableUserInteraction:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [KSLoadingView dismiss];
}

@end
