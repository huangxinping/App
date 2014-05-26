/**
 *  CoreEngine+Receive.h
 *  ShareMerge
 *
 *  Created by huangxp on 2014-03-02.
 *
 *  收到数据
 *
 *  Copyright (c) www.sharemerge.com All rights reserved.
 */

/** @file */    // Doxygen marker

#import "CoreEngine+Receive.h"

@implementation CoreEngine (Receive)

- (void)buildNetCallback
{
}

#pragma mark - 网络协议接收
- (void)netController:(NetController *)netController netRequestType:(NetRequestType)nrt requestError:(NSError *)error
{
    switch (nrt)
    {
        case NetRequestType_Example:
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:NetExampleFailure object:error];
            break;
        }

        case NetRequestType_None:
        default:
            break;
    }
}

- (void)netController:(NetController *)netController netRequestType:(NetRequestType)nrt requestResult:(NSString *)responseString
{
    switch (nrt)
    {
        case NetRequestType_Example:
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:NetExampleSuccess object:responseString];
            break;
        }

        case NetRequestType_None:
        default:
            break;
    }
}

@end
