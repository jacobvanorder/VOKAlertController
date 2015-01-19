//
//  VOKAlertController.h
//  VOKAlertControllerExample
//
//  Created by mrJacob on 1/10/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, VOKAlertControllerStyle) {
    VOKAlertControllerStyleActionSheet = 0,
    VOKAlertControllerStyleAlert,
};

typedef void (^VOKTextFieldHandler)(UITextField *);

@class VOKAlertAction;

@interface VOKAlertController : UIViewController

/**
 *  Creates and returns a view controller for displaying an alert to the user.
 *
 *  @param title          The title of the alert. Use this string to get the user’s attention and communicate the 
 *  reason for the alert.
 *  @param message        Descriptive text that provides additional details about the reason for the alert.
 *  @param preferredStyle The style to use when presenting the alert controller. Use this parameter to configure the 
 *  alert controller as an action sheet or as a modal alert.
 *
 *  @return An initialized alert controller object.
 */
+ (instancetype)vok_alertControllerWithTitle:(NSString *)title
                                     message:(NSString *)message
                              preferredStyle:(VOKAlertControllerStyle)preferredStyle;
/**
 *  Attaches an action object to the alert or action sheet.
 *
 *  @param action The action object to display as part of the alert. Actions are displayed as
 *  buttons in the alert. The action object provides the button text and the action to be
 *  performed when that button is tapped.
 */
- (void)vok_addAction:(VOKAlertAction *)action;

/**
 *  Adds a text field to an alert.
 *
 *  @param configurationHandler A block for configuring the text field prior to displaying the alert. This block has no return value and takes a single parameter corresponding to the text field object. Use that parameter to change the text field properties.
 */
- (void)vok_addTextFieldWithConfigurationHandler:(VOKTextFieldHandler)configurationHandler;

///The actions are in the order in which you added them to the alert controller. This order also corresponds to the order in which they are displayed in the alert or action sheet. The second action in the array is displayed below the first, the third is displayed below the second, and so on. An array of VOKAlertActions
@property (nonatomic, readonly) NSArray *actions;

///Use this property to access the text fields displayed by the alert. The text fields are in the order in which you added them to the alert controller. This order also corresponds to the order in which they are displayed in the alert.
@property (nonatomic, readonly) NSArray *textFields;

///The title string is displayed prominently in the alert or action sheet. You should use this string to get the user’s attention and communicate the reason for displaying the alert.
@property (nonatomic, copy) NSString *title;


///The title string is displayed below the title string and is less prominent. Use this string to provide additional context about the reason for the alert or about the actions that the user might take.
@property (nonatomic, copy) NSString *message;

@property (nonatomic, readonly) VOKAlertControllerStyle preferredStyle;

@end
