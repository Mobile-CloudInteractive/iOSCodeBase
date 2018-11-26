//
//  CINumberFormatter.h
//  CIFoundation
//
//  Created by Moon on 2018/11/21.
//  Copyright © 2018 Moon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CINumberFormatter : NSObject

// 把一個 double 數字加上千分位,還可以設定小數點到幾位,小數點不足會補0
+ (NSString*)roundOff:(double)input fractionDigits:(NSInteger)fractionDigits;

@end

NS_ASSUME_NONNULL_END
