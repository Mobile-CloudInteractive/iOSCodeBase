//
//  NSString+URLEncoding.h
//  CIAppKit
//
//  Created by Moon on 2018/12/17.
//  Copyright © 2018 MobileTeam. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (URLEncoding)

// 對 NSString 做百分號編碼,讓這個 NSString 可以轉成 URL 不會出現 nil
- (nullable NSString *)stringByAddingPercentEncodingForRFC3986;

@end

NS_ASSUME_NONNULL_END
