/**
 *  DBController.h
 *  ShareMerge
 *
 *  Created by huangxp on 2014-03-02.
 *
 *  数据库控制器
 *
 *  Copyright (c) www.sharemerge.com All rights reserved.
 */

/** @file */    // Doxygen marker

#import <Foundation/Foundation.h>
#import "DBAPI.h"
#import "DBControllerDelegate.h"

@interface DBController : NSObject

/**
 *  委托
 */
@property (nonatomic, assign) id <DBControllerDelegate> delegate;


@end
