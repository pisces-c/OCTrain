//
//  ViewController.h
//  yangangguoji_test
//
//  Created by chengcheng on 14/11/28.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftViewController.h"
#import "RightViewController.h"
#import "TableViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import "Net.h"

@interface ViewController : UIViewController <NetDelegate>
{
	NSArray *newscatalogID;
	NSArray *newscatalog;
}

@end

