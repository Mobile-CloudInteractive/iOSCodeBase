//
//  CIAlertTests.m
//  CIFoundationTests
//
//  Created by Moon on 2018/11/20.
//  Copyright © 2018 Moon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CIAlertFactory.h"

@interface CIAlertTests : XCTestCase

@end

@implementation CIAlertTests

- (void)setUp {
   
}

- (void)tearDown {
    
}

- (void)test_createAlertWithoutAction {
    
    UIAlertController *withoutActionAlert = [CIAlertFactory createAlertWithoutAction:@"TestTitle" message:@"TestMessage"];
    
    XCTAssertTrue([withoutActionAlert isKindOfClass:[UIAlertController class]]);
    
    NSString *title = withoutActionAlert.title;
    NSString *message = withoutActionAlert.message;
    
    XCTAssertTrue([title isEqualToString:@"TestTitle"]);
    XCTAssertTrue([message isEqualToString:@"TestMessage"]);
}

- (void)test_createSimpleAlert {
    
    UIAlertController *simpleAlert = [CIAlertFactory createSimpleAlert:@"TestTitle" message:@"TestMessage" actionTitle:@"TestAction"];
    
    NSString *title = simpleAlert.title;
    NSString *message = simpleAlert.message;
    NSString *actionTitle = simpleAlert.actions.firstObject.title;
    
    XCTAssertTrue([title isEqualToString:@"TestTitle"]);
    XCTAssertTrue([message isEqualToString:@"TestMessage"]);
    XCTAssertTrue([actionTitle isEqualToString:@"TestAction"]);
}

@end
