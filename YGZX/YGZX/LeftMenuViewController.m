//
//  LeftMenuViewController.m
//  YGZX
//
//  Created by 成城 on 14-9-17.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import "LeftMenuViewController.h"

@interface LeftMenuViewController ()

@end

@implementation LeftMenuViewController

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
	
	UILabel *lbltest = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
	lbltest.backgroundColor = [UIColor greenColor];
	
	UITableView *leftmenu = [[UITableView alloc] init];
	leftmenu.backgroundColor = [UIColor greenColor];
	
	
	[self.view addSubview:lbltest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//	
//}
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//	
//}

@end
