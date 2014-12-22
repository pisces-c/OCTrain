//
//  Views.m
//  YGZX_NEW
//
//  Created by chengcheng on 14/12/16.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import "Views.h"
#import "HttpManager.h"

@interface Views () <HttpManagerDelegate>

@end

@implementation Views

- (instancetype)init
{
	self = [super init];
	if (self) {
		buttonView = [[UIScrollView alloc] init];
		imageView = [[UIScrollView alloc] init];
		newsList = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, 320, 416) style:UITableViewStylePlain];
		
		buttonView.frame = CGRectMake(0, 64, 320, 44);
		buttonView.contentOffset = CGPointMake(0, 0);
		buttonView.contentSize = CGSizeMake(1280, 44);
		buttonView.pagingEnabled = YES;
		buttonView.showsHorizontalScrollIndicator = NO;
		buttonView.showsVerticalScrollIndicator = NO;
		
		imageView.frame = CGRectMake(0, 0, 320, 160);
		buttonView.backgroundColor = [UIColor whiteColor];
		imageView.backgroundColor = [UIColor redColor];
		
		newsDetail = [[UIWebView alloc] init];
		newsDetail.frame = CGRectMake(0, 64, 320, 480);
//		backBar = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStyleDone target:self action:@selector(clickBackButton:)];
		
		newsList.tableHeaderView = imageView;
		
		[self addSubview:newsList];
		[self addSubview:buttonView];
		
		buttonView.delegate = self;
		newsList.delegate = self;
		newsList.dataSource = self;
		imageView.delegate = self;
		
		net = [[Net alloc] init];
		net.delegate = self;
		[net GetNewsCatalogs];
		
//		HttpManager *http = [[HttpManager alloc] init];
//		http.delegate = self;
//		[http startHttpRequestWithType:GetNewsCatalogs infos:nil];
	}
	return self;
}

- (void)didUpdateCatalogs:(HttpType)type infos:(NSDictionary *)catalogs {
	
}

-(void)didUpdatedCatalogs:(NSArray *)newscatalogs {
	catalogs = [[NSArray alloc] init];
	catalogs = newscatalogs;
	[net WillAnaLysiCatalogsData:catalogs];
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
	[net WillAnaLysiArticlesData:articles];
}
-(void)analysisArticlesdatafromNet:(NSArray *)articlesID :(NSArray *)articlesTitle :(NSArray *)articlesContent{
	newsID = [[NSArray alloc] init];
	newsTitle = [[NSArray alloc] init];
	newsContent = [[NSArray alloc] init];
	newsID = articlesID;
	newsTitle = articlesTitle;
	newsContent = articlesContent;
	[newsList reloadData];
}
//-(void)refreshtablelist {
//	[newsList reloadData];
//}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return newsID.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellname = @"cell";
	UITableViewCell *cell = [newsList dequeueReusableCellWithIdentifier:cellname];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
	}
	cell.textLabel.text = [newsTitle objectAtIndex:indexPath.row];
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//	[self addSubview:backBar];
	[newsDetail loadHTMLString:[newsContent objectAtIndex:indexPath.row] baseURL:nil];
	[self addSubview:newsDetail];
}
- (void)clickBackButton:(id)sender {
	
}

@end
