//
//  ViewController.m
//  YGZX_NEW
//
//  Created by chengcheng on 14/12/16.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
//	net = [[Net alloc] init];
//	net.delegate = self;
//	[net GetNewsCatalogs];
	MMDrawerBarButtonItem *leftbutton = [[MMDrawerBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickleftbutton:)];
	MMDrawerBarButtonItem *rightbutton = [[MMDrawerBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickrightbutton:)];
	self.navigationItem.leftBarButtonItem = leftbutton;
	self.navigationItem.rightBarButtonItem = rightbutton;
	
	
	
	ygViews = [[Views alloc] init];
	ygViews.frame = CGRectMake(0, 0, 1280, 960);
	[self.view addSubview:ygViews];
	
}

//-(void)didUpdatedNewsCatalogs:(NSArray *)newscatalogs {
//	catalogs = newscatalogs;
//	[net WillAnaLysiNetData:catalogs];
//}
//
//-(void)analysisCatalogsdatafromNet:(NSArray *)newscatalogID :(NSArray *)newscatalogName {
//	buttonName = newscatalogName;
//	[ygViews refreshtablelist];
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
