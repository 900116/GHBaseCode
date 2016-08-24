//
//  CLGeocoder+GHExtension.m
//  GoHome
//
//  Created by YongCheHui on 16/6/28.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "CLGeocoder+GHExtension.h"

@implementation CLGeocoder (GHExtension)


- (void)gh_reverseGeocodeLocation:(CLLocation *)location completionHandler:( void(^)(CLLocationCoordinate2D location2D,NSString *cityName,NSDictionary* addressDictionary,NSError* error))completionHandler {
    [self reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            if (completionHandler) {
                completionHandler(CLLocationCoordinate2DMake(0, 0),nil,nil,error);
            }
            return;
        }
        for (CLPlacemark * placemark in placemarks) {
            NSString *cityName = [placemark locality];
            if (cityName) {
                NSDictionary* cityInfo = [placemark addressDictionary];
                if (completionHandler) {
                    completionHandler(placemark.location.coordinate,cityName,cityInfo,error);
                }
                break;
            }
        }
    }];
}

- (void)gh_reverseGeocodeLocation2D:(CLLocationCoordinate2D)location2D completionHandler:(void(^)(CLLocationCoordinate2D location2D,NSString *cityName,NSDictionary* addressDictionary,NSError* error))completionHandler {
    CLLocation* location = [[CLLocation alloc]initWithLatitude:location2D.latitude longitude:location2D.longitude];
    [self gh_reverseGeocodeLocation:location completionHandler:completionHandler];
}

- (void)gh_geocodeAddressString:(NSString *)addressString completionHandler:(void(^)(CLLocationCoordinate2D location2D,NSString *cityName,NSDictionary* addressDictionary,NSError* error))completionHandler {
    [self
     geocodeAddressString:addressString completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
         if (!error) {
             for (CLPlacemark* mark in placemarks) {
                 NSString *cityName = [mark locality];
                 if (cityName) {
                     NSDictionary* cityInfo = [mark addressDictionary];
                     completionHandler(mark.location.coordinate,cityName,cityInfo,error);
                     break;
                 }
             }
         }
         else
         {
             completionHandler(CLLocationCoordinate2DMake(0, 0),nil,nil,error);
         }
     }];
}
@end
