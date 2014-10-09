/**
 *  NetController.h
 *  ShareMerge
 *
 *  Created by huangxp on 2014-03-02.
 *
 *  网络控制器
 *
 *  Copyright (c) www.sharemerge.com All rights reserved.
 */

/** @file */    // Doxygen marker

#import "NetController.h"
#import "NetBase/NetAPI.h"
#import <NSObject-Tap/NSObject+Tap.h>
#import "SharedActivityIndicatorView.h"

@interface NetController () {
}

@end


@implementation NetController

+ (instancetype)sharedInstance
{
    static NetController *instance;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        instance = [self manager];
    });
    return instance;
}

#pragma mark - requests
- (RACSignal *)fetchExampleAPIWithOS:(NSString *)os uuid:(NSString *)uuid
{
    [[SharedActivityIndicatorView sharedInstance] startActivity];

    @weakify(self);
    return [RACSignal createSignal:^RACDisposable *(id < RACSubscriber > subscriber) {
        @strongify(self);
        [[self  rac_GET:EXAMPLE_API(os, uuid)
             parameters:nil] subscribeNext:^(id objects) {
                                 if (objects)
                                 {
                                 [subscriber sendNext:objects];
                                 [subscriber sendCompleted];
                                 }
                                 else
                                 {
                                 [subscriber sendError:[NSError               errorWithDomain:[self className]
                                                                        code:500
                                                                    userInfo:@{ @"message": @"data error." }]];
                                 }

                                 [[SharedActivityIndicatorView sharedInstance] stopActivity];
                             }];
        return [RACDisposable disposableWithBlock:^{
                              }];
    }];
}

@end
