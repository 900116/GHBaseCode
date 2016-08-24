//
//  YCInputDestrictTextView.h
//  yidao_driver
//
//  Created by YongCheHui on 15/8/7.
//  Copyright (c) 2015年 yongche. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  输入限制TextView
 *  @author ZGH
 *  @version 1.2.1
 *  @since 1.2.1
 *  @date 2015-08-07
 */
@interface GHInputDestrictTextView : UITextView
/**
 *  可以输入的总字数
 */
@property(nonatomic,assign) NSInteger inputCount;
/**
 *  输入长度变化通知
 */
@property(nonatomic,copy) void(^textLengthChange)(NSInteger length);
/**
 *  正则表达式
 */
@property(nonatomic,copy) NSString *regex;
/**
 *  非空
 */
@property(nonatomic,assign) BOOL isNotNull;
/**
 *  是否合法
 */
@property(nonatomic,copy) void(^IsValite)(BOOL valite);
/**
 *  触摸了输入框
 */
@property(nonatomic,copy) void(^touchBegan)();
/*
 *  占位文字
 */
@property(nonatomic,copy) NSString* placeHolder;
/**
 *  占位文字颜色
 */
@property(nonatomic,strong) UIColor *placeHolderTextColor;
/**
 *  占位文字位置(基于Autolayout)
 */
@property(nonatomic,assign) CGPoint placeHolderPoint;

/**
 *  是否禁止键盘弹出
 */
@property(nonatomic,assign) BOOL ShowKeyborad;
/**
 *  是否显示placeHolder
 */
@property (nonatomic, assign) BOOL showPlaceHolder;

/**
 *  返回按钮关闭键盘
 */
@property(nonatomic,assign) BOOL returnKeyResign;

/**
 *  需要toolbar
 */
@property(nonatomic,assign) BOOL needToolBarResign;
@end

