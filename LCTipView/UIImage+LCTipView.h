//
//  UIImage+LCTipView.h
//  LCTipViewDemo
//
//  Created by Leo on 16/5/4.
//  Copyright © 2016年 http://LeoDev.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LCTipView)

/**
 *  Make a blurry image.
 *
 *  @param blur  blur level
 *
 *  @return blurry image
 */
- (UIImage *)blurryGPUImageWithBlurLevel:(CGFloat)blur;

@end
