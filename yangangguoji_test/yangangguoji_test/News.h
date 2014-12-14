//
//  News.h
//  yangangguoji_test
//
//  Created by chengcheng on 14/12/1.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
//栏目
@property (nonatomic ,retain) NSString *catalogID;
@property (nonatomic ,retain) NSString *catalogname;
@property (nonatomic ,retain) NSString *catalogimg;
//某栏目最新文章；headarticles 5条 artiicles 20条；
@property (nonatomic ,retain) NSArray *headarticles;
@property (nonatomic ,retain) NSArray *articles;
//某栏目下更多文章：参数catalogID和timestamp
@property (nonatomic ,retain) NSDate *timestamp;
//新闻详细
@property (nonatomic ,retain) NSString *newsID;	//文章ID
@property (nonatomic ,retain) NSString *simpletitle;	//简单标题
@property (nonatomic ,retain) NSString *title;
@property (nonatomic ,retain) NSString *content;
@property (nonatomic ,retain) NSString *summary;
@property (nonatomic ,retain) NSString *releasetime;
@property (nonatomic ,retain) NSString *headflag;
@property (nonatomic ,retain) NSString *image;
//多媒体信息
@property (nonatomic ,retain) NSString *url;	//媒体地址
@property (nonatomic ,retain) NSString *seq;	//排序号
@property (nonatomic ,retain) NSString *video;	//视频地址（全路径）
@end
