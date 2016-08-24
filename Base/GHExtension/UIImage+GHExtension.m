//
//  UIImage+GHBase.m
//  GoHome
//
//  Created by YongCheHui on 16/6/17.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "UIImage+GHExtension.h"

@implementation UIImage (GHExtension)


-(CGFloat)width {
    return self.size.width;
}

-(CGFloat)height {
    return self.size.height;
}


- (UIImage *)scaleToSize:(CGSize)size{
    if (size.width > self.width) {
        return self;
    }
    size.height = (size.width/self.width)*self.height;
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0,0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    return scaledImage;
}

- (UIImage *)scaleToWithMinSize {
    CGFloat minSize = MIN(self.width, self.height);
    CGSize size = CGSizeMake(minSize, minSize);
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0,0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    return scaledImage;
}

//- (UIImage *)imageWithFillColor:(UIColor *)fillColor blendMode:(CGBlendMode)blendMode
//
//{
//    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
//    [fillColor setFill];
//    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
//    UIRectFill(bounds);
//    //Draw the tinted image in context
//    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
//    if (blendMode != kCGBlendModeDestinationIn) {
//        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
//    }
//    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return tintedImage;
//}

- (UIImage *) imageWithTintColor:(UIColor *)tintColor
{
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeDestinationIn];
}

- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor
{
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeOverlay];
}

- (UIImage *) imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode
{
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    }
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}
@end
