//
//  GHAddressBookManager.m
//  GoHome
//
//  Created by YongCheHui on 16/7/11.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "GHAddressBookManager.h"
#import <AddressBook/AddressBook.h>
@implementation GHABPerson


-(NSString *)allName {
    if (_firstName) {
        if (_lastName) {
            return [NSString stringWithFormat:@"%@%@",_lastName,_firstName];
        }
        else
        {
            return _firstName;
        }
    }
    else
    {
        if (_lastName) {
            return _lastName;
        }
        return nil;
    }
}
@end

@implementation GHAddressBookManager
{
    ABAddressBookRef _abRef;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        _abRef = ABAddressBookCreate();
       // ABAddressBookRegisterExternalChangeCallback(_abRef, addressBookChanged, (__bridge  void *)(self));
    }
    return self;
}

-(NSArray<NSArray*> *)getSortPeopleList:(NSMutableArray *)sectionTitles
{
    NSMutableArray<NSMutableArray*>* sortPersons = [[NSMutableArray alloc] init];
    for (int i = 0; i < 27; i++) {
        [sortPersons addObject:[NSMutableArray new]];
    }
    NSArray* persons = [self getPeopleList];
    
    for (GHABPerson* person in persons) {
        NSString* allName = [person allName];
        if (!allName) {
            continue;
        }
        char c =  [allName pinyinFirstCap];
        if (c >= 'a' && c <= 'z') {
            int index = c - 'a';
            NSMutableArray* subArray = sortPersons[index];
            [subArray addObject:person];
            sortPersons[index] = subArray;
        }
        else
        {
            NSMutableArray* subArray = sortPersons[26];
            [subArray addObject:person];
            sortPersons[26] = subArray;
        }
    }
    NSMutableArray* willRemove = [NSMutableArray new];
    for (NSMutableArray* array in sortPersons) {
        if (array.count == 0) {
            [willRemove addObject:array];
        }
        else
        {
            int idx = (int)[sortPersons indexOfObject:array];
            if (idx != 26) {
                char c = 'a'+idx-32;
                NSString* title = [NSString stringWithFormat:@"%c",c];
                [sectionTitles addObject:title];
            }
            else
            {
                [sectionTitles addObject:@"#"];
            }
        }
    }
    [sortPersons removeObjectsInArray:willRemove];
    return sortPersons;
}

-(NSArray*)getPeopleList
{
    NSMutableArray* persons = [NSMutableArray new];
    CFArrayRef results = ABAddressBookCopyArrayOfAllPeople(_abRef);

    for (int i = 0; i < CFArrayGetCount(results);++i) {
        ABRecordRef recordRef = CFArrayGetValueAtIndex(results, i);
        GHABPerson* person = [GHABPerson new];
        person.firstName = (__bridge NSString *)(ABRecordCopyValue(recordRef, kABPersonFirstNameProperty));
        person.lastName = (__bridge NSString *)(ABRecordCopyValue(recordRef, kABPersonLastNameProperty));
        person.middleName = (__bridge NSString *)(ABRecordCopyValue(recordRef, kABPersonMiddleNameProperty));
        
        person.prefix = (__bridge NSString *)(ABRecordCopyValue(recordRef, kABPersonPrefixProperty));
        person.suffix = (__bridge NSString *)(ABRecordCopyValue(recordRef, kABPersonSuffixProperty));
        person.nickName = (__bridge NSString *)(ABRecordCopyValue(recordRef, kABPersonNicknameProperty));
        
        person.firstNamePY = (__bridge NSString *)(ABRecordCopyValue(recordRef, kABPersonFirstNamePhoneticProperty));
        person.lastNamePY = (__bridge NSString *)(ABRecordCopyValue(recordRef, kABPersonLastNamePhoneticProperty));
        person.middleNamePY = (__bridge NSString *)(ABRecordCopyValue(recordRef, kABPersonMiddleNamePhoneticProperty));
        
        person.companyName = (__bridge NSString *)(ABRecordCopyValue(recordRef, kABPersonOrganizationProperty));
        person.departmenName = (__bridge NSString *)(ABRecordCopyValue(recordRef, kABPersonDepartmentProperty));
        person.jobTitle = (__bridge NSString *)(ABRecordCopyValue(recordRef, kABPersonJobTitleProperty));
        
        person.birthday = (__bridge NSString *)(ABRecordCopyValue(recordRef, kABPersonBirthdayProperty));
        person.node = (__bridge NSString *)(ABRecordCopyValue(recordRef, kABPersonNoteProperty));
        person.createTime = (__bridge NSString *)(ABRecordCopyValue(recordRef, kABPersonCreationDateProperty));
        person.lastUpdateTime = (__bridge NSString *)(ABRecordCopyValue(recordRef, kABPersonModificationDateProperty));
        
        ABMultiValueRef emailRec = ABRecordCopyValue(recordRef, kABPersonEmailProperty);
        int emailCount = (int)ABMultiValueGetCount(emailRec);
        NSMutableArray* emails = [NSMutableArray new];
        for (int x = 0; x < emailCount; ++x) {
            // NSString* emailLabel = (__bridge NSString*)ABAddressBookCopyLocalizedLabel(ABMultiValueCopyLabelAtIndex(emailRec, x));
            NSString* emailContent = (__bridge NSString*)ABMultiValueCopyValueAtIndex(emailRec, x);
            [emails addObject:emailContent];
        }
        person.emails = emails;
        
        ABMultiValueRef addressRec = ABRecordCopyValue(recordRef, kABPersonAddressProperty);
        int adCount = (int)ABMultiValueGetCount(addressRec);
        NSMutableArray* address = [NSMutableArray new];
        for(int j = 0; j < adCount; j++)
        {
            //获取地址Label
            NSString* addressLabel = (__bridge NSString*)ABMultiValueCopyLabelAtIndex(addressRec, j);
            //获取該label下的地址6属性
            //                NSDictionary* personaddress =(__bridge NSDictionary*) ABMultiValueCopyValueAtIndex(address, j);
            //                NSString* country = [personaddress valueForKey:(NSString *)kABPersonAddressCountryKey];
            //                NSString* city = [personaddress valueForKey:(NSString *)kABPersonAddressCityKey];
            //                NSString* state = [personaddress valueForKey:(NSString *)kABPersonAddressStateKey];
            //                NSString* street = [personaddress valueForKey:(NSString *)kABPersonAddressStreetKey];
            //                NSString* zip = [personaddress valueForKey:(NSString *)kABPersonAddressZIPKey];
            //                NSString* coutntrycode = [personaddress valueForKey:(NSString *)kABPersonAddressCountryCodeKey];
            [address addObject:addressLabel];
        }
        person.address = address;
        
        ABMultiValueRef dateRec = ABRecordCopyValue(recordRef, kABPersonDateProperty);
        int dateCount = (int)ABMultiValueGetCount(dateRec);
        NSMutableArray* dates = [NSMutableArray new];
        for(int j = 0; j < dateCount; j++)
        {
            //获取dates Label
            //NSString* datesLabel = (__bridge NSString*)ABAddressBookCopyLocalizedLabel(ABMultiValueCopyLabelAtIndex(dateRec, j));
            //获取dates值
            NSString* datesContent = (__bridge NSString*)ABMultiValueCopyValueAtIndex(dateRec, j);
            [dates addObject:datesContent];
        }
        person.dates = dates;
        
        CFNumberRef recordType = ABRecordCopyValue(recordRef, kABPersonKindProperty);
        int kind;
        CFNumberGetValue(recordType, kCFNumberSInt32Type, &kind);
        person.kind = kind;
        
        ABMultiValueRef phoneRec = ABRecordCopyValue(recordRef, kABPersonPhoneProperty);
        int phoneCount = (int)ABMultiValueGetCount(phoneRec);
        NSMutableArray* phones = [NSMutableArray new];
        for(int j = 0; j < phoneCount; j++)
        {
            //获取电话Label
            //NSString * personPhoneLabel = (__bridge NSString*)ABAddressBookCopyLocalizedLabel(ABMultiValueCopyLabelAtIndex(phoneRec, j));
            //获取該Label下的电话值
            NSString * personPhone = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phoneRec, j);
            [phones addObject:personPhone];
        }
        person.phones = phones;
        
        ABMultiValueRef urlRec = ABRecordCopyValue(recordRef, kABPersonURLProperty);
        int urlCount = (int)ABMultiValueGetCount(urlRec);
        NSMutableArray* urls = [NSMutableArray new];
        for(int j = 0; j < urlCount; j++)
        {
            //获取电话Label
            //NSString * urlLabel = (NSString*)ABAddressBookCopyLocalizedLabel(ABMultiValueCopyLabelAtIndex(urlRec, j));
            //获取該Label下的电话值
            NSString * urlContent = (__bridge NSString*)ABMultiValueCopyValueAtIndex(urlRec,j);
            [urls addObject:urlContent];
        }
        person.urls = urls;
        
        ABMultiValueRef imRec = ABRecordCopyValue(recordRef, kABPersonInstantMessageProperty);
        int imCount = (int)ABMultiValueGetCount(imRec);
        NSMutableArray* ims = [NSMutableArray new];
        for(int j = 0; j < imCount; j++)
        {
            //获取IM Label
            NSString* instantMessageLabel = (__bridge NSString*)ABMultiValueCopyLabelAtIndex(imRec, j);
            //获取該label下的2属性
            NSDictionary* instantMessageContent =(__bridge NSDictionary*) ABMultiValueCopyValueAtIndex(imRec, j);
            NSString* username = [instantMessageContent valueForKey:(NSString *)kABPersonInstantMessageUsernameKey];
            // NSString* service = [instantMessageContent valueForKey:(NSString *)kABPersonInstantMessageServiceKey];
            [ims addObject:[NSString stringWithFormat:@"%@:%@",instantMessageLabel,username]];
        }
        person.ims = ims;
        person.head = [UIImage imageWithData:(__bridge NSData*)ABPersonCopyImageData(recordRef)];
        
        [persons addObject:person];
        
    }
    CFRelease(results);
    return persons;
}


-(void)dealloc
{
    CFRelease(_abRef);
}

//void addressBookChanged(ABAddressBookRef addressBook, CFDictionaryRef info, void* context)
//{
//    NSLog(@"Address Book Changed");
//    //__bridge               arc显式转换。 与__unsafe_unretained 关键字一样 只是引用。被代入对象的所有者需要明确对象生命周期的管理，不要出现异常访问的问题
//    //__bridge_retained      类型被转换时，其对象的所有权也将被变换后变量所持有
//    //__bridge_transfer      本来拥有对象所有权的变量，在类型转换后，让其释放原先所有权 就相当于__bridge_retained后，原对像执行了release操作
//    //RootViewController *viewController = objc_unretainedObject(context);
//    //更新通讯录
//    //[viewController updateAddressBook];
//    
//    //注销通讯录更新回调
//    //    ABAddressBookUnregisterExternalChangeCallback(addressBook, addressBookChanged, context);
//}

-(BOOL)isAuthored {
    ABAuthorizationStatus authStatus =
    ABAddressBookGetAuthorizationStatus();
    
    if (authStatus != kABAuthorizationStatusAuthorized)
    {
        ABAddressBookRequestAccessWithCompletion
        (_abRef, ^(bool granted, CFErrorRef error)
         {
             dispatch_async(dispatch_get_main_queue(), ^{
                 if (error)
                     NSLog(@"Error: %@", (__bridge NSError *)error);
                 else if (!granted) {
                     UIAlertView *av = [[UIAlertView alloc]
                                        initWithTitle:@"授权失败"
                                        message:@"请去  设置>通过>隐私 进行设置"
                                        delegate:nil
                                        cancelButtonTitle:nil
                                        otherButtonTitles:@"OK", nil];
                     [av show];
                 }
                 else
                 {
                     ABAddressBookRevert(_abRef);
                 }
             });
         });
    }
    return authStatus == kABAuthorizationStatusAuthorized;
}
@end
