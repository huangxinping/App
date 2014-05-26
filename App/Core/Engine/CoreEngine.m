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

#import "CoreEngine.h"
#import "DBController+Keychain.h"

@implementation CoreEngine

- (id)init
{
    self = [super init];

    if (self)
    {
        _netController = [[NetController alloc] init];
        _netController.delegate = self;

        _dbController = [[DBController alloc] init];
        _dbController.delegate = self;
    }

    return self;
}

- (void)dealloc
{
}

@end


#pragma mark - 网络
NSString *const NetExampleFailure = @"NetExampleFailure"; // 例子失败
NSString *const NetExampleSuccess = @"NetExampleSuccess"; // 例子成功

#pragma mark - 数据库
