//
//  GHBaseVC.m
//  GoHome
//
//  Created by YongCheHui on 16/6/14.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "GHBaseVC.h"

@interface GHBaseVC ()

@end

@implementation GHBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.showNavi = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

static NSMutableDictionary* vcShowInfos;
+(NSMutableDictionary *)vcShowInfos
{
    if (!vcShowInfos) {
        vcShowInfos = [NSMutableDictionary new];
    }
    return vcShowInfos;
}

-(void)setIsShow:(BOOL)show
{
    [[GHBaseVC vcShowInfos] setObject:@(show) forKey:NSStringFromClass(self.class)];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setIsShow:YES];
    if (_showNavi) {
        [self showNaviBar];
    }
    else
    {
        [self hideNaviBar];
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self setIsShow:NO];
    if (_showNavi) {
        [self hideNaviBar];
    }
    else
    {
        [self showNaviBar];
    }
}

+(BOOL)viewControllerShow:(Class)cls {
    return [[[GHBaseVC vcShowInfos] objectForKey:NSStringFromClass(cls)] boolValue];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)addNaviBack {
    UIBarButtonItem* item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navi_back_btn"] style:UIBarButtonItemStylePlain target:self action:@selector(naviBack)];
    item.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

-(void)addRightItemWithImage:(UIImage*)image action:(SEL)action
{
    UIBarButtonItem* item = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:action];
    item.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = item;
}

-(void)addRightItem:(NSString*)title action:(SEL)action
{
    UIBarButtonItem* item = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    item.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = item;
}

-(void)naviBack
{
    [self popAnimation];
}
@end
