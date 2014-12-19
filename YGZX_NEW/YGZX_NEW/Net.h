//
//  Net.h
//  yangangguoji_test
//
//  Created by chengcheng on 14/11/30.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking/AFNetworking.h"
#import "AFNetworking/AFURLRequestSerialization.h"
#import "AFNetworking/AFHTTPRequestOperation.h"
#import "AFNetworking/AFURLConnectionOperation.h"
#import "AFNetworking/AFHTTPRequestOperation.h"

@protocol NetDelegate <NSObject>
@optional
- (void)didUpdatedCatalogs:(NSArray *)newscatalogs;
- (void)didUpdatedArticles:(NSArray *)articles;
- (void)analysisCatalogsdatafromNet:(NSArray *)newscatalogID :(NSArray *)newscatalogName;
- (void)analysisArticlesdatafromNet:(NSArray *)articlesID :(NSArray *)articlesTitle;

@end

@interface Net : NSObject
@property (strong, nonatomic) id<NetDelegate> delegate;
@property (retain ,atomic) NSMutableArray *newscatalogs;
@property (retain ,atomic) NSMutableArray *newscatalogID;
@property (retain ,atomic) NSMutableArray *newscatalogName;
@property (retain ,atomic) NSMutableArray *articles;
@property (retain ,atomic) NSMutableArray *newsID;
@property (retain ,atomic) NSMutableArray *newsTitle;
@property (retain ,atomic) NSMutableArray *headnews;
@property (retain ,atomic) NSMutableArray *newsdetail;
/**
 *  取得新闻栏目
 */
-(void)GetNewsCatalogs;
/**
 *  取得栏目ID
 *
 *  @return newscatalogid
 */
//-(NSArray *)GetNewsCatalogID;
/**
 *  取得栏目下最新文章列表
 *
 */
-(void)GetLastestNewsOfCatalog:(NSString *)catalogID;
/**
 *  取得更多文章
 *
 *  @param catalogID 栏目ID
 *  @param timestamp 时间戳
 */
-(void)GetMoreNewsOfCatalog:(NSString *)catalogID :(NSString *)timestamp;
/**
 *  取得新闻详细内容
 *
 *  @param newsID 新闻ID
 */
-(void)GetDetailOfNews:(NSString *)newsID;
/**
 *  分析取回结果
 *
 *  @param arr 取回的结果是数组
 */
-(void)WillAnaLysiNetData:(NSArray *)arr;


@end
