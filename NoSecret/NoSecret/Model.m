//
//  Model.m
//  NoSecret
//
//  Created by 成城 on 14-7-30.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import "Model.h"

@implementation Model

- (instancetype)initWithString:(NSString *)str img:(NSString *)img
{
    self = [super init];
    if (self) {
        _str = str;
        _img = img;
    }
    return self;
}
@end
