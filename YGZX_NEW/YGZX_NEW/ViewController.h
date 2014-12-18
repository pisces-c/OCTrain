//
//  ViewController.h
//  YGZX_NEW
//
//  Created by chengcheng on 14/12/16.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Views.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import "Net.h"

@interface ViewController : UIViewController <NetDelegate>
{
	Views *ygViews;
	Net *net;
	NSArray *buttonName;
	NSArray *catalogs;
	NSArray *catalogID;
	NSArray *newsID;
	NSArray *newsTitle;
}

@end

