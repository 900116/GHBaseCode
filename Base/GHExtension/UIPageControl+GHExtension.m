//
//  UIPageControl+GHExtension.m
//  GoHome
//
//  Created by YongCheHui on 16/7/4.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "UIPageControl+GHExtension.h"

@implementation UIPageControl (GHExtension)


-(void)addValueChange:(id)obj sel:(SEL)seletor {
    [self addTarget:obj action:seletor forControlEvents:UIControlEventValueChanged];
}
@end
