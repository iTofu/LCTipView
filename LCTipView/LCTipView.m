//
//  LCTipView.m
//  LCTipViewDemo
//
//  Created by Leo on 16/5/4.
//  Copyright © 2016年 http://LeoDev.me. All rights reserved.
//

#import "LCTipView.h"
#import "Masonry.h"
#import "UIView+LCTipView.h"
#import "UIImage+LCTipView.h"

@implementation LCTipView

+ (instancetype)shared {
    static LCTipView *tipView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tipView = [[LCTipView alloc] init];
    });
    return tipView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        
        UIImageView *blurView           = [[UIImageView alloc] init];
        UIImage *screenshot             = [keyWindow convertViewToImage];
        UIImage *blurryImage            = [screenshot blurryGPUImageWithBlurLevel:0.5f];
        blurView.image                  = blurryImage;
        blurView.userInteractionEnabled = YES;
        [keyWindow addSubview:blurView];
        [blurView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(keyWindow);
        }];
        
        UIView *bgView             = [[UIView alloc] init];
        bgView.backgroundColor     = [UIColor whiteColor];
        bgView.layer.cornerRadius  = 6.0f;
        bgView.layer.masksToBounds = YES;
        [keyWindow addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(keyWindow);
            make.size.mas_equalTo(CGSizeMake(280.0f, 334.0f));
        }];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        [self addSubview:imageView];
    }
    return self;
}

+ (void)showWithImage:(UIImage *)image title:(NSString *)title buttonTitles:(NSArray *)buttonTitles {
    LCTipView *tipView   = [LCTipView shared];
    tipView.image        = image;
    tipView.title        = title;
    tipView.buttonTitles = buttonTitles;
    
    
}

+ (void)hide {
    
}

@end
