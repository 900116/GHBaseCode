//
//  GHMsgError.m
//  GoHome
//
//  Created by ZhaoGuangHui on 16/6/18.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "GHMsgError.h"

@implementation GHMsgError
-(NSString*)description
{
    if (self.errorMsg) {
        return self.errorMsg;
    }
    return [super description];
}

-(NSInteger)code
{
    if (self.errorCode!=0) {
        return self.errorCode;
    }
    return [super code];
}

+(GHMsgError*)msgErrorWithMsg:(NSString*)errorMsg
{
    GHMsgError* error = [[GHMsgError alloc]init];
    error.errorMsg = errorMsg;
    return error;
}
@end
