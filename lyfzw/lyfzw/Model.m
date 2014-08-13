//
//  Model.m
//  lyfzw
//
//  Created by 成城 on 14-8-9.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import "Model.h"

@implementation Model


- (instancetype)initWithnewsTitle :(NSString *)newsTitle
{
    self = [super init];
    if (self) {
        _newsTitle = newsTitle;
    }
    return self;
}

- (instancetype)initWithnewsCatID :(NSString *)newsCatID catName :(NSString *)newsCatName
{
    self = [super init];
    if (self) {
        _newsCatID = newsCatID;
        _newsCatName = newsCatName;
    }
    return self;
}

- (instancetype)initWithnewsCatID :(NSString *)newsCatID newsID :(NSString *)newsID newsTitle:(NSString *)newsTitle
{
    self = [super init];
    if (self) {
        _newsCatID = newsCatID;
        _newsID = newsID;
        _newsTitle = newsTitle;
    }
    return self;
}

- (instancetype)initWithnewsContent :(NSString *)newsContent
{
    self = [super init];
    if (self) {
        _newsContent = newsContent;
    }
    return self;
}

@end
