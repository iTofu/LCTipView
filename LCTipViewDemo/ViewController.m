//
//  ViewController.m
//  LCTipViewDemo
//
//  Created by Leo on 16/5/4.
//  Copyright © 2016年 http://LeoDev.me. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "LCTipView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"demo"];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn addTarget:self action:@selector(hhh) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(100);
        make.left.equalTo(self.view).with.offset(100);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn2 addTarget:self action:@selector(aaa) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(200);
        make.left.equalTo(self.view).with.offset(100);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn3 addTarget:self action:@selector(bbb) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(300);
        make.left.equalTo(self.view).with.offset(100);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    
//    [self performSelector:@selector(hhh) withObject:nil afterDelay:1.0f];
}

- (void)hhh {
    [LCTipView showWithImage:[UIImage imageNamed:@"login_no_binding"]
                       title:@"你尚未绑定学校，请联系管理员添加"
                buttonTitles:@[@"关闭"]
                    complete:^(NSInteger buttonIndex) {
                        
                        NSLog(@"Clicked: %d", (int)buttonIndex);
                    }];
}

- (void)aaa {
    [LCTipView showWithImage:[UIImage imageNamed:@"login_send_email"]
                       title:@"验证码已发送，请到邮箱查看"
                buttonTitles:@[@"取消", @"确定"]
                    complete:^(NSInteger buttonIndex) {
                        
                        NSLog(@"Clicked: %d", (int)buttonIndex);
                    }];
}

- (void)bbb {
    [LCTipView showWithImage:[UIImage imageNamed:@"login_send_email"]
                       title:@"3s 后就会消失的啦"
                buttonTitles:nil
                    complete:^(NSInteger buttonIndex) {
                        
                        NSLog(@"Clicked: %d", (int)buttonIndex);
                    }];
    
    [self performSelector:@selector(ccc) withObject:nil afterDelay:3.0f];
}

- (void)ccc {
    [LCTipView hide];
}

@end
