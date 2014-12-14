//
//  MainViewController.h
//  YGZX
//
//  Created by 成城 on 14-9-17.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftMenuViewController.h"
#import "RightMenuViewController.h"
#import "MMDrawerController.h"
#import "MMDrawerVisualState.h"
#import "ScrollViewController.h"

@interface MainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UIPageViewControllerDelegate>
{
	UITableView *tableview;
	UIScrollView *svbutton;
	UIScrollView *svimg;
	UIPageControl *pagectrl;
	NSMutableArray *imgarray;
}

@end
