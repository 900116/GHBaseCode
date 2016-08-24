//
//  UITextView+GHExtension.h
//  GoHome
//
//  Created by YongCheHui on 16/6/17.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (GHExtension)
-(void)setFontSize:(CGFloat)fontSize;
-(void)setFontSizeBold:(CGFloat)fontSize;
-(void)inputAccessoryViewToolBarWithTitle:(NSString*)title;
@end
