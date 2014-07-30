//
//  Model.h
//  NoSecret
//
//  Created by 成城 on 14-7-30.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (strong ,nonatomic) NSString *str;
@property (strong ,nonatomic) NSString *img;

- (instancetype)initWithString:(NSString *)str img:(NSString *)img;
@end
