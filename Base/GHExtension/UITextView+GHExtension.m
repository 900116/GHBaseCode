//
//  UITextView+GHExtension.m
//  GoHome
//
//  Created by YongCheHui on 16/6/17.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "UITextView+GHExtension.h"

@implementation UITextView (GHExtension)
-(void)setFontSize:(CGFloat)fontSize {
    [self setFont:[UIFont systemFontOfSize:fontSize]];
}

-(void)setFontSizeBold:(CGFloat)fontSize {
    [self setFont:[UIFont boldSystemFontOfSize:fontSize]];
}

-(void)inputAccessoryViewToolBarWithTitle:(NSString*)title{
    UIToolbar *tBar = [UIToolbar inputAccessoryViewToolBarWithTitle:title target:self action:@selector(resignFirstResponder)];
    self.inputAccessoryView = tBar;
}
@end
