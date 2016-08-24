//
//  GHAddressBookManager.h
//  GoHome
//
//  Created by YongCheHui on 16/7/11.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface GHABPerson:NSObject
@property(nonatomic,copy) NSString* firstName;
@property(nonatomic,copy) NSString* middleName;
@property(nonatomic,copy) NSString* lastName;

@property(nonatomic,copy) NSString* prefix;
@property(nonatomic,copy) NSString* suffix;
@property(nonatomic,copy) NSString* nickName;

@property(nonatomic,copy) NSString* firstNamePY;
@property(nonatomic,copy) NSString* middleNamePY;
@property(nonatomic,copy) NSString* lastNamePY;

@property(nonatomic,copy) NSString* companyName;
@property(nonatomic,copy) NSString* jobTitle;
@property(nonatomic,copy) NSString* departmenName;

@property(nonatomic,copy) NSString* birthday;
@property(nonatomic,copy) NSString* node;
@property(nonatomic,copy) NSString* createTime;
@property(nonatomic,copy) NSString* lastUpdateTime;

@property(nonatomic,copy) NSArray* emails;
@property(nonatomic,copy) NSArray* address;
@property(nonatomic,copy) NSArray* phones;
@property(nonatomic,copy) NSArray* dates;
@property(nonatomic,copy) NSArray* urls;
@property(nonatomic,copy) NSArray* ims;

@property(nonatomic,copy) UIImage* head;

@property(nonatomic,assign) int kind;
-(NSString *)allName;
@end


@interface GHAddressBookManager : NSObject
-(NSArray*)getPeopleList;
-(NSArray<NSArray*> *)getSortPeopleList:(NSMutableArray *)sectionTitles;
-(BOOL)isAuthored;
@end
