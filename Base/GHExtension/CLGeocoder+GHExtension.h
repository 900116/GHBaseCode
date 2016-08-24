//
//  CLGeocoder+GHExtension.h
//  GoHome
//
//  Created by YongCheHui on 16/6/28.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLGeocoder (GHExtension)
- (void)gh_reverseGeocodeLocation:(CLLocation *)location completionHandler:(void(^)(CLLocationCoordinate2D location2D,NSString *cityName,NSDictionary* addressDictionary,NSError* error))completionHandler;
- (void)gh_reverseGeocodeLocation2D:(CLLocationCoordinate2D)location2D completionHandler:(void(^)(CLLocationCoordinate2D location2D,NSString *cityName,NSDictionary* addressDictionary,NSError* error))completionHandler;

- (void)gh_geocodeAddressString:(NSString *)addressString completionHandler:(void(^)(CLLocationCoordinate2D location2D,NSString *cityName,NSDictionary* addressDictionary,NSError* error))completionHandler;;
@end
