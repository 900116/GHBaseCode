//
//  UITableView+GHExtension.h
//  GoHome
//
//  Created by YongCheHui on 16/6/27.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GHTableInfo.h"

@interface GHTableView:UITableView<UITableViewDataSource,UITableViewDelegate>
-(void)setTableInfo:(GHTableInfo *)info;
-(void)setDataArrays:(NSArray *)datas;
@end
