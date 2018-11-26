//
//  CIFormatter.m
//  CIFoundation
//
//  Created by Moon on 2018/11/19.
//  Copyright © 2018 Moon. All rights reserved.
//

#import "CIFormatter.h"

@implementation CIFormatter

+(NSArray*)splitStringtoArray:(NSString*)string {
    NSMutableArray *tempArray = [[NSMutableArray alloc] initWithCapacity:[string length]];
    
    for (int i=0; i < [string length]; i++) {
        NSString *ichar  = [NSString stringWithFormat:@"%c", [string characterAtIndex:i]];
        [tempArray addObject:ichar];
    }
    
    NSArray *returnArray = tempArray;
    return returnArray;
}

+ (BOOL)isDecimal:(NSString *)string {
    
    if ([string length] == 0) {
        return NO;
    }
    
    if ([string rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]].location == NSNotFound) {
        return YES;
    }
    else {
        return NO;
    }
    
}

+ (BOOL)checkMobileNumber:(NSString *)mobileNumber {
    
    NSArray *splitedString = [self splitStringtoArray:mobileNumber];
    
    if (splitedString.count != 10) {
        return NO;
    }
    
    for (NSInteger i = 0; i < splitedString.count; i++) {
        
        NSString *character = splitedString[i];
        
        if (i == 0) {
            if (![character isEqualToString:@"0"]) {
                return NO;
            }
        }
        else if (i == 1) {
            if (![character isEqualToString:@"9"]) {
                return NO;
            }
        }
        else {
            if (![self isDecimal:character]) {
                return NO;
            }
        }
    }
    
    return YES;
}

+ (BOOL)checkNeedUpdateFrom:(NSString *)currentVersion needUpdateVersion:(NSString *)version {
    
    if ([version compare:currentVersion options:NSNumericSearch] == NSOrderedDescending) {
        return YES;
    }
    else {
        return NO;
    }
}

+(BOOL)checkEmailFormatIsValid:(NSString *)email {
    
    NSString *emailRegEx = @"[A-Z0-9a-z._%-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,100}";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    return [predicate evaluateWithObject:email];
}

@end
