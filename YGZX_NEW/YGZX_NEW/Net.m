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
			NSLog(@"%@",responseObject);
			_newscatalogs = [[NSArray alloc] init];
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
	NSString *url = @"http://218.56.32.108/online-api/article/latest?catalogId=?";
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	manager.responseSerializer = [AFJSONResponseSerializer serializer];
	[manager GET:url parameters:catalogID success:^(AFHTTPRequestOperation *operation, id responseObject) {
		if ([responseObject isKindOfClass:[NSArray class]]) {
			NSLog(@"%@",responseObject);
			_articles = [[NSArray alloc] init];
			_articles = responseObject;
			
		}
		
		if (_delegate) {
			if ([_delegate respondsToSelector:@selector(didUpdatedArticles:)]) {
				[_delegate didUpdatedArticles:_newscatalogs];
			}
		}
		
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"%@",error);
	}];
}
-(void)GetMoreNewsOfCatalog:(NSString *)catalogID :(NSString *)timestamp {
	
}
-(void)GetDetailOfNews:(NSString *)newsID {
	
}

-(void)WillAnaLysiNetData:(NSArray *)arr{
	if ([arr isKindOfClass:[NSArray class]]) {
		_newscatalogID = [[NSMutableArray alloc] init];
		_newscatalogName = [[NSMutableArray alloc] init];
		_articles = [[NSMutableArray alloc] init];
		_newsID = [[NSMutableArray alloc] init];
		_newsTitle = [[NSMutableArray alloc] init];
		for (int i=0; i<[arr count]; i++) {
			NSDictionary *dict = [[NSDictionary alloc] init];
			dict = [arr objectAtIndex:i];
//			_newscatalogID = [_newscatalogID arrayByAddingObject:[dict objectForKey:@"id"]];
//			_newscatalogName = [_newscatalogName arrayByAddingObject:[dict objectForKey:@"name"]];
			
			
			// TODO
			[_newscatalogID addObject:[dict objectForKey:@"id"]];
			[_newscatalogName addObject:[dict objectForKey:@"name"]];
//			if ([[dict objectForKey:@"module"] isEqual:@"article"]) {
//				_newsID = [_newsID arrayByAddingObject:[dict objectForKey:@"id"]];
//				_newsTitle = [_newsTitle arrayByAddingObject:[dict objectForKey:@"title"]];
//			}
			
		}
		
		if (_delegate) {
			if ([_delegate respondsToSelector:@selector(didUpdatedCatalogs:)]) {
				[_delegate analysisCatalogsdatafromNet:_newscatalogID :_newscatalogName];
			}
			//				} else if ([_delegate respondsToSelector:@selector(didUpdatedCatalogs:)]) {
			//					[_delegate analysisArticlesdatafromNet:_newsID :_newsTitle];
			//				}
		}
	}
}

@end
