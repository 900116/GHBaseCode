//
//  NSDate+GHExtension.m
//  GoHome
//
//  Created by YongCheHui on 16/6/24.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "NSDate+GHExtension.h"

@implementation NSDate (GHExtension)
-(NSString*)getTimeStrWithFormat:(NSString*)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

-(NSString *)getTimeStr {
    return [self getTimeStrWithFormat:@"YYYY-MM-dd HH:mm"];
}

-(NSString *)getDateStr
{
    return [self getTimeStrWithFormat:@"YYYY-MM-dd"];
}

-(NSString *)getTimeIntervalStr
{
    return stringForF([self timeIntervalSince1970]);
}
@end
