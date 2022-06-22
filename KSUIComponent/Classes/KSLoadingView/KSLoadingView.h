//
//  KSLoadingView.h
//  GHHUD
//
//  Created by keisun on 2018/12/19.
//  Copyright © 2018年 keisun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSLoadingView : UIView

/** loading信息 */
@property (nonatomic, copy) NSString *loadingInfo;

/** loading图单例 */
+ (instancetype)sharedInstance;

/** 展示loading图 */
+ (void)showLoading;

/**
 带说明信息loading图
 @param message 说明信息
 */
+ (void)showLoadingWithMessage:(NSString *)message;

/** 移除loading图 */
+ (void)dismiss;

/**
 loading期间，允许或禁止用户交互
 @param isEnable YES:允许 NO:禁止
 */
+ (void)enableUserInteraction:(BOOL)isEnable;

/**
 展示可控制用户交互的loading图
 @param isEnable 是否允许用户交互
 */
+ (void)showLoadingWithEnableUserInteraction:(BOOL)isEnable;

/**
 展示可控制用户交互并且带说明信息的loading图
 @param message 说明信息
 @param isEnable 是否允许用户交互
 */
+ (void)showLoadingWithMessage:(NSString *)message enableUserInteraction:(BOOL)isEnable;

@end
