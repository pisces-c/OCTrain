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

- (void)didUpdatedNewsCatalogs:(NSArray *)newscatalogs;

@end

@interface Net : NSObject
@property (weak, nonatomic) id<NetDelegate> delegate;
@property (retain ,atomic) NSArray *newscatalogID;
@property (retain ,atomic) NSArray *newscatalogs;
@property (retain ,atomic) NSString *newstitle;
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

@end
