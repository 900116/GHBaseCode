//
//  UIViewController+GHExtension.h
//  GoHome
//
//  Created by YongCheHui on 16/6/17.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+GHExtension.h"

@interface UIViewController (GHExtension)
#pragma mark self.bar
-(void)pushVC:(UIViewController *)vc;
-(void)pushVCAnimation:(UIViewController *)vc;
-(void)pushVCHideBottom:(UIViewController *)vc;
-(void)pushVCHideBottomAnimation:(UIViewController *)vc;
-(void)pop;
-(void)popAnimation;
-(void)popToVC:(UIViewController*)vc;
-(void)popToVCAnimation:(UIViewController*)vc;
-(void)popToLastIndexVC:(NSInteger)idx;
-(void)popToLastIndexVCAnimation:(NSInteger)idx;
-(void)hideNaviBar;
-(void)hideNaviBarAnimation;
-(void)showNaviBar;
-(void)showNaviBarAnimation;
-(UINavigationBar*)naviBar;
-(UITabBar*)tabbar;

#pragma mark self.view
-(void)setBackgroundColor:(UIColor *)color;
-(void)setFrame:(CGRect)frame;
-(CGRect)frame;
-(CGRect)bounds;
-(void)addSubView:(UIView*)subView;
-(UIWindow*)window;
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
@end
