//
//  GHScrollView.m
//  GoHome
//
//  Created by YongCheHui on 16/6/27.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "GHScrollView.h"

@implementation GHScrollView
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    NSArray* touches = [gestureRecognizer valueForKey:@"touches"];
    for (UITouch* touch in touches) {
        if ([touch.view isKindOfClass:NSClassFromString(@"UITableViewCellContentView")]) {
            return NO;
        }
    }
    return YES;
}

@end
