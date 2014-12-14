//
//  Convenience.h
//  yangangguoji_test
//
//  Created by chengcheng on 14/12/2.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Convenience : NSObject
/**
 *  进出门查询
 */
@property (nonatomic ,retain) NSString *str;			//参数：提单号
@property (nonatomic ,retain) NSString *termcode;		//码头代码
@property (nonatomic ,retain) NSString *billno;			//提单号
@property (nonatomic ,retain) NSString *cntrno;			//箱号
@property (nonatomic ,retain) NSString *cntrsize;		//尺寸
@property (nonatomic ,retain) NSString *cntrtype;		//箱型
@property (nonatomic ,retain) NSString *sealno;			//铅封号
@property (nonatomic ,retain) NSString *truckno;		//车牌号
@property (nonatomic ,retain) NSString *inandout;		//进出
@property (nonatomic ,retain) NSString *ingatedate;		//进场时间
@property (nonatomic ,retain) NSString *outgatedate;	//出场时间
@property (nonatomic ,retain) NSString *shipname;		//船名
@property (nonatomic ,retain) NSString *voyage;			//航次
/**
 *  客运船次查询
 */
@property (nonatomic ,retain) NSString *timestmp;		//参数：时间
@property (nonatomic ,retain) NSString *shipno;			//航班号
@property (nonatomic ,retain) NSString *shipnam;		//船名
@property (nonatomic ,retain) NSString *sailtim;		//计划开航时间
@property (nonatomic ,retain) NSString *totim;			//计划到港时间
@property (nonatomic ,retain) NSString *shipplacenam;	//登船地点
@property (nonatomic ,retain) NSString *flightstat;		//售票状态

@end
