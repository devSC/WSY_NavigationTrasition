//
//  WSYDeviceInfo.h
//  WSY_DeviceInfo
//
//  Created by Andou on 14/11/24.
//  Copyright (c) 2014年 SCDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSYDeviceInfo : NSObject

+ (NSString *)deviceName;
+ (NSString *)deviceModel;
+ (NSString *)deviceSystemVersion;
/**
 *  @return infoDictionary
 */
+ (NSDictionary *)infoDictionary;


+ (NSString *)currentShortVersionString;
@end
