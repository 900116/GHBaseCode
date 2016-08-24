//
//  GHBaseVC.h
//  GoHome
//
//  Created by YongCheHui on 16/6/14.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  VC基类
 */
@interface GHBaseVC : UIViewController
/**
 *  查看某个页面是否在显示
 *
 *  @param cls VC类
 *
 *  @return 是否显示
 */
+(BOOL)viewControllerShow:(Class)cls;

-(void)addNaviBack;
-(void)addRightItem:(NSString*)title action:(SEL)action;
-(void)addRightItemWithImage:(UIImage*)image action:(SEL)action;
@property(nonatomic,assign) BOOL showNavi;
@end
