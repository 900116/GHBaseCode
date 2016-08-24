//
//  GHMsgError.h
//  GoHome
//
//  Created by ZhaoGuangHui on 16/6/18.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GHMsgError : NSError
@property(nonatomic,copy)NSString* errorMsg;
@property(nonatomic,assign)NSInteger errorCode;
+(GHMsgError*)msgErrorWithMsg:(NSString*)errorMsg;
@end
