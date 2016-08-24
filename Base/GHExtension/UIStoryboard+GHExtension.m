//
//  UIStoryboard+GHExtension.m
//  GoHome
//
//  Created by YongCheHui on 16/6/14.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "UIStoryboard+GHExtension.h"

@implementation UIStoryboard (GHExtension)


+(UIViewController *)vcFromMainBundleWithSBID:(NSString *)sbID {
    return [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:sbID];
}
@end
