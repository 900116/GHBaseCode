//
//  CLLocationManager+GHExtension.m
//  GoHome
//
//  Created by YongCheHui on 16/6/28.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "CLLocationManager+GHExtension.h"
#import <objc/runtime.h>

@implementation CLLocationManager (GHExtension)
static const char * gh_locationUpdateKey = "gh_locationUpdateKey";
static const char * gh_locationAuthorChangeKey = "gh_locationAuthorChangeKey";

-(void)setUpdateLocationHandler:(void(^)(NSArray<CLLocation *> * oldLocatoin,NSError* error))handler {
    self.delegate = self;
    objc_setAssociatedObject(self, gh_locationUpdateKey, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    void(^ghLocationHandler)(NSArray<CLLocation *> *,NSError*) = objc_getAssociatedObject(self, gh_locationUpdateKey);
    if (ghLocationHandler) {
        ghLocationHandler(locations,nil);
    }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    void(^ghLocationHandler)(NSArray<CLLocation *> *,NSError*) = objc_getAssociatedObject(self, gh_locationUpdateKey);
    if (ghLocationHandler) {
        ghLocationHandler(nil,error);
    }
}

-(void)setReceiveAuthorChangeHandler:(void(^)(CLAuthorizationStatus status))handler {
    self.delegate = self;
    objc_setAssociatedObject(self, gh_locationAuthorChangeKey, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    void(^ghAuthorChangeHandler)(CLAuthorizationStatus) = objc_getAssociatedObject(self, gh_locationAuthorChangeKey);
    if (ghAuthorChangeHandler) {
        ghAuthorChangeHandler(status);
    }
}
@end
