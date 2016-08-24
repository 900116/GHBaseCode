//
//  UIAlertView+GHExtension.h
//  GoHome
//
//  Created by YongCheHui on 16/6/24.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (GHExtension)<UIAlertViewDelegate>

//+(instancetype)showAlertViewWithTitle:(NSString *)title handler:(void (^)(UIAlertView*,NSInteger))aBlock actions:(NSString*)action,...;
+(instancetype)showAlertViewNoCancelWithTitle:(NSString *)title actions:(NSArray *)actions handler:(void (^)(UIAlertView*,NSInteger))aBlock;
-(void)handlerWillPresent:(void (^)(void))aBlock;
-(UIDatePicker *)addDatePicker:(UIDatePickerMode)mode;
-(void)addPicker:(UIPickerView*)pickerView;

-(UIAlertView*) setClicHandler:(void (^)(UIAlertView*alertView,NSInteger btnIndex))aBlock;

#define ShowAlert3(title,block,action,...) \
[[[UIAlertView alloc] initWithTitle:title message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:(action), ##__VA_ARGS__] setClicHandler:block]; \

@end
