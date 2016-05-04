//
//  UIImage+LCTipView.m
//  LCTipViewDemo
//
//  Created by Leo on 16/5/4.
//  Copyright © 2016年 http://LeoDev.me. All rights reserved.
//

#import "UIImage+LCTipView.h"
#import "GPUImageFastBlurFilter.h"

@implementation UIImage (LCTipView)

- (UIImage *)blurryGPUImageWithBlurLevel:(CGFloat)blur {
    GPUImageFastBlurFilter *blurFilter = [[GPUImageFastBlurFilter alloc] init];
    blurFilter.blurSize                = blur;
    UIImage *newImage                  = [blurFilter imageByFilteringImage:self];
    return newImage;
}

@end
