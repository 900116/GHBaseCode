//
//  GHTableVC.h
//  GoHome
//
//  Created by YongCheHui on 16/6/15.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GHTableVC.h"
@class GHTableInfo;
@interface GHTableVC : GHBaseVC<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak) UITableView* tableView;
-(GHTableInfo*)tableInfo;
-(GHTableInfo*)getTableInfo;
-(void)setDataArrays:(NSArray*)datas;
@property(nonatomic,copy) NSArray*datas;
@end

