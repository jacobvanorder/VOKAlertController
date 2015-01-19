//
//  VOKAlertAction.h
//  VOKAlertControllerExample
//
//  Created by mrJacob on 1/10/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VOKAlertAction;

typedef NS_ENUM(NSInteger, VOKAlertActionStyle) {
    VOKAlertActionStyleDefault = 0,
    VOKAlertActionStyleCancel,
    VOKAlertActionStyleDestructive,
};

typedef void (^VOKAlertActionCompletion)(VOKAlertAction *action);

@interface VOKAlertAction : NSObject

+ (instancetype)vok_actionWithTitle:(NSString *)title
                              style:(VOKAlertActionStyle)style
                            handler:(VOKAlertActionCompletion)handler;

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) VOKAlertActionStyle style;
@property (nonatomic, getter=isEnabled) BOOL enabled;

@end
