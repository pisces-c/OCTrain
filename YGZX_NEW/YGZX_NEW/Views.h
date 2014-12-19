//
//  Views.h
//  YGZX_NEW
//
//  Created by chengcheng on 14/12/16.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Net.h"
@interface Views : UIView <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate, NetDelegate>
{
	UIScrollView *scrollView;
	UIScrollView *buttonView;
	UIScrollView *imageView;
	UITableView *tableView;
	Net *net;
	
	NSArray *buttonName;
	NSArray *catalogs;
	NSArray *catalogID;
	NSArray *news;
	NSArray *newsID;
	NSArray *newsTitle;
	
}
-(void)refreshtablelist;
@end
