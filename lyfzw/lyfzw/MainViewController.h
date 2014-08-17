//
//  mainViewController.h
//  lyfzw
//
//  Created by 成城 on 14-8-3.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "EGORefreshTableHeaderView.h"
#import "EGORefreshTableFooterView.h"

@interface MainViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,EGORefreshTableDelegate>
{
    NSDictionary *newDict;
    NSMutableArray *newsTitle;
    NSString *topnewsTitle;
    NSString *topnewsContent;
    NSMutableArray *newsContent;
    NSMutableArray *searchresult;
}




@end
