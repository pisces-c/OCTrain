//
//  Views.m
//  YGZX_NEW
//
//  Created by chengcheng on 14/12/16.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import "Views.h"

@implementation Views

- (instancetype)init
{
	self = [super init];
	if (self) {
		buttonView = [[UIScrollView alloc] init];
		imageView = [[UIScrollView alloc] init];
		tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, 320, 600) style:UITableViewStylePlain];
		
		buttonView.frame = CGRectMake(0, 64, 320, 44);
		buttonView.contentOffset = CGPointMake(0, 0);
		buttonView.contentSize = CGSizeMake(1280, 44);
		buttonView.pagingEnabled = YES;
		buttonView.showsHorizontalScrollIndicator = NO;
		buttonView.showsVerticalScrollIndicator = NO;
		
		imageView.frame = CGRectMake(0, 0, 320, 160);
		buttonView.backgroundColor = [UIColor whiteColor];
		imageView.backgroundColor = [UIColor redColor];
		
		
		tableView.tableHeaderView = imageView;
		
		[self addSubview:tableView];
		[self addSubview:buttonView];
		
		buttonView.delegate = self;
		tableView.delegate = self;
		imageView.delegate = self;
		
		net = [[Net alloc] init];
		net.delegate = self;
		[net GetNewsCatalogs];
	}
	return self;
}
-(void)didUpdatedCatalogs:(NSArray *)newscatalogs {
	catalogs = [[NSArray alloc] init];
	catalogs = newscatalogs;
	[net WillAnaLysiNetData:catalogs];
}
-(void)analysisCatalogsdatafromNet:(NSArray *)newscatalogID :(NSArray *)newscatalogName {
	buttonName = [[NSArray alloc] init];
	buttonName = newscatalogName;
	for (int i=0; i<[buttonName count]; i++) {
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
		btn.backgroundColor = [UIColor grayColor];
		[btn setTitle:[buttonName objectAtIndex:i] forState:UIControlStateNormal];
		btn.titleLabel.textColor = [UIColor blackColor];
		btn.frame = CGRectMake(i*80, 0, 75, 44);
		[buttonView addSubview:btn];
	}
}


-(void)refreshtablelist {
	[tableView reloadData];
}

//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//	
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//	
//}

@end
