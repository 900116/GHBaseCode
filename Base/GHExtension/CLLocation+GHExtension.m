//
//  CLLocation+GHExtension.m
//  GoHome
//
//  Created by YongCheHui on 16/6/28.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "CLLocation+GHExtension.h"
bool outOfChina(double lat, double lon)
{
    if (lon < 72.004 || lon > 137.8347)
        return true;
    if (lat < 0.8293 || lat > 55.8271)
        return true;
    return false;
}

double transformLat(double x, double y)
{
    double ret = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y + 0.2 * sqrt(abs(x));
    ret += (20.0 * sin(6.0 * x * M_PI) + 20.0 * sin(2.0 * x * M_PI)) * 2.0 / 3.0;
    ret += (20.0 * sin(y * M_PI) + 40.0 * sin(y / 3.0 * M_PI)) * 2.0 / 3.0;
    ret += (160.0 * sin(y / 12.0 * M_PI) + 320 * sin(y * M_PI / 30.0)) * 2.0 / 3.0;
    return ret;
}

double transformLon(double x, double y)
{
    double ret = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * sqrt(abs(x));
    ret += (20.0 * sin(6.0 * x * M_PI) + 20.0 * sin(2.0 * x * M_PI)) * 2.0 / 3.0;
    ret += (20.0 * sin(x * M_PI) + 40.0 * sin(x / 3.0 * M_PI)) * 2.0 / 3.0;
    ret += (150.0 * sin(x / 12.0 * M_PI) + 300.0 * sin(x / 30.0 * M_PI)) * 2.0 / 3.0;
    return ret;
}

const double a = 6378245.0;
const double ee = 0.00669342162296594323;

CLLocationCoordinate2D ghGPSLocationToMars(CLLocationCoordinate2D point)
{
    double wgLat = point.latitude;
    double wgLon = point.longitude;
    if (outOfChina(wgLat, wgLon))
    {
        return CLLocationCoordinate2DMake(wgLat, wgLon);
    }
    double dLat = transformLat(wgLon - 105.0, wgLat - 35.0);
    double dLon = transformLon(wgLon - 105.0, wgLat - 35.0);
    double radLat = wgLat / 180.0 * M_PI;
    double magic = sin(radLat);
    magic = 1 - ee * magic * magic;
    double sqrtMagic = sqrt(magic);
    dLat = (dLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * M_PI);
    dLon = (dLon * 180.0) / (a / sqrtMagic * cos(radLat) * M_PI);
    return CLLocationCoordinate2DMake(wgLat + dLat, wgLon + dLon);
    
}

CLLocationCoordinate2D ghMarsLocationToGPS(CLLocationCoordinate2D point) {
    CLLocationCoordinate2D gps = ghGPSLocationToMars(point);
    double lontitude = point.longitude * 2 - gps.longitude;
    double latitude = point.latitude * 2 - gps.latitude;
    return CLLocationCoordinate2DMake(latitude, lontitude);
}

@implementation CLLocation (GHExtension)


-(CLLocationCoordinate2D)gpsLocationFromMars {
    return ghMarsLocationToGPS(self.coordinate);
}

-(CLLocationCoordinate2D)marsLocationFromGPS {
    return ghGPSLocationToMars(self.coordinate);
}

+(NSString *)distanceWithFrist:(CLLocationCoordinate2D)first second:(CLLocationCoordinate2D)section
{
    //第一个坐标
    CLLocation *current=[[CLLocation alloc] initWithLatitude:first.latitude longitude:first.longitude];
    //第二个坐标
    CLLocation *before=[[CLLocation alloc] initWithLatitude:section.latitude longitude:section.longitude];
    // 计算距离
    CLLocationDistance meters=[current distanceFromLocation:before];
    meters = meters/1000.f;
    return [NSString stringWithFormat:@"%.1fkm",meters];
}
@end
