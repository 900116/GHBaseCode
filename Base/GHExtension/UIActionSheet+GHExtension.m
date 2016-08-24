//
//  UIActionSheet+GHExtension.m
//  GoHome
//
//  Created by YongCheHui on 16/6/23.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "UIActionSheet+GHExtension.h"
#import <objc/runtime.h>
#import "GHImagePickerController.h"
static char* const UIActionSheet_key_clicked = "actionSheetKey";

@implementation UIActionSheet (GHExtension)
-(void) setClicHandler:(void (^)(NSInteger btnIndex))aBlock{
    self.delegate = self;
    objc_setAssociatedObject(self, UIActionSheet_key_clicked, aBlock, OBJC_ASSOCIATION_COPY);
}

-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    void (^block)(NSInteger btnIndex) = objc_getAssociatedObject(self, UIActionSheet_key_clicked);
    if (block) block(buttonIndex);
}

+(instancetype)showActoinSheetWithTitle:(NSString*)title actions:(NSArray *)actions handler:(void (^)(NSInteger btnIndex))aBlock {
    UIActionSheet *sheet = [[UIActionSheet alloc] init];
    sheet.title = title;
    for (NSString* title in actions) {
        [sheet addButtonWithTitle:title];
    }
    [sheet addButtonWithTitle:@"取消"];
    sheet.cancelButtonIndex = actions.count;
    [sheet setClicHandler:aBlock];
    return sheet;
}

+(void)showSelectPhotoActionSheet:(UIViewController*)vc imageHandler:(void(^)(UIImage* image))imageHandler
{
   [[UIActionSheet showActoinSheetWithTitle:@"请选择" actions:@[@"从相册选择",@"拍照"] handler:^(NSInteger btnIndex) {
        if (btnIndex < 2) {
            GHImagePickerController* imagePicker = [[GHImagePickerController alloc]init];
            imagePicker.sourceType = btnIndex == 0?UIImagePickerControllerSourceTypePhotoLibrary:UIImagePickerControllerSourceTypeCamera;
            [imagePicker setReciceImageHandler:^(UIImage *image) {
                imageHandler(image);
            }];
            [vc presentViewController:imagePicker animated:YES completion:nil];
        }
    }] showInView:vc.window];
}
@end
