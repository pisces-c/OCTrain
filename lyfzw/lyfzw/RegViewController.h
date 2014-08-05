//
//  RegViewController.h
//  lyfzw
//
//  Created by 成城 on 14-8-3.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *phoneNum;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *finishbutton;

@end
