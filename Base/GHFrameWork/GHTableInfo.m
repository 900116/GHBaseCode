//
//  GHTableInfo.m
//  GoHome
//
//  Created by YongCheHui on 16/6/15.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "GHTableInfo.h"

@implementation GHTableInfo
-(instancetype)init
{
    self = [super init];
    if (self) {
        self.autoDeselect = YES;
        self.additionParams = [NSMutableDictionary new];
        self.cellCls = [UITableViewCell class];
        self.cellNib = nil;
        self.style = GHTableVCStyleNoRefresh;
        self.refreshCellHandler = ^(UITableViewCell* cell,id model,NSIndexPath* idp){};
        self.selectCellHandler = ^(NSIndexPath* idp,id model){};
        self.sectionFooterHeightHandler = easyFooterReturnF(0.f);
        self.sectionHeaderHeightHandler = easyHeaderReturnF(0.f);
        self.heightHandler = easyReturnF(44.f);
        self.tableStyle = UITableViewStylePlain;
    }
    return self;
}

@end
