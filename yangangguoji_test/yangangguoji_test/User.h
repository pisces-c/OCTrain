//
//  User.h
//  yangangguoji_test
//
//  Created by chengcheng on 14/12/2.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
//用户登录与注册
/**
 *	参数
 *  username:用户名
 *	pwd:密码
 *	idcardNO:身份证号
 */
@property (nonatomic ,retain) NSString *username;
@property (nonatomic ,retain) NSString *pwd;
@property (nonatomic ,retain) NSString *idcardNO;
/**
 *	返回
 *  errorInfo:错误信息
 *	result:结果0、1
 */
@property (nonatomic ,retain) NSString *errorInfo;
@property (nonatomic ,retain) NSString *result;
/**
 *  登录
 */
@property (nonatomic ,retain) NSString *appID;
@property (nonatomic ,retain) NSArray *user;
@property (nonatomic ,retain) NSString *loginname;
@property (nonatomic ,retain) NSString *name;
@property (nonatomic ,retain) NSString *token;
@property (nonatomic ,retain) NSString *permissionsCode;
/**
 *  修改密码
 */
@property (nonatomic ,retain) NSString *newpwd;
/**
 *  <#Description#>
 */
@property (nonatomic ,retain) NSArray *pusharticle;



@end

