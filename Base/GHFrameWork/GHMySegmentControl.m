//
//  GHMySegmentControl.m
//  GoHome
//
//  Created by YongCheHui on 16/6/27.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "GHMySegmentControl.h"

@implementation GHMySegmentControl
-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

static UIButton* lastBtn = nil;
-(void)setSegmentTitles:(NSArray *)titles
{
    CGFloat x = 0;
    CGFloat y = 2;
    self.pages = (int)titles.count;
    CGFloat padding = 8.f;
    CGFloat width = (self.width - (titles.count-1)*padding)/titles.count;
    int i = 0;
    for (NSString* title in titles) {
        x = (width+padding)*i;
        UIButton* btn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, width, self.height-2)];
        [self addSubview:btn];
        [btn setNormalTitle:title];
        [btn setNormalTitleColor:[UIColor lightGrayColor]];
        [btn setSelectTitle:title];
        btn.tag = i;
        [btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [btn setSelectTitleColor:[UIColor whiteColor]];
        if (i == 0) {
            [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
            btn.selected = YES;
            lastBtn = btn;
        }
        [btn addTouchObject:self event:@selector(touchBtn:)];
        i++;
    }
}

-(void)touchBtn:(UIButton *)btn
{
    if (lastBtn != btn) {
        [lastBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
        lastBtn.selected = NO;
        btn.selected = YES;
        [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        lastBtn = btn;
    }

    if (self.changeSelectHandler) {
        self.changeSelectHandler((int)btn.tag);
    }
}

-(void)setSelectIdex:(NSInteger)index
{
    for (NSInteger tag = 0; tag < self.pages;++tag) {
        UIButton* btn = (UIButton *)[self viewWithTag:tag];
        btn.selected = btn.tag == index;
        if (btn.tag == index) {
            lastBtn = btn;
            [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        }
        else
        {
            [btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
        }
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
@end
