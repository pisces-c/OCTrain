//
//  HttpManager.m
//  YGZX_NEW
//
//  Created by chengcheng on 14/12/18.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import "HttpManager.h"
#import "AFNetworking/AFNetworking.h"

@implementation HttpManager

- (void)startHttpRequestWithType:(HttpType)type infos:(NSDictionary *)infos
{
	if (type == GetNewsCatalogs) {
		NSString *url = @"http://218.56.32.108/online-api/catalog/newsCatalog";
		
		AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
		manager.responseSerializer = [AFJSONResponseSerializer serializer];
		[manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
			
			if ([_delegate respondsToSelector:@selector(didUpdateCatalogs:infos:)]) {
				[_delegate didUpdateCatalogs:GetNewsCatalogs infos:@{@"catalogID": responseObject}];
			}
			
		} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
			NSLog(@"%@",error);
		}];
		
	} else if (type == GetLastestNewsOfCatalog) {
//		NSString *para = catalogID;
		NSString *url = @"http://218.56.32.108/online-api/article/latest?catalogId=";
//		NSString *url = [url1 stringByAppendingString:para];
		AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
		manager.responseSerializer = [AFJSONResponseSerializer serializer];
		[manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
			if ([responseObject isKindOfClass:[NSDictionary class]]) {
				NSLog(@"%@",responseObject);
				_articles = [[NSMutableArray alloc] init];
				_articles = responseObject;
				
			}
			
			if (_delegate) {
				if ([_delegate respondsToSelector:@selector(didUpdateArticles:infos:)]) {
					[_delegate didUpdateArticles:GetLastestNewsOfCatalog infos:@{@"articles": responseObject}];
				}
			}
			
		} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
			NSLog(@"%@",error);
		}];
	}
}
@end
