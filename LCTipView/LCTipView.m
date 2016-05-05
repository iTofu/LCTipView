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

#define LCColorRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface LCTipView ()

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UILabel     *titleLabel;
@property (nonatomic, weak) UIButton    *btn1;
@property (nonatomic, weak) UIButton    *btn2;
@property (nonatomic, weak) UIButton    *btn3;

/**
 *  Complete block
 */
@property (nonatomic, copy) LCTipViewCompleteBlock completeBlock;

@end

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
        UIImage *blurryImage            = [screenshot blurryGPUImageWithBlurLevel:1.0f];
        blurView.image                  = blurryImage;
        blurView.userInteractionEnabled = YES;
        [self addSubview:blurView];
        [blurView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        UIView *bgView             = [[UIView alloc] init];
        bgView.backgroundColor     = LCColorRGB(0xf9f9f9);
        bgView.layer.cornerRadius  = 8.0f;
        bgView.layer.masksToBounds = YES;
        [self addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(280.0f, 334.0f));
        }];
        
        // Image view
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode  = UIViewContentModeScaleAspectFit;
        [bgView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(bgView);
            make.top.equalTo(bgView).with.offset(50.0f);
            make.size.mas_equalTo(CGSizeMake(200.0f, 125.0f));
        }];
        self.imageView = imageView;
        
        // Btns
        UIView *btnBgView = [[UIView alloc] init];
        [bgView addSubview:btnBgView];
        [btnBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bgView).with.offset(26.0f);
            make.right.equalTo(bgView).with.offset(-26.0f);
            make.bottom.equalTo(bgView).with.offset(-14.0f);
            make.height.equalTo(@45.0f);
        }];
        
        UIButton *btn1       = [[UIButton alloc] init];
        btn1.titleLabel.font = [UIFont systemFontOfSize:17.0f];
        [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn1 setBackgroundImage:[UIImage imageNamed:@"login_btn_short"] forState:UIControlStateNormal];
        [btn1 addTarget:self action:@selector(btn1Clicked) forControlEvents:UIControlEventTouchUpInside];
        [btnBgView addSubview:btn1];
        [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(btnBgView);
        }];
        self.btn1 = btn1;

        UIButton *btn2       = [[UIButton alloc] init];
        btn2.titleLabel.font = [UIFont systemFontOfSize:17.0f];
        [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn2 setBackgroundImage:[UIImage imageNamed:@"login_btn_short_2"] forState:UIControlStateNormal];
        [btn2 addTarget:self action:@selector(btn2Clicked) forControlEvents:UIControlEventTouchUpInside];
        [btnBgView addSubview:btn2];
        self.btn2 = btn2;

        UIButton *btn3       = [[UIButton alloc] init];
        btn3.titleLabel.font = [UIFont systemFontOfSize:17.0f];
        [btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn3 setBackgroundImage:[UIImage imageNamed:@"login_btn_short_2"] forState:UIControlStateNormal];
        [btn3 addTarget:self action:@selector(btn3Clicked) forControlEvents:UIControlEventTouchUpInside];
        [btnBgView addSubview:btn3];
        self.btn3 = btn3;
        
        [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(btnBgView);
            make.right.equalTo(btn3.mas_left).offset(-20.0f);
            make.width.equalTo(btn3);
        }];
        [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.equalTo(btnBgView);
            make.left.equalTo(btn2.mas_right).offset(20.0f);
            make.width.equalTo(btn2);
        }];
        
        
        // Title
        UILabel *titleLabel      = [[UILabel alloc] init];
        titleLabel.font          = [UIFont systemFontOfSize:16.0f];
        titleLabel.textColor     = LCColorRGB(0x666666);
        titleLabel.numberOfLines = 0;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [bgView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imageView.mas_bottom).with.offset(20.0f);
            make.left.equalTo(bgView).with.offset(26.0f);
            make.right.equalTo(bgView).with.offset(-26.0f);
            make.bottom.equalTo(btnBgView.mas_top).with.offset(-20.0f);
        }];
        self.titleLabel = titleLabel;
    }
    return self;
}

- (void)btn1Clicked {
    [self hide];
    
    if (self.completeBlock) {
        self.completeBlock(0);
    }
}

- (void)btn2Clicked {
    [self hide];
    
    if (self.completeBlock) {
        self.completeBlock(0);
    }
}

- (void)btn3Clicked {
    [self hide];
    
    if (self.completeBlock) {
        self.completeBlock(1);
    }
}

+ (void)showWithImage:(UIImage *)image title:(NSString *)title buttonTitles:(NSArray *)buttonTitles complete:(LCTipViewCompleteBlock)completeBlock {
    LCTipView *tipView    = [LCTipView shared];
    tipView.image         = image;
    tipView.title         = title;
    tipView.buttonTitles  = buttonTitles;
    tipView.completeBlock = completeBlock;
    
    tipView.imageView.image = tipView.image;
    tipView.titleLabel.text = tipView.title;
    if (buttonTitles.count == 1) {
        tipView.btn1.hidden = NO;
        tipView.btn2.hidden = YES;
        tipView.btn3.hidden = YES;
        
        [tipView.btn1 setTitle:buttonTitles[0] forState:UIControlStateNormal];
    } else if (buttonTitles.count == 2) {
        tipView.btn1.hidden = YES;
        tipView.btn2.hidden = NO;
        tipView.btn3.hidden = NO;
        
        [tipView.btn2 setTitle:buttonTitles[0] forState:UIControlStateNormal];
        [tipView.btn3 setTitle:buttonTitles[1] forState:UIControlStateNormal];
    }
    
    tipView.hidden = NO;
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:tipView];
    [tipView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(keyWindow);
    }];
}

+ (void)hide {
    LCTipView *tipView = [LCTipView shared];
    [tipView hide];
}

- (void)hide {
    self.hidden = YES;
}

@end
