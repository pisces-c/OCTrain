//
//  HttpManager.h
//  YGZX_NEW
//
//  Created by chengcheng on 14/12/18.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
	GetNewsCatalogs,
	GetLastestNewsOfCatalog,
	GetMoreNewsOfCatalog,
	GetDetailOfNews,
	WillAnaLysiNetData
} HttpType;

@protocol HttpManagerDelegate <NSObject>

- (void)didUpdateCatalogs:(HttpType)type infos:(NSDictionary *)catalogs;
- (void)didUpdateArticles:(HttpType)type infos:(NSDictionary *)articles;

@end

@interface HttpManager : NSObject

@property (nonatomic, weak) id<HttpManagerDelegate> delegate;
@property (retain ,atomic) NSMutableArray *newscatalogs;
@property (retain ,atomic) NSMutableArray *newscatalogID;
@property (retain ,atomic) NSMutableArray *newscatalogName;
@property (retain ,atomic) NSMutableArray *articles;
@property (retain ,atomic) NSMutableArray *newsID;
@property (retain ,atomic) NSMutableArray *newsTitle;
@property (retain ,atomic) NSMutableArray *headnews;
@property (retain ,atomic) NSMutableArray *newsdetail;

- (void)startHttpRequestWithType:(HttpType)type infos:(NSDictionary *)infos;
@end
