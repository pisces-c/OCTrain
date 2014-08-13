//
//  ConsultViewController.h
//  lyfzw
//
//  Created by 成城 on 14-8-7.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConsultViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *newsCat;
    NSMutableArray *newtitle_cat;
}
@end
