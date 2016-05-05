# LCTipView

[![Travis](https://img.shields.io/travis/iTofu/LCTipView.svg?style=flat)](https://travis-ci.org/iTofu/LCTipView)
[![CocoaPods](https://img.shields.io/cocoapods/v/LCTipView.svg)](http://cocoadocs.org/docsets/LCTipView)
[![CocoaPods](https://img.shields.io/cocoapods/l/LCTipView.svg)](https://raw.githubusercontent.com/iTofu/LCTipView/master/LICENSE)
[![CocoaPods](https://img.shields.io/cocoapods/p/LCTipView.svg)](http://cocoadocs.org/docsets/LCTipView)
[![LeoDev](https://img.shields.io/badge/blog-LeoDev.me-brightgreen.svg)](http://leodev.me)

☀️ A lovely HUD ~

![LCTipView](https://raw.githubusercontent.com/iTofu/LCTipView/master/LCTipViewDemo.gif)

````
In me the tiger sniffs the rose.

心有猛虎，细嗅蔷薇。
````

Welcome to my blog: <http://LeoDev.me> ✨

[**中文介绍**](https://github.com/iTofu/LCTipView/blob/master/README-zh_CN.md)



## Introduction

Just a HUD, look cute~ ☺️

This project uses the [Masonry](https://github.com/SnapKit/Masonry) and [GPUImage](https://github.com/BradLarson/GPUImage).

If you like it, please give this project a star, thank you! ⭐️



## Installation

LCTipView is available on [CocoaPods](https://cocoapods.org/). Just add the following to your project Podfile:

````ruby
pod "LCTipView"  # Podfile
````

**Tip:** Ignore Xcode warnings when using [CocoaPods](https://cocoapods.org/):

````ruby
# ignore all warnings from all pods
inhibit_all_warnings!

# ignore warnings from a specific pod
pod 'GPUImage', :inhibit_warnings => true
````



## Non-CocoaPods Installation

Just drag the LCTipView folder into your project.



## Usage

* Use by including the following import:

  ````objc
  #import "LCTipView.h"
  ````

* Demo code:

  * Show

    ````objc
    [LCTipView showWithImage:[UIImage imageNamed:@"login_no_binding"]
                         title:@"你尚未绑定学校，请联系管理员添加"
                  buttonTitles:@[@"关闭"]
                      complete:^(NSInteger buttonIndex) {

                          NSLog(@"Clicked: %d", (int)buttonIndex);
                      }];
    ````

  * Hide

    ````objc
    [LCTipView hide];
    ````

* You could do some operations in the complete block.

  ````objc
  typedef void(^LCTipViewCompleteBlock)(NSInteger buttonIndex);
  ````


## Examples

* Origin view

  ![LCTipView](https://raw.githubusercontent.com/iTofu/LCTipView/master/LCTipViewDemo01.png)

* One button

  ![LCTipView](https://raw.githubusercontent.com/iTofu/LCTipView/master/LCTipViewDemo02.png)

* Two buttons

  ![LCTipView](https://raw.githubusercontent.com/iTofu/LCTipView/master/LCTipViewDemo03.png)

* No buttons, Disappears after 3 seconds (You could customize the time reference the Demo project)

  ![LCTipView](https://raw.githubusercontent.com/iTofu/LCTipView/master/LCTipViewDemo04.png)


## Release

### V 1.0.0

* First release.



## Thanks

* [Masonry](https://github.com/SnapKit/Masonry)

* [GPUImage](https://github.com/BradLarson/GPUImage)



## Support

* If you have any question, just [commit a issue](https://github.com/iTofu/LCTipView/issues/new)! Thx!

* Mail: devtip@163.com

* Blog: http://LeoDev.me



## License

[MIT License](http://opensource.org/licenses/MIT)
