//
//  CIFormatter.h
//  CIFoundation
//
//  Created by Moon on 2018/11/19.
//  Copyright © 2018 Moon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CIFormatter : NSObject

// 檢查是不是此字串是不是全數字
+ (BOOL)isDecimal:(NSString*)string;

// 檢查此字串是不是符合台灣手機格式
+ (BOOL)checkMobileNumber:(NSString *)mobileNumber;

// 版本號檢查，如果 version 2 比 version 大
+ (BOOL)checkNeedUpdateFrom:(NSString*)version1
          needUpdateVersion:(NSString*)version2;

@end

NS_ASSUME_NONNULL_END
