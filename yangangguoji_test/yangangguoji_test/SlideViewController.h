//
//  SlideViewController.h
//  yangangguoji_test
//
//  Created by chengcheng on 14/11/28.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Net.h"

@interface SlideViewController : UIView<UIScrollViewDelegate>

@property (retain ,nonatomic) UIScrollView *scrollbutton;
@property (retain ,nonatomic) UIScrollView *scrollimgview;
@property (retain ,nonatomic) UIPageControl *page;

- (void)createbutton;
- (void)createimgview;
@end
