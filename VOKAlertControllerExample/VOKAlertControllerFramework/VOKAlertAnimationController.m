//
//  VOKAlertAnimationController.m
//  VOKAlertControllerExample
//
//  Created by mrJacob on 1/19/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import "VOKAlertAnimationController.h"

@interface VOKAlertAnimationController ()

@property (nonatomic) BOOL isBeingPresented;

@end

@implementation VOKAlertAnimationController

#pragma mark - public -

+ (instancetype)animationControllerAsBeingPresented:(BOOL)isBeingPresented
{
    VOKAlertAnimationController *animationController = [VOKAlertAnimationController new];
    animationController.isBeingPresented = isBeingPresented;
    return animationController;
}

#pragma mark - UIViewControllerAnimatedTransitioning -

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
}

@end
