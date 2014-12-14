//
//  Net.m
//  yangangguoji_test
//
//  Created by chengcheng on 14/11/30.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import "Net.h"

@implementation Net

- (void)dealloc
{
	NSLog(@"aaaa");
}

-(void)GetNewsCatalogs{
	
	NSString *url = @"http://218.56.32.108/online-api/catalog/newsCatalog";
	
//	__weak Net *wself = self;
	
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	manager.responseSerializer = [AFJSONResponseSerializer serializer];
	[manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
		if ([responseObject isKindOfClass:[NSArray class]]) {
			NSLog(@"%@",responseObject);
			_newscatalogs = [[NSArray alloc] init];
			_newscatalogs = responseObject;
			
		}

		if (_delegate) {
			if ([_delegate respondsToSelector:@selector(didUpdatedNewsCatalogs:)]) {
				[_delegate didUpdatedNewsCatalogs:_newscatalogs];
			}
		}
		
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"%@",error);
	}];
}


-(void)GetLastestNewsOfCatalog:(NSString *)catalogID {
	
	
	NSString *url = @"http://218.56.32.108/online-api/article/latest/catalogID=?";
	
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	manager.responseSerializer = [AFJSONResponseSerializer serializer];
	[manager GET:url parameters:[_newscatalogID objectAtIndex:0] success:^(AFHTTPRequestOperation *operation, id responseObject) {
		NSLog(@"%@",[responseObject objectAtIndex:0]);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"%@",error);
	}];
}
-(void)GetMoreNewsOfCatalog:(NSString *)catalogID :(NSString *)timestamp {
	
}
-(void)GetDetailOfNews:(NSString *)newsID {
	
}


@end
