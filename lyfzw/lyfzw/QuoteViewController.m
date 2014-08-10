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
    quoteTable.frame = CGRectMake(0, 0, 320, 700);
    
    
//    NSArray *buttonTitle = [[NSArray alloc] init];
    
    
    
    
    
    [self.view addSubview:quoteTable];
    
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
