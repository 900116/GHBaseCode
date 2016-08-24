//
//  GHTextField.m
//  GoHome
//
//  Created by YongCheHui on 16/6/14.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "GHTextField.h"

@implementation GHTextField
{
    BOOL _typeDraw;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self  = [super initWithCoder:aDecoder];
    if (self) {
        _typeDraw = YES;
        self.delegate = self;
    }
    return self;
}

CGRect keyWindowOriginRect;

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    keyWindowOriginRect = sys_keyWindow().frame;
    CGRect rect = [self convertRect:CGRectZero fromView:sys_appDelegater().window];
    CGFloat height = Screen_Height() + rect.origin.y - (256.0 + self.frame.size.height);
    if (height < 0) {
        UIWindow* window = sys_keyWindow();
        window.y += height;        
    }
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    sys_keyWindow().frame = keyWindowOriginRect;
    if (self.gh_ReturenKeyEvent) {
        self.gh_ReturenKeyEvent();
    }
    return YES;
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    if (_typeDraw) {
        // Drawing code.
        //获得处理的上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        //设置线条样式
        CGContextSetLineCap(context, kCGLineCapSquare);
        //设置线条粗细宽度
        CGContextSetLineWidth(context, 1.0);
        //设置颜色
        UIColor* drawColor = self.lineColor?self.lineColor:RGB(142, 179, 255);
        CGContextSetStrokeColorWithColor(context, drawColor.CGColor);
        //开始一个起始路径
        CGContextBeginPath(context);
        //起始点设置为(0,0):注意这是上下文对应区域中的相对坐标，
        CGContextMoveToPoint(context, 0, self.height);
        CGContextAddLineToPoint(context, self.width, self.height);
        //连接上面定义的坐标点
        CGContextStrokePath(context);
    }
}

-(instancetype)initWithFrame:(CGRect)frame typeDraw:(BOOL)typeDraw {
    self = [self initWithFrame:frame];
    if (self) {
        self.delegate = self;
        _typeDraw = typeDraw;
    }
    return self;
}
@end
