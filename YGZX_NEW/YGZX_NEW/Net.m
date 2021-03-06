//
//  Net.m
//  yangangguoji_test
//
//  Created by chengcheng on 14/11/30.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import "Net.h"

@implementation Net

-(void)GetNewsCatalogs{
	
	
	NSString *url = @"http://218.56.32.108/online-api/catalog/newsCatalog";
	
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	manager.responseSerializer = [AFJSONResponseSerializer serializer];
	[manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
		if ([responseObject isKindOfClass:[NSArray class]]) {
//			NSLog(@"%@",responseObject);
			_newscatalogs = [[NSMutableArray alloc] init];
			_newscatalogs = responseObject;
			
		}
		
		if (_delegate) {
			if ([_delegate respondsToSelector:@selector(didUpdatedCatalogs:)]) {
				[_delegate didUpdatedCatalogs:_newscatalogs];
			}
		}
		
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"%@",error);
	}];
}

-(void)GetLastestNewsOfCatalog:(NSString *)catalogID {
	NSString *para = catalogID;
	NSString *url1 = @"http://218.56.32.108/online-api/article/latest?catalogId=";
	NSString *url = [url1 stringByAppendingString:para];
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	manager.responseSerializer = [AFJSONResponseSerializer serializer];
	[manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
		if ([responseObject isKindOfClass:[NSDictionary class]]) {
			NSLog(@"%@",responseObject);
			_articles = [[NSMutableArray alloc] init];
			_articles = [responseObject objectForKey:@"articles"];
			
		}
		
		if (_delegate) {
			if ([_delegate respondsToSelector:@selector(didUpdatedArticles:)]) {
				[_delegate didUpdatedArticles:_articles];
			}
		}
		
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"%@",error);
	}];
}
-(void)GetMoreNewsOfCatalog:(NSString *)catalogID :(NSString *)timestamp {
	
}
-(void)GetDetailOfNews:(NSString *)newsID {
	NSString *para = newsID;
	NSString *url1 = @"http://218.56.32.108/online-api/article/show?id=";
	NSString *url = [url1 stringByAppendingString:para];
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	manager.responseSerializer = [AFJSONResponseSerializer serializer];
	[manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
		if ([responseObject isKindOfClass:[NSDictionary class]]) {
			NSLog(@"%@",responseObject);
			_articles = [[NSMutableArray alloc] init];
			_articles = [responseObject objectForKey:@"articles"];
			
		}
		
		if (_delegate) {
			if ([_delegate respondsToSelector:@selector(didUpdatedArticles:)]) {
				[_delegate didUpdatedArticles:_articles];
			}
		}
		
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"%@",error);
	}];
}

-(void)WillAnaLysiCatalogsData:(NSArray *)arr{
	if ([arr isKindOfClass:[NSArray class]]) {
		_newscatalogID = [[NSMutableArray alloc] init];
		_newscatalogName = [[NSMutableArray alloc] init];
		for (int i=0; i<[arr count]; i++) {
			NSDictionary *dict = [[NSDictionary alloc] init];
			dict = [arr objectAtIndex:i];
				[_newscatalogID addObject:[dict objectForKey:@"id"]];
				[_newscatalogName addObject:[dict objectForKey:@"name"]];
			}
		}
		
		if (_delegate) {
			if ([_delegate respondsToSelector:@selector(didUpdatedCatalogs:)]) {
				[_delegate analysisCatalogsdatafromNet:_newscatalogID :_newscatalogName];
			}
		}
}
- (void)WillAnaLysiArticlesData:(NSArray *)arr {
	if ([arr isKindOfClass:[NSArray class]]) {
		_articles = [[NSMutableArray alloc] init];
		_newsID = [[NSMutableArray alloc] init];
		_newsTitle = [[NSMutableArray alloc] init];
		_newsdetail = [[NSMutableArray alloc] init];
		for (int i=0; i<[arr count]; i++) {
			NSDictionary *dict = [[NSDictionary alloc] init];
			dict = [arr objectAtIndex:i];
			if ([[dict objectForKey:@"module"] isEqualToString:@"article"]) {
				[_newsTitle addObject:[dict objectForKey:@"title"]];
				[_newsID addObject:[dict objectForKey:@"id"]];
				[_newsdetail addObject:[dict objectForKey:@"content"]];
			}
		}
		if (_delegate) {
			if ([_delegate respondsToSelector:@selector(didUpdatedArticles:)]) {
				[_delegate analysisArticlesdatafromNet:_newsID :_newsTitle :_newsdetail];
			}
		}
	}
}
@end
