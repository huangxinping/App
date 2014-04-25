//
//  UIEngine+Post.m
//  HLMZiniMini
//
//  Created by huangxinping on 3/1/14.
//  Copyright (c) 2014 sharemerge. All rights reserved.
//

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
