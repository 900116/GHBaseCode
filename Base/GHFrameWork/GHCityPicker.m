//
//  GHCityPicker.m
//  GoHome
//
//  Created by YongCheHui on 16/6/24.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "GHCityPicker.h"

@interface GHCityPicker()<UIPickerViewDataSource,UIPickerViewDelegate>
@property(nonatomic,copy) NSDictionary* cityDatas;
@property(nonatomic,copy) NSArray* cityKeys;
@property(nonatomic,assign) NSInteger selectProvince;
@property(nonatomic,assign) NSInteger selectCity;
@end

@implementation GHCityPicker
-(instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame fullCountry:NO];
}

-(instancetype)initWithFrame:(CGRect)frame fullCountry:(BOOL)fullCountry
{
    self = [super initWithFrame:frame];
    if (self) {
        NSMutableDictionary* cityDatas = [[NSDictionary dictionaryWithPlistName:@"cityData"] mutableCopy];
        NSMutableArray* cityKeys = [[[cityDatas allKeys] sortedArrayUsingComparator:^NSComparisonResult(NSString*  _Nonnull obj1, NSString*   _Nonnull obj2) {
            return [obj1 pinyinFirstCap] >= [obj2 pinyinFirstCap];
        }] mutableCopy];
        if (fullCountry) {
            [cityKeys insertObject:@"全国" atIndex:0];
            [cityDatas setObject:@[@"全国"] forKey:@"全国"];
        }
        self.cityDatas = cityDatas;
        self.cityKeys = cityKeys;
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return [self.cityKeys count];
    }
    else
    {
        NSArray* array = self.cityDatas[self.cityKeys[self.selectProvince]];
        return array.count;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        self.selectProvince = row;
        [self reloadComponent:1];
    }
    else
    {
        self.selectCity = row;
    }
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
         return self.cityKeys[row];
    }
    else
    {
        NSArray* array = self.cityDatas[self.cityKeys[self.selectProvince]];
        return array[row];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(NSString*)selectString {
    NSMutableString* string = [NSMutableString new];
    if (self.selectProvince==0 && _containsAll) {
        return @"全国";
    }
    [string appendString:self.cityKeys[self.selectProvince]];
    [string appendString:@" "];
    [string appendString:self.cityDatas[self.cityKeys[self.selectProvince]][self.selectCity]];
    return [string copy];
}

-(void)selectWithCityString:(NSString*)cityStr {
    if ([cityStr isEqualToString:@"全国"]) {
        return;
    }
    NSArray* sep = [cityStr componentsSeparatedByString:@" "];
    NSString* city = sep[0];
    NSString* subCity = sep[1];
    NSInteger index = -1;
    NSInteger i = 0;
    for (NSString* key in self.cityKeys) {
        if ([key isEqualToString:city]) {
            index = i;
            break;
        }
        i++;
    }
    if (index > 0) {
        self.selectProvince = index;
         [self selectRow:index inComponent:0 animated:YES];
    }
    NSArray* subCitys = self.cityDatas[city];
    NSInteger subIndex = -1;
    i = 0;
    for (NSString* key in subCitys) {
        if ([key isEqualToString:subCity]) {
            subIndex = i;
            break;
        }
        i++;
    }
    if (subIndex > 0) {
        self.selectCity = subIndex;
        [self selectRow:subIndex inComponent:1 animated:YES];
    }
}

@end
