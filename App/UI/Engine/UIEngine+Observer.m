/**
 *  UIEngine+Observer.h
 *  ShareMerge
 *
 *  Created by huangxp on 2014-03-02.
 *
 *  UI引擎侦听
 *
 *  Copyright (c) www.sharemerge.com All rights reserved.
 */

/** @file */    // Doxygen marker

#import "UIEngine+Observer.h"
#import "CoreEngine+Send.h"
#import "CoreEngine+DB.h"

@implementation UIEngine (Observer)

- (void)registerObserver {
	SM_BLOCK_RETAIN_CIRCLE typeof(self) weakSelf = self;

	[[NSNotificationCenter defaultCenter] registerNotificationName:ExampleObserver notifiedBlock: ^(NSNotification *notification) {
	    [weakSelf exampleAPI:notification];
	} removeSame:YES];
}

- (void)unregisterObserver {
	[[NSNotificationCenter defaultCenter] removeAllNotifications];
}

#pragma mark - 接口相关
- (void)exampleAPI:(NSNotification *)notification {
	NSDictionary *params = notification.object;
	[self.coreEngine fetchExampleAPIWithOS:params[@"os"] uuid:params[@"uuid"]];
}

#pragma mark - 数据提取相关
@end

#pragma mark - Observer，接口相关
NSString *const ExampleObserver = @"ExampleObserver";


#pragma mark - 数据有关
