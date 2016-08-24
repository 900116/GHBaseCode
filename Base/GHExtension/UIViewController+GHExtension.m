//
//  UIViewController+GHExtension.m
//  GoHome
//
//  Created by YongCheHui on 16/6/17.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "UIViewController+GHExtension.h"

@implementation UIViewController (GHExtension)


-(void)pushVC:(UIViewController *)vc{
    [self.navigationController pushViewController:vc animated:NO];
}

-(void)pushVCAnimation:(UIViewController *)vc {
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)pushVCHideBottom:(UIViewController *)vc {
    vc.hidesBottomBarWhenPushed = YES;
    [self pushVC:vc];
}

-(void)pushVCHideBottomAnimation:(UIViewController *)vc {
    vc.hidesBottomBarWhenPushed = YES;
    [self pushVCAnimation:vc];
}

-(void)pop {
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)popAnimation {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)popToVC:(UIViewController*)vc
{
    [self.navigationController popToViewController:vc animated:NO];
}

-(void)popToVCAnimation:(UIViewController*)vc
{
    [self.navigationController popToViewController:vc animated:YES];
}

-(void)popToLastIndexVC:(NSInteger)idx{
    NSArray* vcs = self.navigationController.viewControllers;
    UIViewController * vc = vcs[vcs.count-idx];
    [self popToVC:vc];
}

-(void)popToLastIndexVCAnimation:(NSInteger)idx
{
    NSArray* vcs = self.navigationController.viewControllers;
    UIViewController * vc = vcs[vcs.count-idx];
    [self popToVCAnimation:vc];
}


-(void)hideNaviBar {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void)hideNaviBarAnimation {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)showNaviBar {
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

-(void)showNaviBarAnimation {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(UINavigationBar*)naviBar {
    return self.navigationController.navigationBar;
}

-(UITabBar*)tabbar {
    return self.tabBarController.tabBar;
}

-(void)setBackgroundColor:(UIColor *)color {
    [self.view setBackgroundColor:color];
}

-(void)setFrame:(CGRect)frame {
    [self.view setFrame:frame];
}

-(CGRect)frame {
    return self.view.frame;
}

-(CGRect)bounds {
    return self.view.bounds;
}

-(void)addSubView:(UIView*)subView {
    [self.view addSubview:subView];
}

-(UIWindow*)window {
    return self.view.window;
}


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
@end
