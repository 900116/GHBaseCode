//
//  UIView+GHBase.h
//  GoHome
//
//  Created by YongCheHui on 16/6/17.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GHExtension)
#pragma mark frame
-(void)setX:(CGFloat)x;
-(CGFloat)x;
-(CGFloat)maxX;

-(void)setY:(CGFloat)y;
-(CGFloat)y;
-(CGFloat)maxY;

-(void)setWidth:(CGFloat)w;
-(CGFloat)width;

-(void)setHeight:(CGFloat)h;
-(CGFloat)height;

-(void)setOrign:(CGPoint)p;
-(void)setSize:(CGSize)s;

#pragma mark addGesture
-(UITapGestureRecognizer*)addTapGesture:(id)obj sel:(SEL)selector;
-(UITapGestureRecognizer*)addTapGesture:(id)obj sel:(SEL)selector number:(NSInteger)taps;
-(UITapGestureRecognizer*)addTapGesture:(id)obj sel:(SEL)selector delegate:(id<UIGestureRecognizerDelegate>)delegate;
-(UITapGestureRecognizer*)addTapGesture:(id)obj sel:(SEL)selector number:(NSInteger)taps delegate:(id<UIGestureRecognizerDelegate>)delegate;

-(UIPanGestureRecognizer*)addPanGesture:(id)obj sel:(SEL)selector;
-(UIPanGestureRecognizer*)addPanGesture:(id)obj sel:(SEL)selector delegate:(id<UIGestureRecognizerDelegate>)delegate;
-(UIPanGestureRecognizer*)addPanGesture:(id)obj sel:(SEL)selector minTaps:(NSInteger)minTaps maxTaps:(NSInteger)maxTaps delegate:(id<UIGestureRecognizerDelegate>)delegate;

#pragma mark extension
-(UIImage*)drawImage;
-(UIImage*)drawImage:(BOOL)opaque;
-(void)setUserInfo:(id)userInfo;
-(id)userInfo;

#pragma mark autolayout
-(void)al_equalSuperOrign:(CGPoint)pt xlc:(NSLayoutConstraint**)xlc ylc:(NSLayoutConstraint**)ylc;
-(void)al_equalSuperX;
-(void)al_equalSuperMaxX;
-(void)al_equalSuperCenterY;
-(void)al_equalSuperY;
-(void)al_equalSuperMaxY;
-(void)al_equalSuperH;
-(void)al_equalSuperW;
-(void)al_otherWidth:(UIView*)view;
-(void)al_otherY:(UIView*)view;
-(void)al_toRight:(UIView*)view;
-(void)al_equalWidth:(CGFloat)width;
-(void)al_equalHeight:(CGFloat)height;
-(void)al_paddingRight:(CGFloat)padding toView:(UIView*)view;
-(void)al_paddingBottom:(CGFloat)padding toView:(UIView*)view;
@end
