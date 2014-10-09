//
//  RootViewControllerModule.m
//  App
//
//  Created by huangxinping on 9/15/14.
//  Copyright (c) 2014 ShareMerge. All rights reserved.
//

#import "RootViewControllerModule.h"
#import <Objection.h>
#import "RootViewController.h"

@implementation RootViewControllerModule

+ (void)load
{
    JSObjectionInjector *injector = [JSObjection defaultInjector];
    injector = injector ? : [JSObjection createInjector];
    injector = [injector withModule:[[self alloc] init]];
    [JSObjection setDefaultInjector:injector];
}

- (void)configure
{
    [self bindClass:[RootViewController class] toProtocol:@protocol(RootViewControllerProtocol)];
}

@end
