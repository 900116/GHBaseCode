//
//  MKMapView+GHExtension.h
//  GoHome
//
//  Created by YongCheHui on 16/6/28.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKMapView (GHExtension)

- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate
                  zoomLevel:(NSUInteger)zoomLevel
                   animated:(BOOL)animated;
@end
