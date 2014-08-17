//
//  SearchResultViewController.h
//  lyfzw
//
//  Created by 成城 on 14-8-17.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong ,nonatomic) NSMutableArray *result;
@end
