//
//  LCTipView.h
//  LCTipViewDemo
//
//  Created by Leo on 16/5/4.
//  Copyright © 2016年 http://LeoDev.me. All rights reserved.
//
//  Mail: mailto:devtip@163.com
//  Blog: http://LeoDev.me
//
//  V 1.0.1
//  Project home page: https://github.com/iTofu/LCTipView

#import <UIKit/UIKit.h>

typedef void(^LCTipViewCompleteBlock)(NSInteger buttonIndex);

@interface LCTipView : UIView

/**
 *  Instance.
 *
 *  @return LCTipView instance
 */
+ (instancetype)shared;

/**
 *  Show the LCTipView instance with image, title and buttons.
 *
 *  @param image        image
 *  @param title        title
 *  @param buttonTitles buttonTitles
 */
/**
 *  Show the LCTipView instance with image, title and buttons.
 *
 *  @param image         image
 *  @param title         title
 *  @param buttonTitles  buttonTitles
 *  @param completeBlock completeBlock
 */
+ (void)showWithImage:(UIImage *)image
                title:(NSString *)title
         buttonTitles:(NSArray *)buttonTitles
             complete:(LCTipViewCompleteBlock)completeBlock;

/**
 *  Hide the LCTipView instance.
 */
+ (void)hide;

@end
