//
//  KSHub.m
//  KSHUD
//
//  Created by keisun on 2018/4/14.
//  Copyright © 2018年 keisun. All rights reserved.
//

#import "KSHub.h"
#import "Masonry.h"
#import <KSCategory/UIButton+Extension.h>

@implementation KSHub

/** 文本*/
+(void)showToastWithMessage:(NSString *)message{
    
    UIView *bgView = [[UIView alloc] init];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:bgView];
    bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.9];
    bgView.layer.cornerRadius = 5;
    
    UILabel *label = [[UILabel alloc] init];
    [bgView addSubview:label];
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.numberOfLines = 0;
    label.font = [UIFont boldSystemFontOfSize:15];
    label.textAlignment = NSTextAlignmentCenter;
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(180);
        make.center.mas_equalTo(bgView.superview);
    }];

    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(20, 20, 20, 20));
    }];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.5 animations:^{
            bgView.alpha = 0;
        } completion:^(BOOL finished) {
            [bgView removeFromSuperview];
        }];
    });
}

/** 自定义Alert*/
//总结masonry用法：上下左右相对父视图直接用offSet, 其余用mas_equalTo
+(void)showTitle:(NSString *)title message:(NSString *)message okBlock:(void(^)(void))block{
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    [window addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    //特效
    UIView *contentView = [[UIView alloc] init];
    [bgView addSubview:contentView];
    
//    contentView.transform = CGAffineTransformScale(contentView.transform, 1.4, 1.4);
//    [UIView animateWithDuration:0.2 animations:^{
//        contentView.transform = CGAffineTransformIdentity;
//    }];
    
    //另一种写法
    bgView.alpha = 0.0;
    contentView.alpha = 0.0;
    contentView.layer.transform = CATransform3DMakeScale(1.2f, 1.2f, 1.2f);
    [UIView animateWithDuration:0.3 animations:^{
        contentView.layer.transform = CATransform3DIdentity;
        contentView.alpha = 1.0;
        bgView.alpha = 1.0;
    } completion:^(BOOL finished) {
    }];
    
    contentView.layer.cornerRadius = 5;
    contentView.clipsToBounds = YES;
    contentView.backgroundColor = [UIColor whiteColor];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(255);
        make.center.mas_equalTo(bgView);
    }];
    
    UILabel *titleLab = [[UILabel alloc] init];
    [contentView addSubview:titleLab];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.text = title;
    titleLab.font = [UIFont systemFontOfSize:20];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.left.right.offset(0);
        make.height.mas_equalTo(17);
    }];
    
    UILabel *messageLab = [[UILabel alloc] init];
    [contentView addSubview:messageLab];
    messageLab.numberOfLines = 0;
    messageLab.font = [UIFont systemFontOfSize:15];
    messageLab.text = message;
    [messageLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLab.mas_bottom).offset(15);
        make.left.offset(30);
        make.right.offset(-30);
    }];
    
    //取消按钮
    UIButton *cancelBtn = [[UIButton alloc] init];
    [contentView addSubview:cancelBtn];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelBtn gh_addHandleEvent:^{
        [UIView animateWithDuration:0.25 animations:^{
            bgView.alpha = 0;
        } completion:^(BOOL finished) {
            [bgView removeFromSuperview];
        }];
        
    } forControlEvents:UIControlEventTouchDown];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(messageLab.mas_bottom).offset(15);
        make.left.bottom.offset(0);
        make.height.mas_equalTo(40);
    }];
    
    UIButton *okBtn = [[UIButton alloc] init];
    [contentView addSubview:okBtn];
    [okBtn setTitle:@"确定" forState:UIControlStateNormal];
    [okBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [okBtn gh_addHandleEvent:^{
        [bgView removeFromSuperview];
        if (block) {
            block();
        }
    } forControlEvents:UIControlEventTouchDown];
    [okBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(cancelBtn);
        make.left.mas_equalTo(cancelBtn.mas_right);
        make.right.offset(0);
        make.size.mas_equalTo(cancelBtn);
    }];
    
    //横向线
    UIView *crossView = [[UIView alloc] init];
    [contentView addSubview:crossView];
    crossView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
    [crossView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(contentView);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(cancelBtn);
    }];
    
    //竖向
    UIView *verticalView = [[UIView alloc] init];
    [contentView addSubview:verticalView];
    verticalView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
    [verticalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(cancelBtn);
        make.centerX.mas_equalTo(contentView);
        make.bottom.mas_equalTo(contentView);
    }];
}

@end
