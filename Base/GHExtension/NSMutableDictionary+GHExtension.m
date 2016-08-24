//
//  NSMutableDictionary+GHExtension.m
//  GoHome
//
//  Created by YongCheHui on 16/7/21.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "NSMutableDictionary+GHExtension.h"

@implementation NSMutableDictionary (GHExtension)

-(void)safeSave:(NSString*)key value:(id)value {
    if (key && value) {
        [self setObject:value forKey:key];
    }
}
@end
