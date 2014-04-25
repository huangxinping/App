/**
 *  NetControllerDelegate
 *  ShareMerge
 *
 *  Created by huangxp on 2014-03-05.
 *
 *  网络控制器委托
 *
 *  Copyright (c) www.sharemerge.com All rights reserved.
 */

/** @file */    // Doxygen marker

#import <Foundation/Foundation.h>
#import "NetAPI.h"

@class NetController;
@protocol NetControllerDelegate <NSObject>
@optional

// 网络原因登录失败
- (void)netController:(NetController *)netController netRequestType:(NetRequestType)nrt requestError:(NSError *)error;

// 登录返回数据
- (void)netController:(NetController *)netController netRequestType:(NetRequestType)nrt requestResult:(NSString *)responseString;

@end
