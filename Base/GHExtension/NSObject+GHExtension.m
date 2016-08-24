//
//  NSObject+GHExtension.m
//  GoHome
//
//  Created by YongCheHui on 16/8/2.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "NSObject+GHExtension.h"

@implementation NSObject (GHExtension)

+(instancetype)gh_ObjectWithDict:(NSDictionary*)dict {
    id obj = [self new];
    /*
     通常我我们使用的方法是setValueForKey，但是当我们进行批量操作的时候
     系统为我们实现了将整个字典，通过KVC赋值到对象，
     不过当我们的字典的key在属性里面没有的时候，系统会抛一个UndefinedKey的异常，导致程序崩溃
     */
    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}

/*
 由于上面讲的，字典的key在属性里面没有的时候，程序崩溃，所以我们可以通过重写下面方法来避免崩溃
 （因为系统的默认实现就是抛异常，所以重写该方法就不会崩溃，这很好理解）
 */
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    //我们通过gh_exchangeDict方法，给调用方一次匹配的机会，比如我们的字典和属性都有，但是不匹配，这时候我们需要存储一个对应关系
    //默认的实现就是return nil
    NSDictionary* exchangeDict = [self gh_exchangeDict];
    if (exchangeDict) {
        //当匹配字典存在的时候，通过字典key得到属性名
        NSString*  newKey = exchangeDict[key];
        //kvc赋值
        [self setValue:value forKey:newKey];
    }
}

-(NSDictionary *)gh_exchangeDict
{
    return nil;
}
@end
