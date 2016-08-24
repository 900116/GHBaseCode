//
//  CLLocationManager+GHExtension.h
//  GoHome
//
//  Created by YongCheHui on 16/6/28.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocationManager (GHExtension)<CLLocationManagerDelegate>
-(void)setUpdateLocationHandler:(void(^)(NSArray<CLLocation *> * locatoins,NSError* error))handler;
-(void)setReceiveAuthorChangeHandler:(void(^)(CLAuthorizationStatus status))handler;
@end
