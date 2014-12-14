//
//  TableViewController.h
//  yangangguoji_test
//
//  Created by chengcheng on 14/11/28.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideViewController.h"
#import "Net.h"
#import "News.h"

@interface TableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate,NetDelegate>

{
	
	NSArray *newscatalogID;
	NSArray *newscatalog;
	NSString *newstitle;
}
@property (retain ,atomic) NSArray *newscatalogs;
@property (retain ,atomic) NSArray *newscatalogname;

@end
