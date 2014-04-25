//
//  CoreEngine+Receive.m
//  ShareMerge
//
//  Created by huangxinping on 3/3/14.
//  Copyright (c) 2014 sharemerge. All rights reserved.
//

#import "CoreEngine+Receive.h"

@implementation CoreEngine (Receive)

- (void)buildNetCallback {
}

#pragma mark - 网络协议接收
- (void)netController:(NetController *)netController netRequestType:(NetRequestType)nrt requestError:(NSError *)error {
	switch (nrt) {
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

- (void)netController:(NetController *)netController netRequestType:(NetRequestType)nrt requestResult:(NSString *)responseString {
	switch (nrt) {
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
