//
//  VOKAlertAction.m
//  VOKAlertControllerExample
//
//  Created by mrJacob on 1/10/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import "VOKAlertAction.h"

@interface VOKAlertAction ()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) VOKAlertActionStyle style;
@property (nonatomic, strong) VOKAlertActionCompletion handler;

- (void)fireHandler;

@end
 
@implementation VOKAlertAction

#pragma mark - public -

+ (instancetype)vok_actionWithTitle:(NSString *)title
                              style:(VOKAlertActionStyle)style
                            handler:(VOKAlertActionCompletion)handler
{
    return [[VOKAlertAction alloc] initWithTitle:title
                                           style:style
                                         handler:handler];
}

#pragma mark - private -

- (instancetype)initWithTitle:(NSString *)title
                        style:(VOKAlertActionStyle)style
                      handler:(VOKAlertActionCompletion)handler
{
    if (self = [super init]) {
        _title = title;
        _style = style;
        _handler = handler;
    }
    
    return self;
}

- (void)fireHandler
{
    if (self.handler) {
        self.handler(self);
    }
}

@end
