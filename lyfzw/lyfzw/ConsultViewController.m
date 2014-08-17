//
//  ConsultViewController.m
//  lyfzw
//
//  Created by 成城 on 14-8-7.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import "ConsultViewController.h"
#import "Model.h"
#import "InfoViewController.h"

@interface ConsultViewController ()

@end

@implementation ConsultViewController

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
    
    newsModel = [NSMutableArray new];
    newsContent = [NSMutableArray new];
    
    consultTable = [[UITableView alloc] init];
    consultTable.frame = CGRectMake(0, 50, 320, 700);
    consultTable.tableHeaderView.backgroundColor = [UIColor blackColor];
    
    consultTable.delegate = self;
    consultTable.dataSource = self;
    
    [self.view addSubview:consultTable];

    newsCatname = [[NSMutableArray alloc] init];
    newsTitle = [[NSMutableArray alloc] init];
    
    MKNetworkEngine *getConsult = [[MKNetworkEngine alloc] initWithHostName:@"www.zglyfzw.com/webapp/api/" customHeaderFields:nil];
    MKNetworkOperation *op = [getConsult operationWithPath:@"category.php?type=1" params:nil httpMethod:@"GET"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSData *data = [completedOperation responseData];
        
        NSLog(@"%@",[completedOperation responseJSON]);

        
        id catdata = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        if ([catdata isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary *catDict = (NSDictionary *)catdata;
            
            NSString *msg = [catDict objectForKey:@"msg"];
            if ([msg isEqualToString:@"ok"]) {
                
                NSArray *data = [catDict objectForKey:@"data"];
                
                [newsModel removeAllObjects];
                
                for (id catValuesDict in data) {
                    if ([catValuesDict isKindOfClass:[NSDictionary class]]) {
                        NSString *catname = [catValuesDict objectForKey:@"catname"];
                        NSString *catid = [catValuesDict objectForKey:@"cid"];
                        if (catname || catid) {
                            NSLog(@"%@",catname);
                            Model *model = [[Model alloc] initWithnewsCatID:catid catName:catname];
                            [newsModel addObject:model];
                        }
                    }
                }
                
                NSMutableArray *names = [NSMutableArray new];
                for (Model *model in newsModel) {
                    [names addObject:model.newsCatName];
                }
                
                UISegmentedControl *catName = [[UISegmentedControl alloc] initWithItems:names];
                catName.frame = CGRectMake(10, 70, 300, 40);
                [catName addTarget:self action:@selector(clickCat:) forControlEvents:UIControlEventValueChanged];
                [catName setSelectedSegmentIndex:0];
                catName.selectedSegmentIndex = (NSInteger)newsCatId;
                [self.view addSubview:catName];
                [self getCatIdMessageAndReloadTableView:[((Model *)newsModel[0]).newsCatID intValue]];
            }
        }
        [consultTable reloadData];
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"error");
    }];
    [getConsult enqueueOperation:op];
    
    
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return newsTitle.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellname = @"consultcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellname];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
        
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    }
//    cell.textLabel.text = (Model *)([newsCat objectAtIndex:indexPath.row]).newsTitle;
    cell.textLabel.text =  [newsTitle objectAtIndex:indexPath.row];//((Model *)).newsTitle;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Model *model = [newsContent objectAtIndex:indexPath.row];
    InfoViewController *infoview = [[InfoViewController alloc] init];
    infoview.info = model.newsContent;
    [self.navigationController pushViewController:infoview animated:YES];
}


- (void)clickCat:(id)sender
{
    
    UISegmentedControl *segment = (UISegmentedControl *)sender;
    
    NSLog(@"%d",segment.selectedSegmentIndex);
    
    Model *model = newsModel[segment.selectedSegmentIndex];
    [self getCatIdMessageAndReloadTableView:[model.newsCatID intValue]];
}


- (void)getCatIdMessageAndReloadTableView:(int)catID
{
    NSString *path = [NSString stringWithFormat:@"news.php?catid=%d",catID];
    MKNetworkEngine *getConsult = [[MKNetworkEngine alloc] initWithHostName:@"www.zglyfzw.com/webapp/api/" customHeaderFields:nil];
    MKNetworkOperation *sp = [getConsult operationWithPath:path params:nil httpMethod:@"GET"];
    [sp addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSData *data = [completedOperation responseData];
        id catdata = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        if ([catdata isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary *catDict = (NSDictionary *)catdata;
            
            NSString *msg = [catDict objectForKey:@"msg"];
            if ([msg isEqualToString:@"ok"]) {
                
                NSArray *data = [catDict objectForKey:@"data"];
                
                // clean
                [newsTitle removeAllObjects];
                for (id catValuesDict in data) {
                    if ([catValuesDict isKindOfClass:[NSDictionary class]]) {
                        NSString *catname = [catValuesDict objectForKey:@"title"];
                        if (catname) {
                            Model *model = [[Model alloc] initWithnewsTitle:catname];
                            [newsTitle addObject:model.newsTitle];
                            
                        }
                        NSString *content = [catValuesDict objectForKey:@"content"];
                        if (newsContent) {
                            Model *contents = [[Model alloc] initWithnewsContent:content];
                            [newsContent addObject:contents];
                        }
                    }
                }
            }
        }
        [consultTable reloadData];
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"error");
    }];
    [getConsult enqueueOperation:sp];
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
