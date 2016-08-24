//
//  GHImagePickerController.h
//  GoHome
//
//  Created by YongCheHui on 16/6/23.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GHImagePickerController : UIImagePickerController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
-(void)setReciceImageHandler:(void (^)(UIImage* image))aBlock;
@end
