//
//  UITableViewCell+GHExtension.m
//  GoHome
//
//  Created by YongCheHui on 16/6/17.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "UITableViewCell+GHExtension.h"

@implementation UITableViewCell (GHExtension)

-(NSString *)textStr {
    return self.textLabel.text;
}

-(void)setTextStr:(NSString *)textStr {
    self.textLabel.text = textStr;
}

-(void)setTextColor:(UIColor *)color {
    self.textLabel.textColor = color;
}

-(NSString *)detailStr {
    return self.detailTextLabel.text;
}

-(void)setDetailStr:(NSString *)detailStr
{
    self.detailTextLabel.text = detailStr;
}

-(void)setDetailColor:(UIColor *)color {
    self.detailTextLabel.textColor = color;
}

-(UIImage*)image {
    return self.imageView.image;
}

-(void)setImage:(UIImage *)image {
    self.imageView.image = image;
}
@end
