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
#import "QuoteViewController.h"
#import "ConsultViewController.h"

// @Fixme correct MainViewController to XIEPINGJIA
@interface MainViewController ()

@end

// @Fixme correct MainViewController to XIEPINGJIA
@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
/**
 *  setup UISearchBar and UITableView
 *  add imageView in tableviewheader
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *LoginButton = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(clickLoginButton:)];
    UIBarButtonItem *RegButton = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(clickRegButton:)];
    UIBarButtonItem *BackButton = [[UIBarButtonItem alloc] init];
    BackButton.title = @"返回";
    LoginButton.tintColor = [UIColor whiteColor];
    RegButton.tintColor = [UIColor whiteColor];
    
    
    self.navigationItem.leftBarButtonItem = LoginButton;
    self.navigationItem.rightBarButtonItem = RegButton;
    self.navigationItem.backBarButtonItem = BackButton;
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.searchBarStyle = UISearchBarStyleDefault;
    searchBar.placeholder = @"在此键入";
    searchBar.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height+20, 320, 40);
    searchBar.delegate = self;

    UITableView *tableview = [[UITableView alloc] init];
    tableview.frame = CGRectMake(0, searchBar.frame.origin.y + searchBar.frame.size.height, 320, 400);
    tableview.delegate = self;
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    imageview.image = [UIImage imageNamed:@"SelectBack"];
    tableview.tableHeaderView = imageview;
    // key---UIImageView默认不参与交互
    imageview.userInteractionEnabled = YES;
    
    UIButton *quote = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *consult = [UIButton buttonWithType:UIButtonTypeCustom];
    quote.frame = CGRectMake(0, 0, 160, 80);
    consult.frame = CGRectMake(160, 0, 160, 80);
    
    
    //点击按钮push到另一个view的时候  图片会卡
    [quote addTarget:self action:@selector(clickQuoteButton:) forControlEvents:UIControlEventTouchUpInside];
    [consult addTarget:self action:@selector(clickConsultButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.view addSubview:searchBar];
    [self.view addSubview:tableview];
    [imageview addSubview:quote];
    [imageview addSubview:consult];
}


/**
 *  user UISearchBarDelegate to control CancelButton show or not
 *
 *  @param searchBar showsCancelButton
 */
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;
}
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    searchBar.showsCancelButton = NO;
    [self.view endEditing:YES];
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
    
    // @Fixme
    [self presentViewController:nav animated:YES completion:NULL];



}
- (void)clickRegButton:(id)sender
{
    RegViewController *RegView = [[RegViewController alloc] initWithNibName:@"RegViewController" bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:RegView];
    
    [self presentViewController:nav animated:YES completion:NULL];

}



- (void)clickQuoteButton:(id)sender
{
    QuoteViewController *quoteView = [[QuoteViewController alloc] init];
    
    [self.navigationController pushViewController:quoteView animated:YES];
}

- (void)clickConsultButton:(id)sender
{
    ConsultViewController *consultView = [[ConsultViewController alloc] init];
    
    [self.navigationController pushViewController:consultView animated:YES];
}




@end
