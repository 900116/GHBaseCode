//
//  UIScreen+GHExtension.m
//  GoHome
//
//  Created by YongCheHui on 16/7/21.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "UIScreen+GHExtension.h"

@implementation UIScreen (GHExtension)


+(NSInteger)Screenscale {
    if (is5_5Inch()) {
        return 3;
    }
    return 2;
}
@end
