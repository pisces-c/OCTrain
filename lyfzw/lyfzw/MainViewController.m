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
#import "Model.h"

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

    
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    imageview.image = [UIImage imageNamed:@"SelectBack"];

    // key---UIImageView默认不参与交互
    imageview.userInteractionEnabled = YES;
    
    UIButton *quote = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *consult = [UIButton buttonWithType:UIButtonTypeCustom];
    quote.frame = CGRectMake(0, 0, 160, 80);
    consult.frame = CGRectMake(160, 0, 160, 80);
    
    
    [quote addTarget:self action:@selector(clickQuoteButton:) forControlEvents:UIControlEventTouchUpInside];
    [consult addTarget:self action:@selector(clickConsultButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIActivityIndicatorView *waitload = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    waitload.backgroundColor = [UIColor blackColor];
    waitload.alpha = 0.2;
    waitload.center = CGPointMake(self.view.center.x, self.view.center.y - 100);
    
    
    [imageview addSubview:quote];
    [imageview addSubview:consult];
    [self.view addSubview:waitload];
    
    
    UITableView *tableview = [[UITableView alloc] init];
    tableview.frame = CGRectMake(0, searchBar.frame.origin.y + searchBar.frame.size.height, 320, 400);
    tableview.tableHeaderView = imageview;
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:searchBar];
    [self.view addSubview:tableview];
    
    
    [waitload startAnimating];
    
    MKNetworkEngine *getnews = [[MKNetworkEngine alloc] initWithHostName:@"www.zglyfzw.com/webapp/api/" customHeaderFields:nil];
    MKNetworkOperation *op = [getnews operationWithPath:@"index.php?page_no=1" params:nil httpMethod:@"GET"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
//        NSLog(@"%@",[completedOperation responseJSON]);
        NSData *topnews = [completedOperation responseData];
        newsTitle = [[NSMutableArray alloc] init];
        
        // return type id
        id data = [NSJSONSerialization JSONObjectWithData:topnews options:NSJSONReadingMutableContainers error:nil];
        
        // if data is type NSDictionary
        if ([data isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary *dataDict = (NSDictionary *)data;
            
            // if return msg is ok.get msg
            NSString *message = [dataDict objectForKey:@"msg"];
            if (![message isEqualToString:@"ok"]) {
                return;
            }
            
            // get data
            NSDictionary *dataValue = dataDict[@"data"];
            
            // get all values of data
            NSArray *topnews = [dataValue objectForKey:@"topnews"];
            for (id topnewsDict in topnews) {
                if ([topnewsDict isKindOfClass:[NSDictionary class]]) {

                    topnewsTitle = [topnewsDict objectForKey:@"title"];
                    Model *model = [[Model alloc] initWithnewsTitle:topnewsTitle];
                    [newsTitle addObject:model];
//                    NSLog(@"%@",topnewsTitle);
                    
                }
            }
            NSArray *dataAllValues = [dataValue allValues];
            
            // for loop
            for (id valueDict in dataAllValues) {
                
                if ([valueDict isKindOfClass:[NSDictionary class]]) {
                    // get title
                    NSString *title = valueDict[@"title"];
                    if (title) {
//                        NSLog(@"%@", title);
                        Model *model = [[Model alloc] initWithnewsTitle:title];
                        [newsTitle addObject:model];
                    }
                }
            }
            
            if (newsTitle.count > 0) {
                [tableview reloadData];
            }
        }
        
        
        
        
//        newDict = [[NSDictionary alloc] init];
//        newDict = [news objectForKey:@"nid"];
        [waitload stopAnimating];
        
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"error");
    }];
    [getnews enqueueOperation:op];
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return newsTitle.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellname = @"newscell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellname];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];

        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    }
    if (indexPath.row == 0) {
        UIImage *header = [UIImage imageNamed:@"HeaderIcon"];
        [cell.imageView setImage:header];
        cell.textLabel.text = ((Model *)[newsTitle objectAtIndex:indexPath.row]).newsTitle;
    } else {
        [cell.imageView setImage:nil];
    }
    
    
    cell.textLabel.text = ((Model *)[newsTitle objectAtIndex:indexPath.row]).newsTitle;
    
    return cell;
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
