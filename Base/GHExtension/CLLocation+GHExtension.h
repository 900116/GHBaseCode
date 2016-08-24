//
//  CLLocation+GHExtension.h
//  GoHome
//
//  Created by YongCheHui on 16/6/28.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
CLLocationCoordinate2D ghGPSLocationToMars(CLLocationCoordinate2D point);
CLLocationCoordinate2D ghMarsLocationToGPS(CLLocationCoordinate2D point);
@interface CLLocation (GHExtension)
-(CLLocationCoordinate2D)gpsLocationFromMars;
-(CLLocationCoordinate2D)marsLocationFromGPS;
+(NSString *)distanceWithFrist:(CLLocationCoordinate2D)first second:(CLLocationCoordinate2D)section;
@end
