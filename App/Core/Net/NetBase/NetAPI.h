/**
 *  NetAPI.h
 *  ShareMerge
 *
 *  Created by huangxp on 2014-03-01.
 *
 *  网络请求接口
 *
 *  Copyright (c) www.sharemerge.com All rights reserved.
 */

/** @file */    // Doxygen marker

#ifndef __NET_API__
#define __NET_API__

#define USE_EXAMPLE                     1
#if USE_EXAMPLE
		#define HOST_WEB_IP             @"http://huangxp.w46.mc-test.com"
		#define HOST_WEB_PORT           @"80"
		#define HOST_CONNECTION_TIMEOUT 10
#else
		#define HOST_WEB_IP             @""
		#define HOST_WEB_PORT           @""
		#define HOST_CONNECTION_TIMEOUT 30
#endif

typedef NS_ENUM (NSUInteger, NetRequestType) {
	NetRequestType_None = 0,
	NetRequestType_Example = 1,
};

#define EXAMPLE_API(os, uuid) [NSString stringWithFormat : @"%@:%@/myspace/Client_example/example.php?os=%@&uuid=%@", HOST_WEB_IP, HOST_WEB_PORT, os, uuid]

#endif /* ifndef __NET_API__ */
