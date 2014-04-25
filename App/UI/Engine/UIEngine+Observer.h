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

#import "UIEngine.h"

@interface UIEngine (Observer)

/**
 *  注册
 */
- (void)registerObserver;

/**
 *  注销
 */
- (void)unregisterObserver;

@end

/********************
*  接口相关         *
********************/
extern NSString *const ExampleObserver;

/*******************
*  本地数据提取相关  *
*******************/
