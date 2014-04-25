/**
 *  CoreEngine+Send
 *  ShareMerge
 *
 *  Created by huangxp on 2014-03-02.
 *
 *  发送数据请求
 *
 *  Copyright (c) www.sharemerge.com All rights reserved.
 */

/** @file */    // Doxygen marker

#import "CoreEngine.h"

@interface CoreEngine (Send)

/**
 *  提取测试网络连接例子
 *
 *  @param os   系统版本
 *  @param uuid 设备唯一标识符
 */
- (void)fetchExampleAPIWithOS:(NSString *)os uuid:(NSString *)uuid;

@end
