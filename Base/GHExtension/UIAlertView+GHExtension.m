//
//  UIAlertView+GHExtension.m
//  GoHome
//
//  Created by YongCheHui on 16/6/24.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "UIAlertView+GHExtension.h"
#import <objc/runtime.h>
static char* const UIAlertView_key_clicked = "alertviewKey";
static char* const UIAlertView_key_willShow = "alertviewshowKey";
@implementation UIAlertView (GHExtension)

-(void)handlerWillPresent:(void (^)(void))aBlock
{
    self.delegate = self;
    objc_setAssociatedObject(self, UIAlertView_key_willShow, aBlock, OBJC_ASSOCIATION_COPY);
}


-(UIAlertView*) setClicHandler:(void (^)(UIAlertView*alertView,NSInteger btnIndex))aBlock{
    self.delegate = self;
    objc_setAssociatedObject(self, UIAlertView_key_clicked, aBlock, OBJC_ASSOCIATION_COPY);
    return self;
}

- (void)willPresentAlertView:(UIAlertView *)alertView{
     void (^block)() = objc_getAssociatedObject(self, UIAlertView_key_willShow);
    if (block) {
        block();
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    void (^block)(UIAlertView*alertView,NSInteger btnIndex) = objc_getAssociatedObject(self, UIAlertView_key_clicked);
    if (block) block(alertView,buttonIndex);
}

+(instancetype)showAlertViewNoCancelWithTitle:(NSString *)title actions:(NSArray *)actions handler:(void (^)(UIAlertView*,NSInteger))aBlock {
    UIAlertView *sheet = [[UIAlertView alloc] init];
    sheet.title = title;
    for (NSString* title in actions) {
        [sheet addButtonWithTitle:title];
    }
    sheet.cancelButtonIndex = 0;
    [sheet setClicHandler:aBlock];
    return sheet;
}

#define ShowAlert3(title,block,action,...) \
[[[UIAlertView alloc] initWithTitle:title message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:(action), ##__VA_ARGS__] setClicHandler:block]; \


+(instancetype)showAlertViewWithTitle:(NSString *)title handler:(void (^)(UIAlertView*,NSInteger))aBlock actions:(NSString*)action,...{
//    UIAlertView *sheet = [[UIAlertView alloc] initWithTitle:title message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
//    [sheet setClicHandler:aBlock];
    return ShowAlert3(title,aBlock,@"确定",nil);
}

-(UIDatePicker *)addDatePicker:(UIDatePickerMode)mode{
    UIDatePicker* v = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0, self.width, 100)];
    v.maximumDate = [NSDate new];
    v.datePickerMode = mode;
    [self setValue:v forKey:@"accessoryView"];
    return v;
}

-(void)addPicker:(UIPickerView*)pickerView {
    [self setValue:pickerView forKey:@"accessoryView"];
}

@end
