//
//  mainViewController.m
//  lyfzw
//
//  Created by 成城 on 14-8-3.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import "MainViewController.h"
#import "LoginViewController.h"
#import "RegViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

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
    // Do any additional setup after loading the view.
    //1、两个按钮（登录、注册）
    UIBarButtonItem *LoginButton = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(clickLoginButton:)];
    UIBarButtonItem *RegButton = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(clickRegButton:)];
    UIBarButtonItem *BackButton = [[UIBarButtonItem alloc] init];
    BackButton.title = @"返回";
    
    self.navigationItem.leftBarButtonItem = LoginButton;
    self.navigationItem.rightBarButtonItem = RegButton;
    self.navigationItem.backBarButtonItem = BackButton;
    

    //2、添加搜索框
    //3、添加UITableView
//    UITableView *tableview = [[UITableView alloc] init];
    
    
    
    
//    [self.view addSubview:tableview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickLoginButton:(id)sender
{
    LoginViewController *LoginView = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LoginView];
    
    [self presentViewController:nav animated:YES completion:NULL];



}
- (void)clickRegButton:(id)sender
{
    RegViewController *RegView = [[RegViewController alloc] initWithNibName:@"RegViewController" bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:RegView];
    
    [self presentViewController:nav animated:YES completion:NULL];

}

@end
