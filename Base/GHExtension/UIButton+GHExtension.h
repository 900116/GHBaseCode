//
//  UIButton+GHExtension.h
//  GoHome
//
//  Created by YongCheHui on 16/6/17.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (GHExtension)
-(void)addTouchObject:(id)obj event:(SEL)event;
-(void)setNormalImage:(UIImage *)image;
-(void)setSelectImage:(UIImage *)image;
-(void)setNormalTitle:(NSString *)title;
-(void)setNormalTitleColor:(UIColor *)titleColor;
-(void)setSelectTitle:(NSString *)title;
-(void)setSelectTitleColor:(UIColor *)titleColor;
-(void)setTitleFont:(UIFont *)font;
-(void)setTitleFontSize:(CGFloat )fontsize;
-(void)setTitleFontSizeBold:(CGFloat )fontsize;
@end
