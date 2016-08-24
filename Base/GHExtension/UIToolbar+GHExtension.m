//
//  UIToolbar+GHExtension.m
//  GoHome
//
//  Created by YongCheHui on 16/8/2.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "UIToolbar+GHExtension.h"

@implementation UIToolbar (GHExtension)

+(instancetype)inputAccessoryViewToolBarWithTitle:(NSString*)title target:(id)target action:(SEL)action {
    UIToolbar* toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, Screen_Width(), 44)];
    UIBarButtonItem *btnPlace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem*item = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStyleDone target:target action:action];
    toolbar.items = @[btnPlace,btnPlace,btnPlace,btnPlace,item];
    return toolbar;
}
@end
