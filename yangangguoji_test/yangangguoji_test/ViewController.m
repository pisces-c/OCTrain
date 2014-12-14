//
//  ViewController.m
//  yangangguoji_test
//
//  Created by chengcheng on 14/11/28.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController 

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	MMDrawerBarButtonItem *leftbutton = [[MMDrawerBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickleftbutton:)];
	MMDrawerBarButtonItem *rightbutton = [[MMDrawerBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickrightbutton:)];
	self.navigationItem.leftBarButtonItem = leftbutton;
	self.navigationItem.rightBarButtonItem = rightbutton;
	
	TableViewController *tvc = [[TableViewController alloc]init];
	SlideViewController *svc = [[SlideViewController alloc] init];
	[svc createbutton];
	[self.view addSubview:tvc.tableView];
	[self.view addSubview:svc.scrollbutton];
	
//	Net *net = [[Net alloc] init];
//	net.delegate = self;
	
}

//- (void)didUpdatedNewsCatalogs:(NSDictionary *)newscatalogs
//{
//	Net *getnewscatalogs = [[Net alloc] init];
//	[getnewscatalogs GetNewsCatalogs];
//}

- (void)clickleftbutton:(id)sender {
	[self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}
- (void)clickrightbutton:(id)sender {
	[self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
