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

- (instancetype)initWithnewsCat :(NSString *)newsCat;
{
    self = [super init];
    if (self) {
        _newsCat = newsCat;
    }
    return self;
}
@end
