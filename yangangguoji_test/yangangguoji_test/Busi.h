//
//  Busi.h
//  yangangguoji_test
//
//  Created by chengcheng on 14/12/2.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Busi : NSObject
/**
 *  生产日报查询参数
 */
@property (nonatomic ,retain) NSString *appid;
@property (nonatomic ,retain) NSString *userid;
@property (nonatomic ,retain) NSString *aaccesstoken;
@property (nonatomic ,retain) NSString *searchdate;
@property (nonatomic ,retain) NSString *start;
/**
 *  生产日报查询返回
 */
@property (nonatomic ,retain) NSString *corpcode;				//公司代码
@property (nonatomic ,retain) NSString *corpname;				//公司名称
@property (nonatomic ,retain) NSString *dayhandlingcapacity;	//当日装卸量
@property (nonatomic ,retain) NSString *monthhandlingcapacity;	//当月装卸量
@property (nonatomic ,retain) NSString *yearhandlingcapacity;	//当年装卸量
@property (nonatomic ,retain) NSString *yoy;					//同比
@property (nonatomic ,retain) NSString *date;					//统计时间
@end
