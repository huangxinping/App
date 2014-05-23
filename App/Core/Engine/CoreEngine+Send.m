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

#import "CoreEngine+Send.h"

@implementation CoreEngine (Send)

- (void)fetchExampleAPIWithOS:(NSString *)os uuid:(NSString *)uuid;
{
	[_netController fetchExampleAPIWithOS:os uuid:uuid];
}

@end
