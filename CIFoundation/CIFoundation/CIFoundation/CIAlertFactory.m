//
//  CIAlertFactory.m
//  CIFoundation
//
//  Created by Moon on 2018/11/20.
//  Copyright © 2018 Moon. All rights reserved.
//

#import "CIAlertFactory.h"

@implementation CIAlertFactory

+ (UIAlertController *)createAlertWithoutAction:(NSString *)title message:(NSString *)message {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    return alertController;
}

+ (UIAlertController *)createSimpleAlert:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:action];
    
    return alertController;
}

@end
