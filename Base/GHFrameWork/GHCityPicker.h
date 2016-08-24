//
//  GHCityPicker.h
//  GoHome
//
//  Created by YongCheHui on 16/6/24.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GHCityPicker : UIPickerView
-(instancetype)initWithFrame:(CGRect)frame fullCountry:(BOOL)fullCountry;
-(NSString*)selectString;
-(void)selectWithCityString:(NSString*)cityStr;
@property(nonatomic,assign) BOOL containsAll;
@end
