//
//  UIButton+Extension.h
//  ButtonBlock
//
//  Created by keisun on 2018/3/20.
//  Copyright © 2018年 keisun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

-(void)gh_addHandleEvent:(void(^)(void))block forControlEvents:(UIControlEvents)controlEvents;

@end
