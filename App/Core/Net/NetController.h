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

#import <Foundation/Foundation.h>
#import "NetControllerDelegate.h"

@interface NetController : NSObject

/**
 *  网络控制器委托
 */
@property (nonatomic, assign) id <NetControllerDelegate> delegate;

/**
 *  提取测试网络连接例子
 *
 *  @param os   系统版本
 *  @param uuid 设备唯一标识符
 */
- (void)fetchExampleAPIWithOS:(NSString *)os uuid:(NSString *)uuid;

@end
