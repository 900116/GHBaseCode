//
//  UIImage+GHBase.h
//  GoHome
//
//  Created by YongCheHui on 16/6/17.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GHExtension)
-(CGFloat)width;
-(CGFloat)height;
- (UIImage *)scaleToSize:(CGSize)size;
- (UIImage *)scaleToWithMinSize;
//- (UIImage *)imageWithFillColor:(UIColor *)fillColor blendMode:(CGBlendMode)blendMode;
- (UIImage *)imageWithTintColor:(UIColor *)tintColor;
- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor;
- (UIImage *)imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode;
@end
