//
//  PushNoAnimationSegue.m
//  HLMZiniMini
//
//  Created by huangxinping on 3/13/14.
//  Copyright (c) 2014 sharemerge. All rights reserved.
//

#import "PushNoAnimationSegue.h"

@implementation PushNoAnimationSegue

- (void)perform {
	[[[self sourceViewController] navigationController] pushViewController:[self destinationViewController] animated:NO];
}

@end
