//
//  QuoteViewController.h
//  lyfzw
//
//  Created by 成城 on 14-8-7.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuoteViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *newCatID;
    NSMutableArray *newsCatName;
    NSMutableArray *newTitle;
    NSMutableArray *newsID;
    NSMutableArray *newsContent;
    UITableView *quoteTable;
    UIActivityIndicatorView *waitload;
}
@end
