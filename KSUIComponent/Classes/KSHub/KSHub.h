//
//  KSHub.h
//  KSHUD
//
//  Created by keisun on 2018/4/14.
//  Copyright © 2018年 keisun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSHub : UIView
/** 文本*/
+(void)showToastWithMessage:(NSString *)message;
/** 自定义Alert*/
+(void)showTitle:(NSString *)title message:(NSString *)message okBlock:(void(^)(void))block;
@end
