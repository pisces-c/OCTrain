//
//  Model.h
//  lyfzw
//
//  Created by 成城 on 14-8-9.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic ,retain) NSString *newsTitle;
@property (nonatomic ,retain) NSString *newsCatID;
@property (nonatomic ,retain) NSString *newsCatName;
@property (nonatomic ,retain) NSString *newsContent;
@property (nonatomic ,retain) NSString *newsID;
@property (nonatomic ,retain) NSString *newsTime;

- (instancetype)initWithnewsTitle :(NSString *)newsTitle;
- (instancetype)initWithnewsCatID :(NSString *)newsCatID catName :(NSString *)newsCatName;
- (instancetype)initWithnewsCatID :(NSString *)newsCatID newsID :(NSString *)newsID newsTitle:(NSString *)newsTitle;
- (instancetype)initWithnewsContent :(NSString *)newsContent;
- (instancetype)initWithnewsContent :(NSString *)newsContent :(NSString *)newsTitle;
- (instancetype)initWithnewsTime :(NSString *)newsTime;

@end
