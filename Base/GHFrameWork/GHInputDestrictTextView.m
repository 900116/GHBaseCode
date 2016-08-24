//
//  YCInputDestrictTextView.m
//  yidao_driver
//
//  Created by YongCheHui on 15/8/7.
//  Copyright (c) 2015年 yongche. All rights reserved.
//

#import "GHInputDestrictTextView.h"
@interface GHInputDestrictTextView()<UITextViewDelegate>
@property(nonatomic,weak) UILabel * placeHolderLab;
@end

@implementation GHInputDestrictTextView
{
    __weak NSLayoutConstraint* _placeholderX;
    __weak NSLayoutConstraint* _placeholderY;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
         [self initial];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
         [self initial];
    }
    return self;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self initial];
    }
    return self;
}

-(void)initial
{
    self.delegate = self;
    self.text = @"";
    self.ShowKeyborad = YES;
    //[self setTintColor:LightTextGray];
    UILabel *lab = [[UILabel alloc]init];
    lab.textColor = RGB(153, 153, 153);
    lab.font = [UIFont systemFontOfSize:15];
    lab.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:lab];
    self.placeHolderLab = lab;
    _placeHolderPoint = CGPointMake(5, 7);
    WEAK_SELF;
    gcd_after(0.05, ^{
        if (weakself.needToolBarResign) {
            [weakself inputAccessoryViewToolBarWithTitle:@"完成"];
        }
    });
}

-(void)layoutSubviews
{
    NSLayoutConstraint* xlc = nil;
    NSLayoutConstraint* ylc = nil;
    [self.placeHolderLab al_equalSuperOrign:self.placeHolderPoint xlc:&xlc ylc:&ylc];
    _placeholderX = xlc;
    _placeholderY = ylc;
    [super layoutSubviews];
}

#pragma mark PlaceHolder
//placeHolder的距离
- (void)setPlaceHolderPoint:(CGPoint)placeHolderPoint
{
    if (!CGPointEqualToPoint(placeHolderPoint, _placeHolderPoint)) {
        _placeHolderPoint = placeHolderPoint;
        _placeholderX.constant = placeHolderPoint.x;
        _placeholderY.constant = placeHolderPoint.y;
    }
}

//是否显示placeHolder
- (void)setShowPlaceHolder:(BOOL)showPlaceHolder {
    self.placeHolderLab.hidden = !showPlaceHolder;
}

//设置placeHolder
-(void)setPlaceHolder:(NSString *)placeHolder
{
    if (placeHolder) {
        self.placeHolderLab.hidden = NO;
        self.placeHolderLab.text = placeHolder;
    }
}

//placeHolder颜色
- (void)setPlaceHolderTextColor:(UIColor *)placeHolderTextColor
{
    self.placeHolderLab.textColor = placeHolderTextColor;
}

#pragma mark Validate

-(void)setIsValite:(void (^)(BOOL))IsValite
{
    _IsValite = IsValite;
    [self detect];
}

-(void)detect
{
    //block存在
    if (self.IsValite) {
        //不允许为空
        if (self.isNotNull) {
            //检测是否非空
            if ([NSString isThinkingNull:[self.text trim]]) {
                self.IsValite(NO);
                return;
            }
        }
        //有正则
        if (self.regex) {
            //检测正则是否匹配
            self.IsValite([self.regex isMatchRegex:self.regex]);
            return;
        }
        //合法
        self.IsValite(YES);
    }
}

#pragma mark TextViewDelegate

- (void)textViewDidChange:(UITextView *)textView
{
    //输入长度小于限制长度
    if (self.text.length <= self.inputCount) {
        //如果长度不为0，就隐藏placeHolder
        self.placeHolderLab.hidden = (self.text.length != 0);
        //通知长度变化
        if (self.textLengthChange) {
            self.textLengthChange(self.text.length);
        }
        //检测是否合法
        [self detect];
   }
    //输入长度大于限制长度，则进行截断
    else
    {
        self.text = [textView.text substringToIndex:self.inputCount];
        //通知长度变化
        if (self.textLengthChange) {
            self.textLengthChange(self.inputCount);
        }
    }
}


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if (!self.ShowKeyborad) {
        [textView resignFirstResponder];
        if (_touchBegan) {
            _touchBegan();
        }
        return NO;
    }else{
        return YES;
    }
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@""]) {
        return YES;
    }
    if ([text isEqualToString:@"\n"] && self.returnKeyResign){
        [self resignFirstResponder];
        return NO;
    }
    if ([text isEqualToString:@" "]){
        return NO;
    }
    if (self.text.length + text.length > self.inputCount) {
        return NO;
    }
    return YES;
}
@end
