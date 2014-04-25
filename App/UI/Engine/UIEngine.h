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

#import <Foundation/Foundation.h>
#import "CoreEngine.h"

@interface UIEngine : NSObject

/**
 *  核心引擎
 */
@property (nonatomic, strong, readonly) CoreEngine *coreEngine;

+ (instancetype)defaultUIEngine;

@end
