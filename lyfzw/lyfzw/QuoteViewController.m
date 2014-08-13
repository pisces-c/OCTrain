//
//  QuoteViewController.m
//  lyfzw
//
//  Created by 成城 on 14-8-7.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import "QuoteViewController.h"
#import "Model.h"
#import "GetNews.h"

@interface QuoteViewController ()

@end

@implementation QuoteViewController

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
    
    UITableView *quoteTable = [[UITableView alloc] init];
    quoteTable.frame = CGRectMake(0, 64, 320, 700);
    quoteTable.tableHeaderView.backgroundColor = [UIColor blackColor];
    
    UIActivityIndicatorView *waitload = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    waitload.backgroundColor = [UIColor blackColor];
    waitload.alpha = 0.2;
    waitload.center = CGPointMake(self.view.center.x, self.view.center.y - 100);
    
    [self.view addSubview:waitload];
    [self.view addSubview:quoteTable];
    
    MKNetworkEngine *getQuote = [[MKNetworkEngine alloc] initWithHostName:@"www.zglyfzw.com/webapp/api/" customHeaderFields:nil];
    MKNetworkOperation *op = [getQuote operationWithPath:@"category.php?type=0" params:nil httpMethod:@"GET"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSData *data = [completedOperation responseData];
        
//        NSLog(@"%@",[completedOperation responseJSON]);
        newsCatName = [[NSMutableArray alloc] init];
        newCatID = [[NSMutableArray alloc] init];
        
        [waitload startAnimating];
        
        id catdata = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        if ([catdata isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary *catDict = (NSDictionary *)catdata;
            
            NSString *msg = [catDict objectForKey:@"msg"];
            if ([msg isEqualToString:@"ok"]) {
                
                NSArray *data = [catDict objectForKey:@"data"];
                
                for (id catValuesDict in data) {
                    if ([catValuesDict isKindOfClass:[NSDictionary class]]) {
                        NSString *catname = [catValuesDict objectForKey:@"catname"];
                        NSString *catid = [catValuesDict objectForKey:@"cid"];
                        if (catname || catid) {
                            NSLog(@"%@",catname);
                            Model *model = [[Model alloc] initWithnewsCatID:catid catName:catname];
                            [newsCatName addObject:model.newsCatName];
                            [newCatID addObject:model.newsCatID];
                            
                        }
                    }
                }
                for (int i = 0; i < newsCatName.count; i++) {
                    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
                    [button.layer setBorderWidth:1.0f];
                    [button.layer setBorderColor:[UIColor blueColor].CGColor];
                    button.frame = CGRectMake(i*(320/newsCatName.count), 64, 320/newsCatName.count, 40);
                    button.tag = i;
                    NSString *title = [newsCatName objectAtIndex:i];
                    [button setTitle:title forState:UIControlStateNormal];
                    [button addTarget:self action:@selector(clickCatButton:) forControlEvents:UIControlEventTouchUpInside];
                    
                    [self.view addSubview:button];
                    
                }
            }
        }
        [quoteTable reloadData];
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"error");
    }];
    [getQuote enqueueOperation:op];
    
    
    
    
    

    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return newtitle_cat.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellname = @"quotecell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellname];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
        
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return cell;
}



-(void)clickCatButton:(id)sender
{
    NSString *page_no = @"page_no";
    NSString *catid = @"catid";
    NSDictionary *param = [[NSDictionary alloc] init];
    [param setValue:@"1" forKey:page_no];
    switch (self.view.tag) {
        case 0:
            [param setValue:@"0" forKey:catid];
            MKNetworkEngine *getQuoteTitle = [[MKNetworkEngine alloc] initWithHostName:@"www.zglyfzw.com/webapp/api/" customHeaderFields:nil];
            MKNetworkOperation *op = [getQuoteTitle operationWithPath:@"quote.php" params:param httpMethod:@"GET"];
            [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
                NSLog(@"%@",[completedOperation responseData]);
            } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
                NSLog(@"error");
            }];
            [getQuoteTitle enqueueOperation:op];
            break;
        case 1:
            [param setValue:@"1" forKey:@"catid"];
            break;
        case 2:
            [param setValue:@"2" forKey:@"catid"];
        default:
            break;
    }
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
