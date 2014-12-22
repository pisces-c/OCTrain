//
//  Views.h
//  YGZX_NEW
//
//  Created by chengcheng on 14/12/16.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Net.h"
#import "HttpManager.h"

@interface Views : UIView <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate, NetDelegate>
{
	UIScrollView *scrollView;
	UIScrollView *buttonView;
	UIScrollView *imageView;
	UITableView *newsList;
	UIWebView *newsDetail;
	UIBarButtonItem *backBar;
	Net *net;
	HttpManager *httpmanager;
	
	NSArray *buttonName;
	NSArray *catalogs;
	NSArray *catalogID;
	NSArray *news;
	NSArray *newsID;
	NSArray *newsTitle;
	NSArray *newsContent;
	
}
-(void)refreshtablelist;
-(void)presentViews;
@end
