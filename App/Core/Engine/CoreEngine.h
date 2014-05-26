/**
 *  CoreEngine.h
 *  ShareMerge
 *
 *  Created by huangxp on 2014-03-02.
 *
 *  中心引擎
 *
 *  Copyright (c) www.sharemerge.com All rights reserved.
 */

/** @file */    // Doxygen marker

#import <Foundation/Foundation.h>
#import "NetController.h"
#import "DBController.h"

@interface CoreEngine : NSObject <NetControllerDelegate, DBControllerDelegate> {
    NetController *_netController;
    DBController *_dbController;
}

@end

#pragma mark - 网络
extern NSString *const NetExampleFailure;                  // 例子失败
extern NSString *const NetExampleSuccess;                  // 例子成功

#pragma mark - 数据库
