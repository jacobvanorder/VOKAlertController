//
//  VOKAlertController.m
//  VOKAlertControllerExample
//
//  Created by mrJacob on 1/10/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import "VOKAlertController.h"

@interface VOKInternalTextFieldStorageObject : NSObject

@property (nonatomic) UITextField *textField;
@property (nonatomic, strong) VOKTextFieldHandler handler;

+ (instancetype)internalTextFieldStorageObjectWithTextField:(UITextField *)textField andHandler:(VOKTextFieldHandler)handler;

@end

@implementation VOKInternalTextFieldStorageObject

+ (instancetype)internalTextFieldStorageObjectWithTextField:(UITextField *)textField andHandler:(VOKTextFieldHandler)handler
{
    VOKInternalTextFieldStorageObject *newObject = [VOKInternalTextFieldStorageObject new];
    newObject.textField = textField;
    newObject.handler = handler;
    return newObject;
}

@end

@interface VOKAlertController () <UITextFieldDelegate>

@property (nonatomic, readwrite) VOKAlertControllerStyle preferredStyle;

@property (nonatomic, copy) NSArray *actionArray;
@property (nonatomic, copy) NSArray *textFieldArray;

@end

@implementation VOKAlertController

#pragma mark - UITextFieldDelegate -

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

#pragma mark - public -

+ (instancetype)vok_alertControllerWithTitle:(NSString *)title
                                     message:(NSString *)message
                              preferredStyle:(VOKAlertControllerStyle)preferredStyle
{
    return [[VOKAlertController alloc] initWithTitle:title
                                             message:message
                                      preferredStyle:preferredStyle];
}

- (void)vok_addAction:(VOKAlertAction *)action
{
    self.actionArray = [self.actionArray arrayByAddingObject:action];
}


- (void)vok_addTextFieldWithConfigurationHandler:(VOKTextFieldHandler)configurationHandler
{
    UITextField *newTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    newTextField.delegate = self;
    VOKInternalTextFieldStorageObject *newObject;
    newObject = [VOKInternalTextFieldStorageObject internalTextFieldStorageObjectWithTextField:newTextField
                                                                                    andHandler:configurationHandler];
    self.textFieldArray = [self.textFieldArray arrayByAddingObject:newObject];
}

#pragma mark - private -

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
               preferredStyle:(VOKAlertControllerStyle)preferredStyle
{
    if (self = [super init]) {
        _title = title;
        _message = message;
        _preferredStyle = preferredStyle;
    }
    return self;
}

- (NSArray *)actionArray
{
    if (!_actionArray) {
        _actionArray = @[];
    }
    return _actionArray;
}

- (NSArray *)textFieldArray
{
    if (!_textFieldArray) {
        _textFieldArray = @[];
    }
    return _textFieldArray;
}

@end
