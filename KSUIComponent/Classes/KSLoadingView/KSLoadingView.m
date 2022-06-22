//
//  KSLoadingView.m
//  GHHUD
//
//  Created by keisun on 2018/12/19.
//  Copyright © 2018年 keisun. All rights reserved.
//

#import "KSLoadingView.h"
#import "Masonry.h"

@interface KSLoadingView ()
/** loading信息label */
@property(nonatomic,strong)UILabel *loadingInfoLabel;
@property(nonatomic,strong)UIImageView *loadingImageView;
@end;

@implementation KSLoadingView

static KSLoadingView *loadingView;

#pragma mark - loading图单例
/** loading图单例 */
+ (instancetype)sharedInstance {
    if (loadingView == nil) {
        loadingView = [[KSLoadingView alloc] init];
    }
    return loadingView;
}

#pragma mark - 构造方法
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.2];
        //------- loading imageView -------//
        UIImageView *loadingImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 45, 45)];
        [self addSubview:loadingImageView];
        loadingImageView.image = [self imageWithName:@"loading_00000.png"];
        _loadingImageView = loadingImageView;
        
        [loadingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self);
            make.size.mas_equalTo(CGSizeMake(45, 45));
        }];
        
        //------- 说明文本 -------//
        _loadingInfoLabel = [[UILabel alloc] init];
        [self addSubview:_loadingInfoLabel];
        _loadingInfoLabel.textAlignment = NSTextAlignmentCenter;
        _loadingInfoLabel.font = [UIFont systemFontOfSize:14];
        _loadingInfoLabel.textColor = [UIColor redColor];
        [_loadingInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(loadingImageView);
            make.top.mas_equalTo(loadingImageView.mas_bottom).mas_offset(15);
        }];
    }
    return self;
}

- (UIImage *)imageWithName:(NSString *)imageFileName {
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [currentBundle pathForResource:imageFileName ofType:nil inDirectory:@"KSLoadingView.bundle"];
    NSLog(@"---bundle:%@, path:%@", currentBundle, path);
    return [UIImage imageWithContentsOfFile:path];
}

//一张图片无限循环绕圈转
-(void)startAnimate{
    CAKeyframeAnimation *anim= [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    anim.duration = 0.7;
    anim.repeatCount = MAXFLOAT;
    NSMutableArray *arr = [NSMutableArray array];
    for (int i=0; i<5; i++) {
        [arr addObject:@(i/2.0*M_PI)];
    }
    anim.values = arr;
    [self.loadingImageView.layer addAnimation:anim forKey:@"rotation"];
}

#pragma mark - 赋值loading说明信息
/** 赋值loading说明信息 */
- (void)setLoadingInfo:(NSString *)loadingInfo{
    _loadingInfo = loadingInfo;
    _loadingInfoLabel.text = _loadingInfo;
}





#pragma mark - 展示loading图
/** 展示loading图 */
+ (void)showLoading {
    [self showLoadingWithMessage:nil];
}

#pragma mark - 展示带说明信息的loading图
/**
 带说明信息loading图
 
 @param message 说明信息
 */
+ (void)showLoadingWithMessage:(NSString *)message {
    UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
    [window addSubview:[KSLoadingView sharedInstance]];
    [KSLoadingView sharedInstance].loadingInfo = message;
    // KSLoadingView的frame大小和window一样
    [[KSLoadingView sharedInstance] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [[KSLoadingView sharedInstance] startAnimate];
}

#pragma mark - 移除loading图
/** 移除loading图 */
+ (void)dismiss {
    [[KSLoadingView sharedInstance].loadingImageView.layer removeAnimationForKey:@"rotation"];
    [[KSLoadingView sharedInstance] removeFromSuperview];
}

#pragma mark - loading期间，允许或禁止用户交互
/**
 loading期间，允许或禁止用户交互
 
 @param isEnable YES:允许 NO:禁止
 */
+ (void)enableUserInteraction:(BOOL)isEnable {
    [KSLoadingView sharedInstance].userInteractionEnabled = !isEnable;
}

#pragma mark - 展示可控制用户交互的loading图
/**
 展示可控制用户交互的loading图
 
 @param isEnable 是否允许用户交互
 */
+ (void)showLoadingWithEnableUserInteraction:(BOOL)isEnable {
    [self showLoading];
    [self enableUserInteraction:isEnable];
}

#pragma mark - 展示可控制用户交互并且带说明信息的loading图
/**
 展示可控制用户交互并且带说明信息的loading图
 
 @param message 说明信息
 @param isEnable 是否允许用户交互
 */
+ (void)showLoadingWithMessage:(NSString *)message enableUserInteraction:(BOOL)isEnable {
    [self showLoadingWithMessage:message];
    [self enableUserInteraction:isEnable];
}

@end
