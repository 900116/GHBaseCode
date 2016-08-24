//
//  GHImagePickerController.m
//  GoHome
//
//  Created by YongCheHui on 16/6/23.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "GHImagePickerController.h"
#import <objc/runtime.h>
static char* const UIImagePicker_key_Received = "imagePickerKey";

@implementation GHImagePickerController
-(void)setReciceImageHandler:(void (^)(UIImage* image))aBlock {
    objc_setAssociatedObject(self, UIImagePicker_key_Received, aBlock, OBJC_ASSOCIATION_COPY);
    self.delegate = self;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    void (^block)(UIImage* image) = objc_getAssociatedObject(self, UIImagePicker_key_Received);
    if (block) {
        block(info[@"UIImagePickerControllerOriginalImage"]);
    }
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
}

@end
