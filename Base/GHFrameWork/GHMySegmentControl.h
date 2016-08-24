//
//  GHMySegmentControl.h
//  GoHome
//
//  Created by YongCheHui on 16/6/27.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GHMySegmentControl : UISegmentedControl
@property(nonatomic,assign) int pages;
-(instancetype)init;
-(instancetype)initWithFrame:(CGRect)frame;
-(void)setSegmentTitles:(NSArray *)titles;
-(void)setSelectIdex:(NSInteger)index;
@property(nonatomic,copy) void(^changeSelectHandler)(int index);
@end
