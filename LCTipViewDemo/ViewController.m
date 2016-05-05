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
        make.center.equalTo(self.view);
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

@end
