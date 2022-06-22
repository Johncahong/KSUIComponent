//
//  UIButton+Extension.m
//  ButtonBlock
//
//  Created by keisun on 2018/3/20.
//  Copyright © 2018年 keisun. All rights reserved.
//

#import "UIButton+Extension.h"
#import <objc/runtime.h>

typedef void(^GH_ButtonEventsBlock)(void);

@interface UIButton ()

@property(nonatomic,copy)GH_ButtonEventsBlock gh_buttonEventsBlock;

@end

@implementation UIButton (Extension)

//这种写法下，gh_buttonEventsBlockKEY 与 &gh_buttonEventsBlockKEY地址都一样
static void *gh_buttonEventsBlockKEY = &gh_buttonEventsBlockKEY;

-(GH_ButtonEventsBlock)gh_buttonEventsBlock{
    return objc_getAssociatedObject(self, gh_buttonEventsBlockKEY);
}

-(void)setGh_buttonEventsBlock:(GH_ButtonEventsBlock)gh_buttonEventsBlock{
    objc_setAssociatedObject(self, gh_buttonEventsBlockKEY, gh_buttonEventsBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void)gh_addHandleEvent:(void(^)(void))block forControlEvents:(UIControlEvents)controlEvents{
    self.gh_buttonEventsBlock = block;
    [self addTarget:self action:@selector(buttonClicked) forControlEvents:controlEvents];
}

-(void)buttonClicked{
    !self.gh_buttonEventsBlock ?: self.gh_buttonEventsBlock();
    /*
     类似
     if (self.gh_buttonEventsBlock) {
        self.gh_buttonEventsBlock();
     }
     */
}

@end
