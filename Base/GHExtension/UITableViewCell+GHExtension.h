//
//  UITableViewCell+GHExtension.h
//  GoHome
//
//  Created by YongCheHui on 16/6/17.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (GHExtension)
-(NSString *)textStr;
-(void)setTextStr:(NSString *)textStr;
-(void)setTextColor:(UIColor *)color;

-(NSString *)detailStr;
-(void)setDetailStr:(NSString *)detailStr;
-(void)setDetailColor:(UIColor *)color;
-(UIImage*)image;
-(void)setImage:(UIImage *)image;
@end
