//
//  NSMutableDictionary+GHExtension.h
//  GoHome
//
//  Created by YongCheHui on 16/7/21.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (GHExtension)
-(void)safeSave:(NSString*)key value:(id)value;
@end
