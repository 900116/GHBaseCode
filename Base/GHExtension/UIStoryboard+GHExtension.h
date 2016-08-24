//
//  UIStoryboard+GHExtension.h
//  GoHome
//
//  Created by YongCheHui on 16/6/14.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (GHExtension)
/**
 *  登录页面
 *
 *  @param sbID storyBoardID
 *
 *  @return vc
 */
+(UIViewController *)vcFromMainBundleWithSBID:(NSString *)sbID;
@end
