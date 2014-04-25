//
//  CoreEngine+Send.m
//  ShareMerge
//
//  Created by huangxinping on 3/3/14.
//  Copyright (c) 2014 sharemerge. All rights reserved.
//

#import "CoreEngine+Send.h"

@implementation CoreEngine (Send)

- (void)fetchExampleAPIWithOS:(NSString *)os uuid:(NSString *)uuid;
{
	[_netController fetchExampleAPIWithOS:os uuid:uuid];
}

@end
