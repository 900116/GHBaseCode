//
//  UIToolbar+GHExtension.h
//  GoHome
//
//  Created by YongCheHui on 16/8/2.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIToolbar (GHExtension)
+(instancetype)inputAccessoryViewToolBarWithTitle:(NSString*)title target:(id)target action:(SEL)action;
@end
