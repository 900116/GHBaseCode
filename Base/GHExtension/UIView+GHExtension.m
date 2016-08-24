//
//  UIView+GHBase.m
//  GoHome
//
//  Created by YongCheHui on 16/6/17.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "UIView+GHExtension.h"
#import "UIScreen+GHExtension.h"
#import <objc/runtime.h>

@implementation UIView (GHExtension)


-(void)setX:(CGFloat)x {
    if (self.frame.origin.x == x) {
        return;
    }
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}

-(CGFloat)x {
    return self.frame.origin.x;
}

-(CGFloat)maxX {
    return self.x+self.width;
}

-(void)setY:(CGFloat)y {
    if (self.frame.origin.y == y) {
        return;
    }
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}


-(CGFloat)y {
    return self.frame.origin.y;
}

-(CGFloat)maxY {
    return self.y+self.height;
}

-(void)setWidth:(CGFloat)w {
    if (self.frame.size.width == w) {
        return;
    }
    CGRect rect = self.frame;
    rect.size.width = w;
    self.frame = rect;
}


-(CGFloat)width {
    return self.frame.size.width;
}

-(void)setHeight:(CGFloat)h {
    if (self.frame.size.height == h) {
        return;
    }
    CGRect rect = self.frame;
    rect.size.height = h;
    self.frame = rect;
}


-(CGFloat)height {
    return self.frame.size.height;
}

-(void)setOrign:(CGPoint)p {
    CGRect rect = self.frame;
    rect.origin.x = p.x;
    rect.origin.y = p.y;
    self.frame = rect;
}

-(void)setSize:(CGSize)s {
    CGRect rect = self.frame;
    rect.size.width = s.width;
    rect.size.height = s.height;
    self.frame = rect;
}

-(UITapGestureRecognizer*)addTapGesture:(id)obj sel:(SEL)selector {
    return [self addTapGesture:obj sel:selector number:1];
}

-(UITapGestureRecognizer*)addTapGesture:(id)obj sel:(SEL)selector number:(NSInteger)taps {
    return [self addTapGesture:obj sel:selector number:taps delegate:nil];
}

-(UITapGestureRecognizer*)addTapGesture:(id)obj sel:(SEL)selector delegate:(id<UIGestureRecognizerDelegate>)delegate
{
    return [self addTapGesture:obj sel:selector number:-1 delegate:delegate];
}

-(UITapGestureRecognizer*)addTapGesture:(id)obj sel:(SEL)selector number:(NSInteger)taps delegate:(id<UIGestureRecognizerDelegate>)delegate {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc]initWithTarget:obj action:selector];
    if (taps > 0) {
        gesture.numberOfTapsRequired = taps;
    }
    if (delegate) {
        gesture.delegate = delegate;
    }
    [self addGestureRecognizer:gesture];
    return gesture;
}

-(UIPanGestureRecognizer*)addPanGesture:(id)obj sel:(SEL)selector {
    return [self addPanGesture:obj sel:selector minTaps:-1 maxTaps:-1 delegate:nil];
}

-(UIPanGestureRecognizer*)addPanGesture:(id)obj sel:(SEL)selector delegate:(id<UIGestureRecognizerDelegate>)delegate
{
    return [self addPanGesture:obj sel:selector minTaps:-1 maxTaps:-1 delegate:delegate];
}

-(UIPanGestureRecognizer*)addPanGesture:(id)obj sel:(SEL)selector minTaps:(NSInteger)minTaps maxTaps:(NSInteger)maxTaps delegate:(id<UIGestureRecognizerDelegate>)delegate {
    self.userInteractionEnabled = YES;
	   UIPanGestureRecognizer* gesture = [[UIPanGestureRecognizer alloc]initWithTarget:obj action:selector];
    if (minTaps > 0) {
        gesture.minimumNumberOfTouches = minTaps;
    }
    if (maxTaps > 0) {
        gesture.maximumNumberOfTouches = maxTaps;
    }
    if (delegate) {
        gesture.delegate = delegate;
    }
    [self addGestureRecognizer:gesture];
    return gesture;
}

-(UIImage*)drawImage:(BOOL)opaque
{
    CGRect rect = self.frame;
    UIGraphicsBeginImageContextWithOptions(rect.size, opaque, [UIScreen Screenscale]);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

-(UIImage*)drawImage
{
    CGRect rect = self.frame;
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, [UIScreen Screenscale]);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

static const char * gh_ViewUserInfo = "ghViewUserInfoKey";

-(void)setUserInfo:(id)userInfo {
    objc_setAssociatedObject(self, gh_ViewUserInfo, userInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(id)userInfo {
    return objc_getAssociatedObject(self, gh_ViewUserInfo);
}

-(void)al_equalSuperOrign:(CGPoint)pt xlc:(NSLayoutConstraint**)xlc ylc:(NSLayoutConstraint**)ylc {
    NSLayoutConstraint *contraintX = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeLeft multiplier:1 constant:pt.x];
    *xlc = contraintX;
    NSLayoutConstraint *contraintY = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTop multiplier:1 constant:pt.y];
    *ylc = contraintY;
    [self.superview addConstraints:@[contraintX,contraintY]];
}

-(void)al_equalSuperX {
    NSLayoutConstraint *contraintX = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    [self.superview addConstraint:contraintX];
}

-(void)al_equalSuperMaxX {
    NSLayoutConstraint *contraintX = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    [self.superview addConstraint:contraintX];
}


-(void)al_equalSuperCenterY {
    NSLayoutConstraint *contraintY = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [self.superview addConstraint:contraintY];
}

-(void)al_equalSuperY {
    NSLayoutConstraint *contraintY = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [self.superview addConstraint:contraintY];
}

-(void)al_equalSuperMaxY {
    NSLayoutConstraint *contraintX = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [self.superview addConstraint:contraintX];
}

-(void)al_equalSuperH {
    NSLayoutConstraint *contraintH = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    [self.superview addConstraint:contraintH];
}

-(void)al_equalSuperW
{
    NSLayoutConstraint *contraintH = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    [self.superview addConstraint:contraintH];
}

-(void)al_otherWidth:(UIView*)view {
    NSLayoutConstraint *contraintH = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    [self.superview addConstraint:contraintH];
}

-(void)al_otherY:(UIView*)view {
    NSLayoutConstraint *contraintY = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [self.superview addConstraint:contraintY];
}

-(void)al_toRight:(UIView*)view {
    NSLayoutConstraint *contraintY = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    [self.superview addConstraint:contraintY];
}

-(void)al_equalWidth:(CGFloat)width {
    NSLayoutConstraint *contraintY = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:width];
    [self addConstraint:contraintY];
}

-(void)al_equalHeight:(CGFloat)height {
    NSLayoutConstraint *contraintY = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:height];
    [self addConstraint:contraintY];
}

-(void)al_paddingRight:(CGFloat)padding toView:(UIView *)view{
    NSLayoutConstraint *contraintY = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeRight multiplier:1 constant:-padding];
    [self.superview addConstraint:contraintY];

}

-(void)al_paddingBottom:(CGFloat)padding toView:(UIView *)view{
    NSLayoutConstraint *contraintY = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1 constant:-padding];
    [self.superview addConstraint:contraintY];
}



@end
