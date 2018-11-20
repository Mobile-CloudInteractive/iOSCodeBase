//
//  CIAlertFactory.h
//  CIFoundation
//
//  Created by Moon on 2018/11/20.
//  Copyright © 2018 Moon. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CIAlertFactory : NSObject

// 生出一個 alert controller,不帶 action, action 在生出後自己客製化增加
+ (UIAlertController*)createAlertWithoutAction:(NSString*)title message:(NSString*)message;

// 生出一個簡單 alert controller, 點擊後自動消失,沒有其他作用
+ (UIAlertController*)createSimpleAlert:(NSString*)title message:(NSString*)message actionTitle:(NSString*)actionTitle;

@end

NS_ASSUME_NONNULL_END
