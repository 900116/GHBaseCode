//
//  NSDictionary+GHExtension.m
//  GoHome
//
//  Created by YongCheHui on 16/6/21.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "NSDictionary+GHExtension.h"

@implementation NSDictionary (GHExtension)


-(NSDictionary *)dictionaryWithKeyValues:(NSArray*)keyValues {
    NSMutableDictionary* mutiDict = [self mutableCopy];
    BOOL isKey = YES;
    NSString* key = nil;
    for (id obj in keyValues) {
        if (isKey) {
            key = obj;
        }
        else
        {
            [mutiDict setObject:obj forKey:key];
        }
        isKey = !isKey;
    }
    return [mutiDict copy];
}

+(NSDictionary *)dictionaryWithPlistName:(NSString*)plist {
    return  [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:plist ofType:@"plist"]];
}

-(id)objectSafeForKey:(NSString *)key class:(Class)cls
{
    id object = nil;
    if([self respondsToSelector:@selector(objectForKey:)] && key){
        object = [self objectForKey:key];
    }
    if(![object isKindOfClass:cls]){
        object = nil;
    }
    return object;
}


- (id)objectSafeForKey:(NSString*)key
{
    return [self objectSafeForKey:key class:[NSObject class]];
}

- (NSArray*)arraySafeForKey:(NSString*)key
{
    return (NSArray*)[self objectSafeForKey:key class:[NSArray class]];
}

- (NSDictionary*)dictionarySafeForKey:(NSString*)key
{
    return (NSDictionary*)[self objectSafeForKey:key class:[NSDictionary class]];
}

- (NSString*)stringSafeForKey:(NSString*)key
{
    id object = nil;
    if([self respondsToSelector:@selector(objectForKey:)] && key){
        object = [self objectForKey:key];
    }
    if([object isKindOfClass:[NSNumber class]]){
        NSNumber*number = (NSNumber*)object;
        object = [number stringValue];
    }
    if(![object isKindOfClass:[NSString class]] && ![object isKindOfClass:[NSNumber class]]){
        object = nil;
    }
    return object;
}

- (NSMutableArray*)mutableArraySafeForKey:(NSString*)key
{
    return (NSMutableArray*)[self objectSafeForKey:key class:[NSMutableArray class]];
}

- (NSMutableDictionary*)mutableDictionarySafeForKey:(NSString*)key
{
    return (NSMutableDictionary*)[self objectSafeForKey:key class:[NSMutableDictionary class]];
}

-(void*)voidpSafeForKey:(NSString *)key selector:(SEL)getSelector
{
    id object = nil;
    void* num = NULL;
    if([self respondsToSelector:@selector(objectForKey:)] && key){
        object = [self objectForKey:key];
    }
    if([object respondsToSelector:getSelector]){
        num = (__bridge void*)[object performSelector:getSelector];
    }
    return num;
}

- (NSInteger)integerSafeForKey:(NSString*)key
{
    NSInteger* p = [self voidpSafeForKey:key selector:@selector(integerValue)];
    return *p;
}

- (float)floatSafeForKey:(NSString*)key
{
    float* p =[self voidpSafeForKey:key selector:@selector(floatValue)];
    return *p;
}

- (double)doubleSafeForKey:(NSString*)key
{
    double* p =[self voidpSafeForKey:key selector:@selector(doubleValue)];
    return *p;
}

- (int)intSafeForKey:(NSString*)key
{
    int* p =[self voidpSafeForKey:key selector:@selector(intValue)];
    return *p;
}

- (NSNumber*)numberSafeForKey:(NSString*)key
{
    id object = nil;
    NSNumber* num = nil;
    if([self respondsToSelector:@selector(objectForKey:)] && key){
        object = [self objectForKey:key];
    }
    if([object isKindOfClass:[NSNumber class]]){
        
        num = (NSNumber*)object;
    } else if ([object isKindOfClass:[NSString class]]) {
        num = [NSNumber numberWithFloat:[object floatValue]];
    }
    
    return num;
}



@end
