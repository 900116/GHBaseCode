//
//  NSObject+GHExtension.h
//  GoHome
//
//  Created by YongCheHui on 16/8/2.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (GHExtension)
+(instancetype)gh_ObjectWithDict:(NSDictionary*)dict;
-(NSDictionary*)gh_exchangeDict;
@end
