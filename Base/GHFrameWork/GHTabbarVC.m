//
//  GHTabbarViewController.m
//  GoHome
//
//  Created by YongCheHui on 16/6/14.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "GHTabbarVC.h"
#import "XZMTabbarExtension.h"
#import "AppDelegate.h"

@interface GHTabbarVC ()<UITabBarControllerDelegate>

@end

@implementation GHTabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /** 配置中间按钮 */
    [self.tabBar setUpTabBarCenterButton:^(UIButton *centerButton) {
        [centerButton setBackgroundImage:[UIImage imageNamed:@"jia"] forState:UIControlStateNormal];
        
       // [centerButton setBackgroundImage:[UIImage imageNamed:@"jia"] forState:UIControlStateSelected];
        
        [centerButton addTarget:self action:@selector(chickCenterButton) forControlEvents:UIControlEventTouchUpInside];
    }];
    self.delegate = self;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    UITabBarItem* item = viewController.tabBarItem;
    if (item.tag > 1) {
        BOOL needLogin =  [AppDelegate needLogin];
        if (needLogin) {
            tabBarController.selectedIndex = 0;
        }
    }
}

/**
 *  action
 */
- (void)chickCenterButton {
    BOOL needLogin =  [AppDelegate needLogin];
    if (needLogin) {
        return;
    }
    UIViewController*vc= [UIStoryboard vcFromMainBundleWithSBID:@"sendMsg"];
    [self presentViewController:vc animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
