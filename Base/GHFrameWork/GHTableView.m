//
//  UITableView+GHExtension.m
//  GoHome
//
//  Created by YongCheHui on 16/6/27.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "GHTableView.h"
#import <objc/runtime.h>
@interface GHTableView()
@property(nonatomic,strong) GHTableInfo* info;
@property(nonatomic,strong) NSArray* dataArray;
@end

@implementation GHTableView

-(void)setTableInfo:(GHTableInfo *)info{
    NSMutableArray* array = [NSMutableArray new];
    self.info = info;
    self.dataArray = array;
    UIView* superView = info.superView?info.superView:info.contentVC.view;
    CGRect tabRect = CGRectEqualToRect(info.tabFrame, CGRectZero)?superView.bounds:info.tabFrame;
    if (info.superView) {
        [info.superView addSubview:self];
    }
    [self setFrame:tabRect];
    NSString* nib = info.cellNib;
    Class cls = info.cellCls;
    NSString* cellID = info.cellID?info.cellID:NSStringFromClass(info.cellCls);
    if (nib) {
        [self registerNib:[UINib nibWithNibName:nib bundle:nil] forCellReuseIdentifier:cellID];
    }
    else if(info.cellCls != [UITableViewCell class])
    {
        [self registerClass:cls forCellReuseIdentifier:cellID];
    }
    WEAK_SELF;
    self.delegate = self;
    self.dataSource = self;
    gcd_after(0.05, ^{
        switch (info.style) {
            case GHTableVCStyleHeader: {
                if (!info.tableHeaderHandler) {
                    NSAssert(YES, @"tableHeaderHandler不能为nil");
                }
                UIView* headerView = info.tableHeaderHandler();
                weakself.tableHeaderView = headerView;
                break;
            }
            case GHTableVCStyleRefresh: {
                UIRefreshControl* refreshControl = [[UIRefreshControl alloc]init];
                refreshControl.attributedTitle =[[NSAttributedString alloc]initWithString:@"loading"];
                [refreshControl addTarget:self action:@selector(pullToRefresh:) forControlEvents:UIControlEventValueChanged];
                [self addSubview:refreshControl];
                break;
            }
            case GHTableVCStyleNoRefresh: {
                break;
            }
            case GHTableVCStyleHeaderAndRefresh:
            {
                if (!info.tableHeaderHandler) {
                    NSAssert(YES, @"tableHeaderHandler不能为nil");
                }
                UIView* headerView = info.tableHeaderHandler();
                weakself.tableHeaderView = headerView;
                UIRefreshControl* refreshControl = [[UIRefreshControl alloc]init];
                refreshControl.attributedTitle =[[NSAttributedString alloc]initWithString:@"loading"];
                [refreshControl addTarget:self action:@selector(pullToRefresh:) forControlEvents:UIControlEventValueChanged];
                [self addSubview:refreshControl];
                break;
            }
        }
    });
    if (info.tabBGColor) {
        self.backgroundColor = info.tabBGColor;
    }

}

-(void)pullToRefresh:(UIRefreshControl *)control
{
    if (!self.info.dRefreshHandler) {
        NSAssert(YES, @"dRefreshHandler不能为nil");
    }
    WEAK_SELF;
    self.info.dRefreshHandler(^(NSArray * datas){
        [weakself setDataArrays:datas];
        [control endRefreshing];
    });
}

-(void)setDataArrays:(NSArray *)datas
{
    self.dataArray = datas;
    [self reloadData];
}

-(NSArray*)datas
{
    return self.dataArray;
}

#pragma mark dataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* cellID = self.info.cellID?self.info.cellID:NSStringFromClass(self.info.cellCls);
    UITableViewCell* cell = nil;
    if (self.info.cellCls != [UITableViewCell class]) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    }
    else{
        cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
        }
    }
    id model = self.info.needSection?self.datas[indexPath.section][indexPath.row]:self.datas[indexPath.row];
    self.info.refreshCellHandler(cell,model,indexPath);
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.info.sectionHeaderViewHandler) {
        return self.info.sectionHeaderViewHandler(section);
    }
    return nil;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.info.needSection) {
        return self.datas?self.datas.count:0;
    }
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.info.needSection) {
        if (!self.datas) {
            return 0;
        }
        NSArray* array = self.datas[section];
        return array.count;
    }
    return self.datas?self.datas.count:0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    id model = self.info.needSection?self.datas[indexPath.section][indexPath.row]:self.datas[indexPath.row];
    return self.info.heightHandler(indexPath,model);
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.info.sectionHeaderHeightHandler(section);
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return self.info.sectionFooterHeightHandler(section);
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (!self.info.needSection) {
        return nil;
    }
    if (!self.info.sectionTitleHandler) {
        return nil;
    }
    return self.info.sectionTitleHandler(section);
}

#pragma mark delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    id model = self.info.needSection?[self datas][indexPath.section][indexPath.row]:self.datas[indexPath.row];
    self.info.selectCellHandler(indexPath,model);
}
@end
