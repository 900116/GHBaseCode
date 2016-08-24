//
//  UILabel+GHExtension.m
//  GoHome
//
//  Created by YongCheHui on 16/6/17.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "UILabel+GHExtension.h"
#import <objc/runtime.h>

@implementation UILabel (GHExtension)
//+(void)load
//{
//    Method ori_Method =  class_getInstanceMethod([UILabel class], @selector(setText:));
//    Method my_Method = class_getInstanceMethod([UILabel class], @selector(setMyText:));
//    method_exchangeImplementations(ori_Method, my_Method);
//}
//
//-(void)setMyText:(NSString *)text
//{
//    if ([self.superview isKindOfClass:NSClassFromString(@"UIDatePickerWeekMonthDayView")]) {
//        [self setMyText:[NSString stringWithFormat:@"%@前",text]];
//        return;
//    }
//    [self setMyText:text];
//}


-(void)setFontSize:(CGFloat)fontSize {
    [self setFont:[UIFont systemFontOfSize:fontSize]];
}

-(void)setFontSizeBold:(CGFloat)fontSize {
    [self setFont:[UIFont boldSystemFontOfSize:fontSize]];
}
@end
