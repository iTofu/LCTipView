//
//  LCTipView.h
//  LCTipViewDemo
//
//  Created by Leo on 16/5/4.
//  Copyright © 2016年 http://LeoDev.me. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LCTipViewCompleteBlock)(NSInteger buttonIndex);

@interface LCTipView : UIView

/**
 *  Image
 */
@property (nonatomic, strong) UIImage *image;

/**
 *  Title
 */
@property (nonatomic, copy) NSString *title;

/**
 *  Button titles
 */
@property (nonatomic, strong) NSArray *buttonTitles;


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
