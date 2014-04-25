/**
 *  UIEngine.h
 *  ShareMerge
 *
 *  Created by huangxp on 2014-03-01.
 *
 *  UI引擎
 *
 *  Copyright (c) www.sharemerge.com All rights reserved.
 */

/** @file */    // Doxygen marker

#import "UIEngine.h"

@interface UIEngine ()

@property (nonatomic, strong) CoreEngine *coreEngine;

@end

static UIEngine *uiEngine = nil;
@implementation UIEngine

- (id)init {
	if ((self = [super init])) {
		_coreEngine = [[CoreEngine alloc] init];
	}
	return self;
}

+ (instancetype)defaultUIEngine {
	static dispatch_once_t pred;
	dispatch_once(&pred, ^{
	    uiEngine = [[UIEngine alloc] init];
	});
	return uiEngine;
}

@end
