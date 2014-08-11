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
@property (nonatomic ,retain) NSString *newsCat;
@property (nonatomic ,retain) NSString *newsContent;
@property (nonatomic ,retain) NSString *newsID;

- (instancetype)initWithnewsTitle :(NSString *)newsTitle;
- (instancetype)initWithnewsCat :(NSString *)newsCat;

@end
