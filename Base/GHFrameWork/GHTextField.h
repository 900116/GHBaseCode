//
//  GHTextField.h
//  GoHome
//
//  Created by YongCheHui on 16/6/14.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GHTextField : UITextField<UITextFieldDelegate>
-(instancetype)initWithFrame:(CGRect)frame typeDraw:(BOOL)typeDraw;
@property(nonatomic,strong) UIColor * lineColor;
@property(nonatomic,copy) void(^gh_ReturenKeyEvent)();
@end
