//
//  CINumberFormatter.m
//  CIFoundation
//
//  Created by Moon on 2018/11/21.
//  Copyright © 2018 Moon. All rights reserved.
//

#import "CINumberFormatter.h"

@implementation CINumberFormatter

+ (NSString *)roundOff:(double)input
        fractionDigits:(NSInteger)fractionDigits {
    
    NSString *inputString = [NSString stringWithFormat:@"%f", input];
    
    NSDecimalNumber *number = [NSDecimalNumber decimalNumberWithString:inputString];
    
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [formatter setGroupingSize:3];
    [formatter setGroupingSeparator:@","];
    [formatter setCurrencySymbol:@""];
    
    // 取小數點後幾位由這裡決定
    [formatter setMaximumFractionDigits:fractionDigits];
    
    return [formatter stringFromNumber:number];
}

@end
