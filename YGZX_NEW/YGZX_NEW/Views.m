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
		tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 108, 320, 416) style:UITableViewStylePlain];
		
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
		tableView.dataSource = self;
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
	catalogID = [[NSArray alloc] init];
	buttonName = newscatalogName;
	catalogID = newscatalogID;
	for (int i=0; i<[buttonName count]; i++) {
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
		btn.backgroundColor = [UIColor grayColor];
		[btn setTitle:[buttonName objectAtIndex:i] forState:UIControlStateNormal];
		btn.tag = i+1;
		[btn addTarget:self action:@selector(clickbutton:) forControlEvents:UIControlEventTouchDown];
		btn.titleLabel.textColor = [UIColor blackColor];
		btn.frame = CGRectMake(i*80, 0, 75, 44);
		[buttonView addSubview:btn];
	}
}

-(void)clickbutton:(id)sender {
	NSLog(@"%ld",(long)[sender tag]);
	switch ((long)[sender tag]) {
	case 1:
			net.delegate = self;
			[net GetLastestNewsOfCatalog:[catalogID objectAtIndex:0]];
			break;
	case 2:
			[net GetLastestNewsOfCatalog:[catalogID objectAtIndex:1]];
			break;
	case 3:
		[net GetLastestNewsOfCatalog:[catalogID objectAtIndex:2]];
		break;
	case 4:
		[net GetLastestNewsOfCatalog:[catalogID objectAtIndex:3]];
		break;
  default:
			break;
	}
}

-(void)didUpdatedArticles:(NSArray *)articles {
	news = [[NSArray alloc] init];
	news = articles;
	[net WillAnaLysiNetData:articles];
}
-(void)analysisArticlesdatafromNet:(NSArray *)articlesID :(NSArray *)articlesTitle {
	newsID = [[NSArray alloc] init];
	newsID = articlesID;
	newsTitle = articlesTitle;
}
-(void)refreshtablelist {
	[tableView reloadData];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return newsID.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellname = @"cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellname];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
	}
	cell.textLabel.text = [newsTitle objectAtIndex:indexPath.row];
	return cell;
}

@end
