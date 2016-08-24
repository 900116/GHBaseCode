//
//  NSDictionary+GHExtension.h
//  GoHome
//
//  Created by YongCheHui on 16/6/21.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (GHExtension)
-(NSDictionary *)dictionaryWithKeyValues:(NSArray*)keyValues;
+(NSDictionary *)dictionaryWithPlistName:(NSString*)plist;


#pragma mark Data Safe
- (id)objectSafeForKey:(NSString*)key;
- (NSArray*)arraySafeForKey:(NSString*)key;
- (NSDictionary*)dictionarySafeForKey:(NSString*)key;
- (NSString*)stringSafeForKey:(NSString*)key;
- (NSMutableArray*)mutableArraySafeForKey:(NSString*)key;
- (NSMutableDictionary*)mutableDictionarySafeForKey:(NSString*)key;
- (NSInteger)integerSafeForKey:(NSString*)key;
- (float)floatSafeForKey:(NSString*)key;
- (double)doubleSafeForKey:(NSString*)key;
- (NSNumber*)numberSafeForKey:(NSString*)key;
- (int)intSafeForKey:(NSString*)key;
@end
