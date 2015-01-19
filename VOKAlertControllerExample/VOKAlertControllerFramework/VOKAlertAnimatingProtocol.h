//
//  VOKAlertAnimatingProtocol.h
//  VOKAlertControllerExample
//
//  Created by mrJacob on 1/19/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

@import UIKit;

@protocol VOKAlertAnimatingProtocol <NSObject>

@property (strong, nonatomic) UIView *view;

- (void)setNeedsStatusBarAppearanceUpdate;
/**
 *  Called when the menu is to be displayed. Handles what occurs in the animation block when its animation controller is activated.
 */
- (void)moveToOpenPositionAnimated:(BOOL)animated;
/**
 *  Called when the menu is to be hidden. Handles what occurs in the animation block when its animation controller is activated.
 */
- (void)moveToClosedPositionAnimated:(BOOL)animated;

@end