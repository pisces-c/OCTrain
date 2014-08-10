//
//  GetNews.h
//  lyfzw
//
//  Created by 成城 on 14-8-10.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKNetworkKit.h"

@interface GetNews : NSObject
{
    NSDictionary *news;
    NSArray *newsCatID;
    NSDictionary *catIDAndtitle;
    NSDictionary *nidAndcontent;
}



- (NSArray *)getNewsCatIDquote;
- (NSArray *)getNewsCatIDconsult;

@end
