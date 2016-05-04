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
    
    [self performSelector:@selector(hhh) withObject:nil afterDelay:2.0f];
}

- (void)hhh {
    [LCTipView showWithImage:nil title:nil buttonTitles:nil];
}

@end
