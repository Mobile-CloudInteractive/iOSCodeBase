//
//  CIFoundationTests.m
//  CIFoundationTests
//
//  Created by Moon on 2018/11/19.
//  Copyright © 2018 Moon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CIFormatter.h"

@interface CIFoundationTests : XCTestCase

@end

@implementation CIFoundationTests

- (void)setUp {
    
}

- (void)tearDown {
    
}

- (void)test_isDecimal {
    
    NSString *notDecimal1 = @"A";
    BOOL resultNotDecimal1 = [CIFormatter isDecimal:notDecimal1];
    XCTAssertFalse(resultNotDecimal1);
    
    NSString *notDecimal2 = @"a";
    BOOL resultNotDecimal2 = [CIFormatter isDecimal:notDecimal2];
    XCTAssertFalse(resultNotDecimal2);
    
    NSString *notDecimal3 = @"%";
    BOOL resultNotDecimal3 = [CIFormatter isDecimal:notDecimal3];
    XCTAssertFalse(resultNotDecimal3);
    
    NSString *notDecimal4 = @"ABCabc";
    BOOL resultNotDecimal4 = [CIFormatter isDecimal:notDecimal4];
    XCTAssertFalse(resultNotDecimal4);
    
    NSString *notDecimal5 = @"1.2345";
    BOOL resultnotDecimal5 = [CIFormatter isDecimal:notDecimal5];
    XCTAssertFalse(resultnotDecimal5);
    
    NSString *notDecimal6 = @"";
    BOOL resultnotDecimal6 = [CIFormatter isDecimal:notDecimal6];
    XCTAssertFalse(resultnotDecimal6);
    
    NSString *isDecimal1 = @"1";
    BOOL resultIsDecimal1 = [CIFormatter isDecimal:isDecimal1];
    XCTAssertTrue(resultIsDecimal1);
    
    NSString *isDecimal2 = @"200";
    BOOL resultIsDecimal2 = [CIFormatter isDecimal:isDecimal2];
    XCTAssertTrue(resultIsDecimal2);
    
    NSString *isDecimal3 = @"0";
    BOOL resultIsDecimal3 = [CIFormatter isDecimal:isDecimal3];
    XCTAssertTrue(resultIsDecimal3);
    
    NSString *isDecimal4 = @"0000";
    BOOL resultIsDecimal4 = [CIFormatter isDecimal:isDecimal4];
    XCTAssertTrue(resultIsDecimal4);
}

- (void)test_checkMobileNumber {
    
    NSString *notMobile1 = @"1234567890";
    BOOL resultNotMobile1 = [CIFormatter checkMobileNumber:notMobile1];
    XCTAssertFalse(resultNotMobile1);
    
    NSString *notMobile2 = @"A123";
    BOOL resultNotMobile2 = [CIFormatter checkMobileNumber:notMobile2];
    XCTAssertFalse(resultNotMobile2);
    
    NSString *notMobile3 = @"A123456789";
    BOOL resultNotMobile3 = [CIFormatter checkMobileNumber:notMobile3];
    XCTAssertFalse(resultNotMobile3);
    
    NSString *notMobile4 = @"0888777666";
    BOOL resultNotMobile4 = [CIFormatter checkMobileNumber:notMobile4];
    XCTAssertFalse(resultNotMobile4);
    
    NSString *notMobile5 = @"09MM888777";
    BOOL resultNotMobile5 = [CIFormatter checkMobileNumber:notMobile5];
    XCTAssertFalse(resultNotMobile5);
    
    NSString *isMobile1 = @"0988777666";
    BOOL resultIsMobile1 = [CIFormatter checkMobileNumber:isMobile1];
    XCTAssertTrue(resultIsMobile1);
    
    NSString *isMobile2 = @"0988111222";
    BOOL resultIsMobile2 = [CIFormatter checkMobileNumber:isMobile2];
    XCTAssertTrue(resultIsMobile2);
    
}

- (void)test_checkVersionUpdate {
    
    NSString *version1 = @"1.0.0";
    NSString *version2 = @"1.0.1";
    
    BOOL needUpdate = [CIFormatter checkNeedUpdateFrom:version1 needUpdateVersion:version2];
    
    XCTAssertTrue(needUpdate);
    
    NSString *version3 = @"2.0.0";
    NSString *version4 = @"2.0.0";
    
    needUpdate = [CIFormatter checkNeedUpdateFrom:version3 needUpdateVersion:version4];
    
    XCTAssertFalse(needUpdate);
    
    NSString *version5 = @"1.2.0";
    NSString *version6 = @"1.1.0";
    
    needUpdate = [CIFormatter checkNeedUpdateFrom:version5 needUpdateVersion:version6];
    
    XCTAssertFalse(needUpdate);
    
    NSString *version7 = @"1.0.1";
    
    needUpdate = [CIFormatter checkNeedUpdateFrom:version5 needUpdateVersion:version7];
    
    XCTAssertFalse(needUpdate);
    
    NSString *version8 = @"2.2.1";
    
    needUpdate = [CIFormatter checkNeedUpdateFrom:version8 needUpdateVersion:version3];
    
    XCTAssertFalse(needUpdate);
    
}

- (void)test_checkEmailFormat {
    
    NSString *notEmail1 = @"sample*(*(@some.com";
    
    BOOL resultNotEmail1 = [CIFormatter checkEmailFormatIsValid:notEmail1];
    
    XCTAssertFalse(resultNotEmail1);
    
    NSString *notEmail2 = @"notEmail.com";
    
    BOOL resultNotEmail2 = [CIFormatter checkEmailFormatIsValid:notEmail2];
    
    XCTAssertFalse(resultNotEmail2);
    
    NSString *notEmail3 = @"pp2@pp.com@pp";
    
    BOOL resultNotEmail3 = [CIFormatter checkEmailFormatIsValid:notEmail3];
    
    XCTAssertFalse(resultNotEmail3);
    
    NSString *notEmail4 = @"ppop+dd@pp.com";
    
    BOOL resultNOtEmail4 = [CIFormatter checkEmailFormatIsValid:notEmail4];
    
    XCTAssertFalse(resultNOtEmail4);
    
    NSString *isEmail1 = @"isEmail@tt.cc";
    
    BOOL resultIsEmail1 = [CIFormatter checkEmailFormatIsValid:isEmail1];
    
    XCTAssertTrue(resultIsEmail1);
    
    NSString *isEmail2 = @"under_@tt.cc";
    
    BOOL resultIsEmail2 = [CIFormatter checkEmailFormatIsValid:isEmail2];
    
    XCTAssertTrue(resultIsEmail2);
    
    NSString *isEmail3 = @"dash-d@cll-oop.cc";
    
    BOOL resultIsEmail3 = [CIFormatter checkEmailFormatIsValid:isEmail3];
    
    XCTAssertTrue(resultIsEmail3);
    
    
}

@end
