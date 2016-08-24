//
//  GHTableInfo.h
//  GoHome
//
//  Created by YongCheHui on 16/6/15.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GHTableVC.h"
typedef NS_ENUM(int,GHTableVCStyle){
    //有header的下拉刷新
    GHTableVCStyleHeader,
    //无header的下拉刷新
    GHTableVCStyleRefresh,
    //无下拉刷新
    GHTableVCStyleNoRefresh,
    //有header也有刷新
    GHTableVCStyleHeaderAndRefresh
};
//cell高度
typedef CGFloat(^ghHeightCalHandler)(NSIndexPath*idp,id model);
//sectionheaderview高度
typedef CGFloat(^ghSecionHeaderHandler)(NSInteger section);
//sectoinfooterview高度
typedef CGFloat(^ghSecionFooterHandler)(NSInteger section);
//下拉刷新
typedef void(^ghDownDragFinishResultHandler)(NSArray* datas);
//刷新cell
typedef void(^ghRefreshCellHandler)(UITableViewCell* cell,id model,NSIndexPath* idp);
//选择cell
typedef void(^ghSelectCellHandler)(NSIndexPath*idp,id model);
//下拉刷新
typedef void(^ghDownDragRefreshHandler)(ghDownDragFinishResultHandler handler);
//sectionTitle
typedef NSString*(^ghSectionTitleHandler)(NSInteger section);
//sectionheaderView
typedef UIView *(^ghTabSectionHeaderViewHandler) (NSInteger section);
//tableHeaderView
typedef UIView *(^ghTabHeaderViewHandler) ();

//RightTitles
typedef NSArray *(^ghTabRightTitlesHandler) ();

typedef void (^ghTabDeleteActionHandler) (NSIndexPath* deleteHandler,id model);

//getMoreHandler
typedef void(^getMoreDatasHandler) ();

static inline ghHeightCalHandler easyReturnF(CGFloat height)
{
    return ^(NSIndexPath* idp,id data){ return height;};
}

static inline ghSecionHeaderHandler easyHeaderReturnF(CGFloat height)
{
    return ^(NSInteger section){ return height;};
}

static inline ghSecionFooterHandler easyFooterReturnF(CGFloat height)
{
    return ^(NSInteger section){ return height;};
}

@interface GHTableInfo : NSObject
@property(nonatomic,copy) NSString *cellNib;
@property(nonatomic,assign) Class cellCls;
@property(nonatomic,assign) CGRect tabFrame;
@property(nonatomic,copy) NSString* cellID;
@property(nonatomic,assign) BOOL needSection;
@property(nonatomic,assign) BOOL autoDeselect;
@property(nonatomic,strong) UIColor* tabBGColor;
@property(nonatomic,strong) UIView* superView;
@property(nonatomic,weak) UIViewController* contentVC;
@property(nonatomic,assign) UITableViewStyle tableStyle;
@property(nonatomic,strong) NSMutableDictionary* additionParams;

@property(nonatomic,assign) GHTableVCStyle style;
@property(nonatomic,copy) ghHeightCalHandler heightHandler;

@property(nonatomic,copy) ghSecionHeaderHandler sectionHeaderHeightHandler;
@property(nonatomic,copy) ghSecionFooterHandler sectionFooterHeightHandler;
@property(nonatomic,copy) ghSelectCellHandler selectCellHandler;
@property(nonatomic,copy) ghTabRightTitlesHandler rightTitleHandler;

@property(nonatomic,copy) ghRefreshCellHandler refreshCellHandler;
@property(nonatomic,copy) getMoreDatasHandler getMoreDataHandler;

//下拉刷新特有
@property(nonatomic,copy) ghDownDragRefreshHandler dRefreshHandler;

//header特有
@property(nonatomic,copy) ghTabHeaderViewHandler tableHeaderHandler;

//needSection为yes时候
@property(nonatomic,copy) ghSectionTitleHandler sectionTitleHandler;

//needSection为yes时候
@property(nonatomic,copy) ghTabSectionHeaderViewHandler sectionHeaderViewHandler;

//删除操作
@property(nonatomic,copy) ghTabDeleteActionHandler deleteHandler;
@end
