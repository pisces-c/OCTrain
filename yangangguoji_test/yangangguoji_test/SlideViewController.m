//
//  SlideViewController.m
//  yangangguoji_test
//
//  Created by chengcheng on 14/11/28.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import "SlideViewController.h"

@implementation SlideViewController

- (void)createbutton {
	_scrollbutton = [[UIScrollView alloc] init];
	_scrollbutton.frame = CGRectMake(0, 64, 1280, 44);
	_scrollbutton.backgroundColor = [UIColor redColor];
	_scrollbutton.contentOffset = CGPointMake(0, 0);
	_scrollbutton.contentSize = CGSizeMake(320, 44);
	_scrollbutton.scrollEnabled = YES;
	_scrollbutton.showsVerticalScrollIndicator = NO;
	_scrollbutton.showsHorizontalScrollIndicator = NO;
	
	
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
	
}
- (void)createimgview {
	_scrollimgview = [[UIScrollView alloc] init];
	_scrollimgview.frame = CGRectMake(0, 0, 1280, 160);
	_scrollimgview.backgroundColor = [UIColor blackColor];
	_scrollimgview.contentOffset = CGPointMake(0, 0);
	_scrollimgview.contentSize = CGSizeMake(320, 44);
	_scrollimgview.scrollEnabled = YES;
	_scrollimgview.showsVerticalScrollIndicator = NO;
	_scrollimgview.showsHorizontalScrollIndicator = NO;
	_page = [[UIPageControl alloc] init];
	_page.frame = CGRectMake(135, 100, 50, 45);
	
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	_page.currentPage = _scrollimgview.contentOffset.x/_scrollimgview.bounds.size.width;
}

@end
