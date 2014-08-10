//
//  GetNews.m
//  lyfzw
//
//  Created by 成城 on 14-8-10.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import "GetNews.h"
#import "MainViewController.h"
@implementation GetNews

- (NSArray *)getNewsCatIDquote
{
    MKNetworkEngine *getnewsCatID = [[MKNetworkEngine alloc] initWithHostName:@"www.zglyfzw.com/webapp/api/" customHeaderFields:nil];
    MKNetworkOperation *op = [getnewsCatID operationWithPath:@"category.php" params:nil httpMethod:@"GET"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSLog(@"%@",[completedOperation responseJSON]);
        
        NSData *topnews = [completedOperation responseData];
        news = [NSJSONSerialization JSONObjectWithData:topnews options:NSJSONReadingMutableContainers error:nil];
        newsCatID = [news objectForKey:@"catname"];
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"error");
    }];
    [getnewsCatID enqueueOperation:op];
    
    return newsCatID;
    
}


- (NSArray *)getNewsCatIDconsult
{
    MKNetworkEngine *getnewsCatID = [[MKNetworkEngine alloc] initWithHostName:@"www.zglyfzw.com/webapp/api/category.php" customHeaderFields:nil];
    MKNetworkOperation *op = [getnewsCatID operationWithPath:@"?type=1" params:nil httpMethod:@"GET"];{
        [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
            NSData *topnews = [completedOperation responseData];
            news = [NSJSONSerialization JSONObjectWithData:topnews options:NSJSONReadingMutableContainers error:nil];
            newsCatID = [news objectForKey:@"catname"];
        } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
            NSLog(@"error");
        }];
        [getnewsCatID enqueueOperation:op];
        
        return newsCatID;
    }
}

@end