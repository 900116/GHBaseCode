//
//  UIButton+GHExtension.m
//  GoHome
//
//  Created by YongCheHui on 16/6/17.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "UIButton+GHExtension.h"

@implementation UIButton (GHExtension)


-(void)addTouchObject:(id)obj event:(SEL)event {
    [self addTarget:obj action:event forControlEvents:UIControlEventTouchUpInside];
}

-(void)setNormalImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateNormal];
}

-(void)setSelectImage:(UIImage *)image {
	[self setImage:image forState:UIControlStateSelected];
}

-(void)setNormalTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateNormal];
}

-(void)setNormalTitleColor:(UIColor *)titleColor
{
    [self setTitleColor:titleColor forState:UIControlStateNormal];
}

-(void)setSelectTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateSelected];
}

-(void)setSelectTitleColor:(UIColor *)titleColor
{
    [self setTitleColor:titleColor forState:UIControlStateSelected];
}

-(void)setTitleFont:(UIFont *)font {
    [self.titleLabel setFont:font];
}

-(void)setTitleFontSize:(CGFloat )fontsize {
	[self.titleLabel setFont:[UIFont systemFontOfSize:fontsize]];
}

-(void)setTitleFontSizeBold:(CGFloat )fontsize {
	[self.titleLabel setFont:[UIFont boldSystemFontOfSize:fontsize]];
}
@end
