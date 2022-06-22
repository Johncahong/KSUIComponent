//
//  KSViewController.m
//  KSUIComponent
//
//  Created by johncahong on 06/21/2022.
//  Copyright (c) 2022 johncahong. All rights reserved.
//

#import "KSViewController.h"
#import "KSSecondViewController.h"
#import <KSUIComponent/KSHub.h>

@interface KSViewController ()

@end

@implementation KSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 40)];
    [btn setTitle:@"文本Hub" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(textHubClick) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 100, 40)];
    [btn2 setTitle:@"弹Alert" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor redColor];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(showAlertClick) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(50, 250, 100, 40)];
    [btn3 setTitle:@"loading" forState:UIControlStateNormal];
    btn3.backgroundColor = [UIColor redColor];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(pushClick) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn3];
}

-(void)textHubClick{
    [self showToastMessage];
}

-(void)showAlertClick{
    [self showAlert];
}

-(void)pushClick{
    KSSecondViewController *secondVC = [[KSSecondViewController alloc] init];
    [self presentViewController:secondVC animated:YES completion:nil];
}


-(void)showToastMessage{
    [KSHub showToastWithMessage:@"这是一个文本toast,效果还行吧😁"];
}

-(void)showAlert{
    NSLog(@"弹出一个窗口");
    [KSHub showTitle:@"温馨提示" message:@"官方公布海南四大“新名片”：将建成全面深化改革开放试验区、国家生态文明试验区、国际旅游消费中心、国家重大战略服务保障区。" okBlock:^{
        [KSHub showToastWithMessage:@"你点击了确定"];
    }];
}

@end
