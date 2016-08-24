//
//  GHSegmentedControl.m
//  GoHome
//
//  Created by ZhaoGuangHui on 16/6/24.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "GHSegmentedControl.h"

@implementation GHSegmentedControl
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
    CGFloat padding = 15.f;
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
        [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [btn setSelectTitleColor:[UIColor whiteColor]];
        if (i == 0) {
            btn.selected = YES;
            lastBtn = btn;
        }
        [btn addTouchObject:self event:@selector(touchBtn:)];
        UIView* view = [[UIView alloc]initWithFrame:CGRectMake(8+x, self.height-2, width-16, 2)];
        [self addSubview:view];
        view.backgroundColor = [UIColor whiteColor];
        view.hidden = i != 0;
        view.tag = 200+i;
        i++;
    }
}

-(void)touchBtn:(UIButton *)btn
{
    if (lastBtn != btn) {
        lastBtn.selected = NO;
        UIView* view = [self viewWithTag:200+lastBtn.tag];
        view.hidden = NO;
        view = [self viewWithTag:200+btn.tag];
        view.hidden = YES;
        
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
        UIView* view = [self viewWithTag:200+tag];
        view.hidden = btn.tag != index;
        btn.selected = btn.tag == index;
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
