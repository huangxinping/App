/**
 *  DBControllerDelegate
 *  ShareMerge
 *
 *  Created by huangxp on 2014-03-05.
 *
 *   数据库控制器委托
 *
 *  Copyright (c) www.sharemerge.com All rights reserved.
 */

/** @file */    // Doxygen marker

#import <Foundation/Foundation.h>
#import "DBAPI.h"

@class DBController;
@protocol DBControllerDelegate <NSObject>
@optional

/**
 *  数据提取失败
 *
 *  @param dbController 数据控制器
 *  @param dbCode       数据操作码
 *  @param error        错误码
 */
- (void)dbController:(DBController *)dbController dbRequestType:(DBRequestType)dbrt requestError:(NSError *)error;

/**
 *  数据提取成功
 *
 *  @param dbController 数据控制器
 *  @param dbrt         数据操作码
 *  @param result       结果
 */
- (void)dbController:(DBController *)dbController dbRequestType:(DBRequestType)dbrt requestResult:(id)result;

@end
