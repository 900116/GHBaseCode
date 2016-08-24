//
//  GHBaseDefine.h
//  GoHome
//
//  Created by YongCheHui on 16/6/17.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark GHExtension
#import "NSString+GHExtension.h"
#import "UIImage+GHExtension.h"
#import "UIStoryboard+GHExtension.h"
#import "UIView+GHExtension.h"
#import "UIViewController+GHExtension.h"
#import "UITableViewCell+GHExtension.h"
#import "UIButton+GHExtension.h"
#import "UITextField+GHExtension.h"
#import "UILabel+GHExtension.h"
#import "UITextView+GHExtension.h"
#import "NSDictionary+GHExtension.h"
#import "UIActionSheet+GHExtension.h"
#import "UIAlertView+GHExtension.h"
#import "NSDate+GHExtension.h"
#import "CLLocation+GHExtension.h"
#import "MKMapView+GHExtension.h"
#import "CLLocation+GHExtension.h"
#import "CLLocationManager+GHExtension.h"
#import "CLGeocoder+GHExtension.h"
#import "UIPageControl+GHExtension.h"
#import "UIToolbar+GHExtension.h"


#pragma mark GHFrameWork
#import "GHBaseVC.h"
#import "GHTabbarVC.h"
#import "GHTableInfo.h"
#import "GHTableVC.h"
#import "GHTextField.h"
#import "GHMsgError.h"
#import "GHImagePickerController.h"

#import "AppDelegate.h"
#import "UIView+JHChainableAnimations.h"
#define NAME(...)  @#__VA_ARGS__
#define DICT_1(...) @{NAME(__VA_ARGS__):__VA_ARGS__}
#define DICT_OBJ(DICT,OBJ)  [(DICT) dictionaryWithKeyValues:@[NAME(OBJ),(OBJ)]]
#define DICT_2(Name,...) DICT_OBJ(DICT_1(__VA_ARGS__),Name)
#define DICT_3(Name,...) DICT_OBJ(DICT_2(__VA_ARGS__),Name)
#define DICT_4(Name,...) DICT_OBJ(DICT_3(__VA_ARGS__),Name)
#define DICT_5(Name,...) DICT_OBJ(DICT_4(__VA_ARGS__),Name)
#define DICT_6(Name,...) DICT_OBJ(DICT_5(__VA_ARGS__),Name)
#define DICT_7(Name,...) DICT_OBJ(DICT_6(__VA_ARGS__),Name)
#define DICT_8(Name,...) DICT_OBJ(DICT_7(__VA_ARGS__),Name)
#define DICT_9(Name,...) DICT_OBJ(DICT_8(__VA_ARGS__),Name)
#define DICT_10(Name,...) DICT_OBJ(DICT_9(__VA_ARGS__),Name)

#define DICT_11(Name,...) DICT_OBJ(DICT_10(__VA_ARGS__),Name)
#define DICT_12(Name,...) DICT_OBJ(DICT_11(__VA_ARGS__),Name)
#define DICT_13(Name,...) DICT_OBJ(DICT_12(__VA_ARGS__),Name)
#define DICT_14(Name,...) DICT_OBJ(DICT_13(__VA_ARGS__),Name)
#define DICT_15(Name,...) DICT_OBJ(DICT_14(__VA_ARGS__),Name)
#define DICT_16(Name,...) DICT_OBJ(DICT_15(__VA_ARGS__),Name)
#define DICT_17(Name,...) DICT_OBJ(DICT_16(__VA_ARGS__),Name)
#define DICT_18(Name,...) DICT_OBJ(DICT_17(__VA_ARGS__),Name)
#define DICT_19(Name,...) DICT_OBJ(DICT_18(__VA_ARGS__),Name)
#define DICT_20(Name,...) DICT_OBJ(DICT_19(__VA_ARGS__),Name)

#define GET_MACRO(x,_1,_2,_3,_4,_5,_6,_7,_8,_9,_10,_11,_12,_13,_14,_15,_16,_17,_18,_19,_20,NAME,...) NAME
#define DICT_N(...) GET_MACRO(,##__VA_ARGS__,DICT_20,DICT_19,DICT_18,DICT_17,DICT_16,DICT_15,DICT_14,DICT_13,DICT_12,DICT_11,DICT_10,DICT_9,DICT_8,DICT_7,DICT_6,DICT_5,DICT_4,DICT_3,DICT_2,DICT_1)(__VA_ARGS__)

static  NSString *const baseURL = @"http://zhnote.com:2012";
static inline NSURL* imageUrlWithImageName(NSString * imageName){
    if ([NSString isThinkingNull:imageName]) {
        return nil;
    }
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",baseURL,imageName]];
}

static inline NSURL* urlWithUrl(NSString * url){
    if ([NSString isThinkingNull:url]) {
        return nil;
    }
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",baseURL,url]];
}

static inline NSURL* thumbImageUrlWithImageName(NSString * imageName){
    if ([NSString isThinkingNull:imageName]) {
        return nil;
    }
    NSArray* sep = [imageName componentsSeparatedByString:@"."];
    imageName = [NSString stringWithFormat:@"%@_thumb.%@",sep[0],sep[1]];
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",baseURL,imageName]];
}


#pragma mark 屏幕尺寸相关
static inline CGSize Screen_Size()
{
    return [UIScreen mainScreen].bounds.size;
}

static inline CGFloat Screen_Width()
{
    return Screen_Size().width;
}

static inline CGFloat Screen_Height()
{
    return Screen_Size().height;
}

static inline BOOL is3_5Inch()
{
    return Screen_Height() == 480;
}

static inline BOOL is4Inch()
{
    return Screen_Height() == 568;
}


static inline BOOL is4_7Inch()
{
    return Screen_Height() == 667;
}

static inline BOOL is5_5Inch()
{
    return Screen_Height() == 736;
}

#pragma mark 系统相关
static inline UIApplication* sys_applicationer(){
    return  [UIApplication sharedApplication];
}

static inline AppDelegate* sys_appDelegater(){
    return  (AppDelegate*)sys_applicationer().delegate;
}

static inline UIWindow* sys_keyWindow(){
    return  sys_applicationer().keyWindow;
}

static inline NSString* sys_currVersion()
{
    return [[[NSBundle mainBundle] infoDictionary]  objectForKey:@"CFBundleShortVersionString"];
}

static inline BOOL sys_moreThanIOS(CGFloat version)
{
    return [[[UIDevice currentDevice] systemVersion] floatValue] > version;
}

static inline void sys_hideStatusBar()
{
    [sys_applicationer() setStatusBarHidden:YES];
}

static inline void sys_showStatusBar()
{
    [sys_applicationer() setStatusBarHidden:NO];
}


static inline void sys_setWhiteTintStatusBar()
{
    [sys_applicationer() setStatusBarStyle:UIStatusBarStyleLightContent];
}

static inline void sys_setBlackTintStatusBar()
{
    [sys_applicationer() setStatusBarStyle:UIStatusBarStyleDefault];
}

#pragma mark - 内存
#define WEAK_SELF __weak typeof (self) weakself = self; weakself//bolck内用self

#pragma mark - 通知
static NSString* const NOTI_LOGIN_SUC_KEY = @"loginSuccess";

static inline NSNotificationCenter* noti_center(){
    return [NSNotificationCenter defaultCenter];
}

static inline void noti_post2(NSString * name,id object)
{
    [noti_center() postNotificationName:name object:object];
}

static inline void noti_post(NSString * name)
{
    noti_post2(name, nil);
}

static inline void noti_addObserer(id observer,SEL selector,NSString* name){
    [noti_center() addObserver:observer selector:selector name:name object:nil];
}

static inline void noti_remove3(id oberver,NSString* name,id obj)
{
    [noti_center() removeObserver:oberver name:name object:obj];
}

static inline void noti_remove2(id oberver,NSString* name)
{
    noti_remove3(oberver, name, nil);
}

static inline void noti_remove(id oberver)
{
    [noti_center() removeObserver:oberver];
}


#pragma mark 颜色转换
static inline UIColor* RGBA(CGFloat r,CGFloat g,CGFloat b,CGFloat a)
{
    return  [UIColor
             colorWithRed:r/255.0
             green:g/255.0
             blue:b/255.0
             alpha:a];
}

static inline UIColor* RGB(CGFloat r,CGFloat g,CGFloat b)
{
    return RGBA(r, g, b, 1.0);
}

static inline UIColor* WColor2(CGFloat x,CGFloat a)
{
    return RGBA(x, x, x, a);
}

// rgb颜色转换（16进制->10进制）
static inline UIColor* UIColorFromRGB(int rgbValue)
{
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];
}

#pragma mark 时间
static NSInteger const T_secondsPerMinute = 60;

static NSInteger const T_minutsPerHour = 60;
static NSInteger const T_secondsPerHour = T_secondsPerMinute * T_minutsPerHour;

static NSInteger const T_hoursPerDay = 24;
static NSInteger const T_minutesPerDay =  T_minutsPerHour * T_hoursPerDay;
static NSInteger const T_secondsPerDay = T_secondsPerHour * T_hoursPerDay;

static NSInteger const T_daysPerWeek = 7;
static NSInteger const T_hoursPerWeek = T_hoursPerDay * T_daysPerWeek;
static NSInteger const T_minutesPerWeek = T_minutsPerHour * T_hoursPerWeek;
static NSInteger const T_secondsPerWeek = T_secondsPerHour * T_hoursPerWeek;


#pragma mark 存储
static inline NSUserDefaults* ud()
{
    return [NSUserDefaults standardUserDefaults];
}

static inline void ud_save(NSObject* object,NSString* key)
{
    [ud() setObject:object forKey:key];
    [ud() synchronize];
}

static inline id ud_read(NSString* key)
{
    return [ud() objectForKey:key];
}

static inline NSInteger ud_readInt(NSString* key)
{
    return [ud_read(key) integerValue];
}

static inline BOOL ud_readBool(NSString* key)
{
    return [ud_read(key) boolValue];
}

static inline CGFloat ud_readFloat(NSString* key)
{
    return [ud_read(key) doubleValue];
}

static inline void ud_remove(NSString* key)
{
    [ud() removeObjectForKey:key];
    [ud() synchronize];
}

#pragma mark path
static inline NSFileManager* path_fm()
{
    return [NSFileManager defaultManager];
}

static inline void path_createDir(NSString* path)
{
    [path_fm() createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:nil];
}

static inline void path_createDirIntermediate(NSString* path)
{
    [path_fm() createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
}

static inline BOOL path_exist(NSString* path)
{
    return [path_fm() fileExistsAtPath:path];
}

static inline BOOL path_exist2(NSString* path,BOOL *isDir)
{
    return [path_fm() fileExistsAtPath:path isDirectory:isDir];
}

static inline BOOL path_contentEqual(NSString* path1,NSString* path2)
{
    return [path_fm() contentsEqualAtPath:path1 andPath:path2];
}

static inline NSArray* path_subPaths(NSString* path)
{
    return [path_fm() subpathsAtPath:path];
}

static inline NSString* path_doc()
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory
                                                        , NSUserDomainMask
                                                        , YES);
    return paths[0];
}

static inline NSString* path_cache()
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSCachesDirectory
                                                       , NSUserDomainMask
                                                       , YES);
    return paths[0];
}

#pragma mark Log
#ifdef DEBUG
#define D_NSLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define D_NSLog(format, ...)
#endif

static inline void log_o(id obj)
{
    D_NSLog(@"%@", obj);
}

static inline void log_i(int i)
{
    D_NSLog(@"%d", i);
}

static inline NSString* stringForI(int i)
{
    return [NSString stringWithFormat:@"%d",i];
}

static inline void log_l(NSInteger ld)
{
    D_NSLog(@"%lu", ld);
}

static inline NSString* stringForInteger(NSInteger i)
{
    return [NSString stringWithFormat:@"%lu",i];
}

static inline void log_f(CGFloat f)
{
    D_NSLog(@"%lf", f);
}

static inline NSString* stringForF(CGFloat f)
{
    return [NSString stringWithFormat:@"%lf",f];
}

static inline void log_c(char c)
{
    D_NSLog(@"%c", c);
}

static inline NSString* stringForC(char c)
{
    return [NSString stringWithFormat:@"%c",c];
}

static inline void log_point(CGPoint p)
{
    D_NSLog(@"CGPoint: {%.0f, %.0f}",p.x,p.y);
}

static inline NSString* stringForP(CGPoint p)
{
    return [NSString stringWithFormat:@"CGPoint: {%.0f, %.0f}",p.x,p.y];
}


static inline void log_size(CGSize size)
{
    D_NSLog(@"CGSize: {%.0f, %.0f}",size.width,size.height);
}

static inline NSString* stringForS(CGSize size)
{
    return [NSString stringWithFormat:@"CGSize: {%.0f, %.0f}",size.width,size.height];
}

static inline void log_rect(CGRect rect)
{
    D_NSLog(@"CGRect: {%.0f, %.0f, %.0f, %.0f}",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
}

static inline NSString* stringForR(CGRect rect)
{
    return [NSString stringWithFormat:@"CGRect: {%.0f, %.0f, %.0f, %.0f}",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height];
}

#pragma mark 字体
static inline UIFont * font_font(CGFloat size)
{
    return [UIFont systemFontOfSize:size];
}

static inline CGSize font_size(NSString* str,UIFont* font)
{
    if (!str.length) {
        return CGSizeZero;
    }
    return  [str sizeWithAttributes:@{NSFontAttributeName :font}];
}

static inline CGSize font_size3(NSString* str,UIFont* font,CGSize size)
{
    if (!str.length) {
        return CGSizeZero;
    }
    return  [str sizeWithFont:font constrainedToSize:size];
}

#pragma mark - GCD
static inline void gcd_back(dispatch_block_t block)
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

static inline void gcd_main(dispatch_block_t block)
{
    dispatch_async(dispatch_get_main_queue(),block);
}

static inline void gcd_after(NSTimeInterval time,dispatch_block_t block)
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), block);
}


typedef void(^GCDTimerBlock)();
static inline dispatch_source_t gcd_timer(NSTimeInterval time,GCDTimerBlock block,BOOL repeat){
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    __block dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC));
    uint64_t interver = (uint64_t)(time * NSEC_PER_SEC);
    dispatch_source_set_timer(timer, start, interver, 0.0);
    dispatch_source_set_event_handler(timer, ^{
        gcd_main(^{
            block();
            if (!repeat) {
                dispatch_source_cancel(timer);
                timer = nil;
            }
        });
    });
    dispatch_resume(timer);
    return timer;
}

static inline void gcd_release_timer(dispatch_source_t timer){
    if (timer) {
        dispatch_source_cancel(timer);
        timer = nil;
    }
}


#pragma mark 数学辅助
static inline CGFloat degreesToRadian(CGFloat x)
{
    return (M_PI * x / 180.0);
}

static inline CGFloat radianToDegrees(CGFloat radian)
{
    return (radian*180.0)/(M_PI);
}

#pragma mark 弹窗
static inline void showAlertErrorMsg(NSString* title,NSString* message)
{
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
    [alertView show];
}

