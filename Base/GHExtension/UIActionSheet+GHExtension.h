//
//  UIActionSheet+GHExtension.h
//  GoHome
//
//  Created by YongCheHui on 16/6/23.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActionSheet (GHExtension)<UIActionSheetDelegate>
-(void)setClicHandler:(void (^)(NSInteger btnIndex))aBlock;
+(instancetype)showActoinSheetWithTitle:(NSString*)title actions:(NSArray *)actions handler:(void (^)(NSInteger btnIndex))aBlock;
+(void)showSelectPhotoActionSheet:(UIViewController*)vc imageHandler:(void(^)(UIImage* image))imageHandler;
@end
