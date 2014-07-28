//
//  mainViewController.h
//  NoSecret
//
//  Created by 成城 on 14-7-23.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mainViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    NSArray *data;
}
@property (strong, nonatomic) UIButton *button1;
@property (strong, nonatomic) UIButton *button2;
@property (strong, nonatomic) UIButton *button3;
@property (strong, nonatomic) UIButton *button4;
@end
