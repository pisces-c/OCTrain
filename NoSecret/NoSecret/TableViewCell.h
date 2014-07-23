//
//  TableViewCell.h
//  NoSecret
//
//  Created by 成城 on 14-7-22.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *backgrandimg;
@property (strong, nonatomic) IBOutlet UITextField *textfield;
@property (strong, nonatomic) IBOutlet UIToolbar *toobar;

@end
