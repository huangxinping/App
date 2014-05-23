/**
 *  UIEngine+Post.h
 *  ShareMerge
 *
 *  Created by huangxp on 2014-03-01.
 *
 *  UI引擎发送
 *
 *  Copyright (c) www.sharemerge.com All rights reserved.
 */

/** @file */    // Doxygen marker

#import "UIEngine+Post.h"
#import "UIEngine+Observer.h"

@implementation UIEngine (Post)

- (void)bridgeExpressWithName:(NSString *)name params:(NSDictionary *)params addObserver:(id)observer callback:(NSDictionary *)callback overrideSame:(BOOL)overrideSame {
	[callback each: ^(id key, id object) {
	    [[NSNotificationCenter defaultCenter] registerNotificationName:key notifiedBlock: ^(NSNotification *notification) {
	        if ([observer respondsToSelector:NSSelectorFromString(object)]) {
	            [observer performSelectorOnMainThread:NSSelectorFromString(object) withObject:notification waitUntilDone:YES];
			}
		} removeSame:overrideSame];
	}];
	[[NSNotificationCenter defaultCenter] postNotificationName:name object:params];
}

@end
