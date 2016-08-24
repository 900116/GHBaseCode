//
//  GHTableVC.m
//  GoHome
//
//  Created by YongCheHui on 16/6/15.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "GHTableVC.h"
#include <objc/runtime.h>
@interface GHTableVC()
@property(nonatomic,strong) GHTableInfo*info;
@property(nonatomic,weak) UIRefreshControl* refreshControl;
@property(nonatomic,assign) BOOL getMoring;
@end
@implementation GHTableVC
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.info.sectionHeaderViewHandler(section);
}

-(void)loadTableInfo
{
    self.info = [self tableInfo];
    self.info.contentVC = self;
    if (!self.info) {
        NSAssert(YES, @"tableInfo方法不能返回nil");
    }
    CGRect tabRect = CGRectEqualToRect(self.info.tabFrame, CGRectZero)?self.bounds:self.info.tabFrame;
    UITableView* tableView = [[UITableView alloc]initWithFrame:tabRect style:self.info.tableStyle];
    if (self.info.superView) {
        [self.info.superView addSubview:tableView];
    }
    else [self addSubView:tableView];
    self.tableView = tableView;
    NSString* nib = self.info.cellNib;
    Class cls = self.info.cellCls;
    NSString* cellID = self.info.cellID?self.info.cellID:NSStringFromClass(self.info.cellCls);
    if (nib) {
        [self.tableView registerNib:[UINib nibWithNibName:nib bundle:nil] forCellReuseIdentifier:cellID];
    }
    else if(self.info.cellCls != [UITableViewCell class])
    {
        [self.tableView registerClass:cls forCellReuseIdentifier:cellID];
    }
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    WEAK_SELF;
    gcd_after(0.05, ^{
        switch (weakself.info.style) {
            case GHTableVCStyleHeader: {
                if (!weakself.info.tableHeaderHandler) {
                    NSAssert(YES, @"tableHeaderHandler不能为nil");
                }
                UIView* headerView = weakself.info.tableHeaderHandler();
                weakself.tableView.tableHeaderView = headerView;
                break;
            }
            case GHTableVCStyleRefresh: {
                UIRefreshControl* refreshControl = [[UIRefreshControl alloc]init];
                refreshControl.attributedTitle =[[NSAttributedString alloc]initWithString:@"loading"];
                weakself.refreshControl = refreshControl;
                [weakself.refreshControl addTarget:self action:@selector(pullToRefresh) forControlEvents:UIControlEventValueChanged];
                [weakself.tableView addSubview:refreshControl];
                break;
            }
            case GHTableVCStyleNoRefresh: {
                break;
            }
            case GHTableVCStyleHeaderAndRefresh:
            {
                if (!weakself.info.tableHeaderHandler) {
                    NSAssert(YES, @"tableHeaderHandler不能为nil");
                }
                UIView* headerView = weakself.info.tableHeaderHandler();
                weakself.tableView.tableHeaderView = headerView;
                UIRefreshControl* refreshControl = [[UIRefreshControl alloc]init];
                refreshControl.attributedTitle =[[NSAttributedString alloc]initWithString:@"loading"];
                weakself.refreshControl = refreshControl;
                [weakself.refreshControl addTarget:self action:@selector(pullToRefresh) forControlEvents:UIControlEventValueChanged];
                [weakself.tableView addSubview:refreshControl];
                break;
            }
        }
    });
    if (self.info.tabBGColor) {
        self.tableView.backgroundColor = self.info.tabBGColor;
    }
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self loadTableInfo];
}

-(BOOL)respondsToSelector:(SEL)aSelector
{
    if (aSelector == @selector(tableView:viewForHeaderInSection:)) {
        if (self.info.sectionHeaderViewHandler) {
            return YES;
        }
        else
        {
            return NO;
        }
    }
    return [super respondsToSelector:aSelector];
}

-(void)pullToRefresh
{
    if (!self.info.dRefreshHandler) {
        NSAssert(YES, @"dRefreshHandler不能为nil");
    }
    WEAK_SELF;
    self.info.dRefreshHandler(^(NSArray * datas){
        [weakself setDataArrays:datas];
        if (weakself.refreshControl.refreshing) {
            [weakself.refreshControl endRefreshing];
        }
    });
}

-(GHTableInfo*)tableInfo {
    GHTableInfo* tabInfo = [[GHTableInfo alloc]init];
    return tabInfo;
}


-(void)setDataArrays:(NSArray*)datas {
    self.datas = datas;
    [self.tableView reloadData];
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

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    if (self.info.rightTitleHandler) {
        return self.info.rightTitleHandler();
    }
    return nil;
}

#pragma mark delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.info.autoDeselect) {
         [tableView deselectRowAtIndexPath:indexPath animated:YES];   
    }
     id model = self.info.needSection?self.datas[indexPath.section][indexPath.row]:self.datas[indexPath.row];
    self.info.selectCellHandler(indexPath,model);
}

-(GHTableInfo*)getTableInfo {
    if (_info) {
        return _info;
    }
    return [self tableInfo];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.getMoring = NO;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y + (scrollView.frame.size.height) > scrollView.contentSize.height) {
        if (self.getMoring) {
            return;
        }
        self.getMoring = YES;
        if (self.tableInfo.getMoreDataHandler) {
            self.tableInfo.getMoreDataHandler();
        }
       // D_NSLog(@"滑动到底%lf",scrollView.decelerationRate);
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.info.deleteHandler?UITableViewCellEditingStyleDelete:UITableViewCellEditingStyleNone;
}

-(void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.info.deleteHandler) {
        self.info.deleteHandler(indexPath,self.info.needSection?self.datas[indexPath.section][indexPath.row]:self.datas[indexPath.row]);
    }
}
@end
