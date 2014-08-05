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
    
    
    _password.delegate = self;
    _phonenumber.delegate = self;

}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // When the user presses return, take focus away from the text field so that the keyboard is dismissed.
    [_phonenumber resignFirstResponder];
    [_password resignFirstResponder];
    [UIView setAnimationDuration:0.5f];
    [UIView beginAnimations:@"animationID" context:nil];
    self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = _finishbutton.frame;
    int offset = frame.origin.y + frame.size.height - (self.view.frame.size.height - 216.0);//键盘高度216
    [UIView beginAnimations:@"animationID" context:nil];
    [UIView setAnimationDuration:0.5f];
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    if(offset > 0)
    {
        CGRect rect = CGRectMake(0.0f, -offset,width,height);
        self.view.frame = rect;
    }
    [UIView commitAnimations];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView setAnimationDuration:0.5f];
    [UIView beginAnimations:@"animationID" context:nil];
    self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view endEditing:YES];
    [UIView commitAnimations];
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
