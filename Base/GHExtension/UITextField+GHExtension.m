//
//  UITextField+GHExtension.m
//  GoHome
//
//  Created by YongCheHui on 16/6/17.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "UITextField+GHExtension.h"

@implementation UITextField (GHExtension)
-(void)setFontSize:(CGFloat)fontSize {
    [self setFont:[UIFont systemFontOfSize:fontSize]];
}

-(void)setFontSizeBold:(CGFloat)fontSize {
    [self setFont:[UIFont boldSystemFontOfSize:fontSize]];
}
@end
