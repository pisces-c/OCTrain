//
//  RegViewController.m
//  lyfzw
//
//  Created by 成城 on 14-8-3.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import "RegViewController.h"

@interface RegViewController ()

@end

@implementation RegViewController

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
    UIBarButtonItem *BackButton = [[UIBarButtonItem alloc] initWithTitle:@"返回"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(clickBackButton:)];
    self.navigationItem.leftBarButtonItem = BackButton;
    
    
    _password.delegate = self;
    _phoneNum.delegate = self;
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    //返回一个BOOL值，指定是否循序文本字段开始编辑
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    //开始编辑时触发，文本字段将成为first responder
    [UIView setAnimationDuration:0.5f];
    [UIView beginAnimations:@"animationID" context:nil];
    int offsize = _finishbutton.frame.origin.y + _finishbutton.frame.size.height + 216.0 - self.view.frame.size.height;
    if (offsize > 0) {
        self.view.frame = CGRectMake(0, -offsize, self.view.frame.size.width, self.view.frame.size.height);
    }
    [UIView commitAnimations];
}

//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
//{
    //返回BOOL值，指定是否允许文本字段结束编辑，当编辑结束，文本字段会让出first responder
    //要想在用户结束编辑时阻止文本字段消失，可以返回NO
    //这对一些文本字段必须始终保持活跃状态的程序很有用，比如即时消息
//    return NO;
//}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //返回一个BOOL值，指明是否允许在按下回车键时结束编辑
    [UIView setAnimationDuration:0.5f];
    [UIView beginAnimations:@"animationID" context:nil];
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [_phoneNum resignFirstResponder];
    [_password resignFirstResponder];
    return YES;
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

- (void)clickBackButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
