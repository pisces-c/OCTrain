//
//  LoginViewController.m
//  lyfzw
//
//  Created by 成城 on 14-8-4.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *FinishButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(clickFinishButton:)];
    self.navigationItem.leftBarButtonItem = FinishButton;
    
    UIImageView *phoneimg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"User_account_icon@2x.png"]];
    [phoneimg setFrame:CGRectMake(10, 10, 10, 10)];
//    [phoneimg drawRect:CGRectMake(10, 10, 10, 10)];
    _phonenumber.leftView = phoneimg;
    _phonenumber.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *psdimg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Pass_Word_Icon@2x.png"]];
    [psdimg setFrame:CGRectMake(10, 10, 10, 10)];
    _password.leftView = psdimg;
    _password.leftViewMode = UITextFieldViewModeAlways;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickFinishButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
