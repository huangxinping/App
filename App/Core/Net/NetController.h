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
#import <ReactiveCocoa.h>
#import <RACAFNetworking.h>
#import <RACEXTScope.h>

@interface NetController : AFHTTPRequestOperationManager

/*!
 *  @brief  单例
 *
 *  @return 实例句柄
 *
 *  @since 1.0
 */
+ (instancetype)sharedInstance;

/**
 *  提取测试网络连接例子
 *
 *  @param os   系统版本
 *  @param uuid 设备唯一标识符
 */
- (RACSignal *)fetchExampleAPIWithOS:(NSString *)os uuid:(NSString *)uuid;

@end
