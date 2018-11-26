//
//  CINumberFormatterTests.m
//  CIAppKitTests
//
//  Created by Moon on 2018/11/26.
//  Copyright © 2018 MobileTeam. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CINumberFormatter.h"

@interface CINumberFormatterTests : XCTestCase

@end

@implementation CINumberFormatterTests

- (void)setUp {
    
}

- (void)tearDown {
    
}

- (void)test_roundOff {
    
    float input1 = 3.1415926;
    NSString *output1 = [CINumberFormatter roundOff:input1 fractionDigits:2];
    XCTAssertTrue([output1 isEqualToString:@"3.14"]);
    
    int input2 = 0;
    NSString *output2 = [CINumberFormatter roundOff:input2 fractionDigits:2];
    XCTAssertTrue([output2 isEqualToString:@"0.00"]);
    
    int input3 = 100;
    NSString *output3 = [CINumberFormatter roundOff:input3 fractionDigits:2];
    XCTAssertTrue([output3 isEqualToString:@"100.00"]);
    
    double input4 = 4.56789988;
    NSString *output4 = [CINumberFormatter roundOff:input4 fractionDigits:2];
    XCTAssertTrue([output4 isEqualToString:@"4.57"]);
    
    int input5 = 1000000;
    NSString *output5 = [CINumberFormatter roundOff:input5 fractionDigits:2];
    XCTAssertTrue([output5 isEqualToString:@"1,000,000.00"]);
    
    int input6 = 1000000;
    NSString *output6 = [CINumberFormatter roundOff:input6 fractionDigits:0];
    XCTAssertTrue([output6 isEqualToString:@"1,000,000"]);
}

@end
