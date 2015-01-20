//
//  WSYDeviceInfo.m
//  WSY_DeviceInfo
//
//  Created by Andou on 14/11/24.
//  Copyright (c) 2014年 SCDev. All rights reserved.
//

#import "WSYDeviceInfo.h"
#import <sys/utsname.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@implementation WSYDeviceInfo
+ (NSDictionary*)deviceNamesCode {
    static NSDictionary* deviceNamesByCode = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceNamesByCode = @{
                              @"iPhone3,1" :@"iPhone4",
                              @"iPhone4,1" :@"iPhone4S",
                              @"iPhone5,1" :@"iPhone5",
                              @"iPhone5,2" :@"iPhone5",
                              @"iPhone5,3" :@"iPhone5C",
                              @"iPhone5,4" :@"iPhone5C",
                              @"iPhone6,1" :@"iPhone5S",
                              @"iPhone7,2" :@"iPhone6",
                              @"iPhone7,1" :@"iPhone6Plus",
                              @"i386"      :@"Simulator",
                              @"x86_64"    :@"Simulator"
                              };
    });
    return deviceNamesByCode;
}

+ (NSString *)deviceName{
    return [[UIDevice currentDevice] name];
}

+ (NSString *)deviceModel
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *code = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSString *version = [[self deviceNamesCode] objectForKey:code];
    return version;
}
+ (NSString *)deviceSystemVersion{
    return [[UIDevice currentDevice] systemVersion];
}
/**
 *  @return infoDictionary
 */
+ (NSDictionary *)infoDictionary{
    return [[NSBundle mainBundle] infoDictionary];
}

+ (NSString *)currentShortVersionString{
    return [self.infoDictionary objectForKey:@"CFBundleShortVersionString"];
}


@end
