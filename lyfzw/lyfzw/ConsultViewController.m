//
//  ConsultViewController.m
//  lyfzw
//
//  Created by 成城 on 14-8-7.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import "ConsultViewController.h"
#import "Model.h"

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
    
    UITableView *consultTable = [[UITableView alloc] init];
    consultTable.frame = CGRectMake(0, 64, 320, 700);
    consultTable.tableHeaderView.backgroundColor = [UIColor blackColor];
    
    UIActivityIndicatorView *waitload = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    waitload.backgroundColor = [UIColor blackColor];
    waitload.alpha = 0.2;
    waitload.center = CGPointMake(self.view.center.x, self.view.center.y - 100);
    
    [self.view addSubview:waitload];
    [self.view addSubview:consultTable];
    
    MKNetworkEngine *getConsult = [[MKNetworkEngine alloc] initWithHostName:@"www.zglyfzw.com/webapp/api/" customHeaderFields:nil];
    MKNetworkOperation *op = [getConsult operationWithPath:@"category.php?type=1" params:nil httpMethod:@"GET"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSData *data = [completedOperation responseData];
        
        NSLog(@"%@",[completedOperation responseJSON]);
        newsCat = [[NSMutableArray alloc] init];
        
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
                        NSString *catid = [catValuesDict objectForKey:@"id"];
                        if (catname || catid) {
                            NSLog(@"%@",catname);
                            Model *model = [[Model alloc] initWithnewsCatID:catid catName:catname];
                            [newsCat addObject:model];
                            
                        }
                    }
                }
                for (int i = 0; i < newsCat.count; i++) {
                    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
                    [button.layer setBorderWidth:1.0f];
                    [button.layer setBorderColor:[UIColor blueColor].CGColor];
                    button.frame = CGRectMake(i*(320/newsCat.count), 64, 320/newsCat.count, 40);
                    button.tag = i;
                    NSString *title = ((Model *)[newsCat objectAtIndex:i]).newsCatName;
                    [button setTitle:title forState:UIControlStateNormal];
                    [self.view addSubview:button];
                    
                }
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
    return newtitle_cat.count;
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
    return cell;
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
