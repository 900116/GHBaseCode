//
//  NSString+GHExtension.h
//  GoHome
//
//  Created by YongCheHui on 16/6/14.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (GHExtension)
+(BOOL)isThinkingNull:(NSString *)str;
-(NSString*)trim;
-(BOOL)isPhoneNumber;
-(BOOL)isMatchRegex:(NSString*)regex;
-(BOOL)isMatchLength:(NSInteger)length;
-(BOOL)isLargerThanLength:(NSInteger)length;
+(NSString*)dayWithTime:(long long)time;
+(NSString*)dayTimeWithTime:(long long)time;
-(NSString*)md5;
-(NSString*)dateStr;
-(NSDate*)yyyy_mm_ddDate;

-(NSString*)floatStringWithMaxBit:(int)maxBit minBit:(int)minBit removeZero:(BOOL)removeZero;

-(NSAttributedString *) stringWithColor:(UIColor *)color reg:(NSString*)regex;
-(NSAttributedString *) stringWithColor:(UIColor *)color reg:(NSString*)regex addLinks:(BOOL)addLinks;
-(NSAttributedString *) stringWithColor:(UIColor *)color reg:(NSString*)regex addLinks:(BOOL)addLinks ranges:(NSMutableArray*)ranges;
/**
 *  数字变色
 *
 *  @return attributeString
 */
-(NSAttributedString *) numberStrWithColor:(UIColor *)color;


- (NSString *)getDistanceStr:(NSInteger )time;

/**
 *  将文本转换为base64格式字符串
 *
 *  @param text 文本
 *
 *  @return base64格式字符串
 */
+ (NSString *)base64StringFromText:(NSString *)text;

/**
 *  将base64格式字符串转换为文本
 *
 *  @param base64 base64格式字符串
 *
 *  @return 文本
 */
+ (NSString *)textFromBase64String:(NSString *)base64;

-(char)pinyinFirstCap;

-(NSString *)stringByReplacelastCount:(int)count withCellString:(NSString*)cellStr;
@end
