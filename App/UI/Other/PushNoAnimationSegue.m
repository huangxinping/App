/**
 *  PushNoAnimationSegue.h
 *  ShareMerge
 *
 *  Created by huangxp on 2014-03-10.
 *
 *  push无动画segue
 *
 *  Copyright (c) www.sharemerge.com All rights reserved.
 */

/** @file */    // Doxygen marker

#import "PushNoAnimationSegue.h"

@implementation PushNoAnimationSegue

- (void)perform {
	[[[self sourceViewController] navigationController] pushViewController:[self destinationViewController] animated:NO];
}

@end
