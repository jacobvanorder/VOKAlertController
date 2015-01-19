//
//  VOKAlertAnimationController.h
//  VOKAlertControllerExample
//
//  Created by mrJacob on 1/19/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VOKAlertAnimationController : NSObject <UIViewControllerAnimatedTransitioning>

+ (instancetype)animationControllerAsBeingPresented:(BOOL)isBeingPresented;

@end
