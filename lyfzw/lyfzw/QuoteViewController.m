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
#import "InfoViewController.h"

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
    newTitle = [NSMutableArray new];
    newsContent = [NSMutableArray new];
    
    quoteTable = [[UITableView alloc] init];
    quoteTable.frame = CGRectMake(0, 50, 320, self.view.frame.size.height);
    quoteTable.tableHeaderView.backgroundColor = [UIColor blackColor];
    quoteTable.delegate = self;
    quoteTable.dataSource = self;
    
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
//                            NSLog(@"%@",catname);
                            Model *model = [[Model alloc] initWithnewsCatID:catid catName:catname];
                            [newsCatName addObject:model.newsCatName];
                            [newCatID addObject:model.newsCatID];
                        }
                    }
                }
                UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:newsCatName];
                segmentedControl.frame = CGRectMake(10, 70, 300, 40);
                segmentedControl.backgroundColor = [UIColor whiteColor];
                [segmentedControl addTarget:self action:@selector(clickCat:) forControlEvents:UIControlEventValueChanged];
                [segmentedControl setSelectedSegmentIndex:0];
                [self.view addSubview:segmentedControl];
                [self getCatIdMessageAndReloadTableView:1];
            }
        }
        [quoteTable reloadData];
        [waitload stopAnimating];
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"error");
    }];
    [getQuote enqueueOperation:op];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return newTitle.count;
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
    
    cell.textLabel.text = newTitle[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Model *model = [newsContent objectAtIndex:indexPath.row];
    InfoViewController *infoView = [[InfoViewController alloc] init];
    infoView.info = model.newsContent;
    
    [self.navigationController pushViewController:infoView animated:YES];
}

-(void)clickCat:(id)sender
{
    UISegmentedControl *segment = (UISegmentedControl *)sender;
    
    NSLog(@"%d",segment.selectedSegmentIndex);
    
    
    [self getCatIdMessageAndReloadTableView:segment.selectedSegmentIndex+1];
    
}


- (void)getCatIdMessageAndReloadTableView:(int)Id
{
    waitload = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    waitload.backgroundColor = [UIColor blackColor];
    waitload.alpha = 0.2;
    waitload.center = CGPointMake(self.view.center.x, self.view.center.y - 100);
    [waitload startAnimating];
    MKNetworkEngine *getQuote = [[MKNetworkEngine alloc] initWithHostName:@"www.zglyfzw.com/webapp/api/" customHeaderFields:nil];
    NSString *params = [NSString stringWithFormat:@"quote.php?catid=%d",Id];
    MKNetworkOperation *op = [getQuote operationWithPath:params params:nil httpMethod:@"GET"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSData *data = [completedOperation responseData];
        newsCatName = [[NSMutableArray alloc] init];
        newCatID = [[NSMutableArray alloc] init];
        
        
        id catdata = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        if ([catdata isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary *catDict = (NSDictionary *)catdata;
            
            NSString *msg = [catDict objectForKey:@"msg"];
            if ([msg isEqualToString:@"ok"]) {
                
                NSArray *data = [catDict objectForKey:@"data"];
                
                // clean
                [newTitle removeAllObjects];
                for (id catValuesDict in data) {
                    if ([catValuesDict isKindOfClass:[NSDictionary class]]) {
                        NSString *catname = [catValuesDict objectForKey:@"biaojiachu"];
                        if (catname) {
                            Model *model = [[Model alloc] initWithnewsTitle:catname];
                            [newTitle addObject:model.newsTitle];
                            
                        }
                        NSString *content = [catValuesDict objectForKey:@"content"];
                        if (content) {
                            Model *contents = [[Model alloc] initWithnewsContent:content];
                            [newsContent addObject:contents];
                        }
                    }
                }
                
                [quoteTable reloadData];
                
                // post
                
            }
        }
        [quoteTable reloadData];
        [waitload stopAnimating];
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"error");
    }];
    [getQuote enqueueOperation:op];
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
