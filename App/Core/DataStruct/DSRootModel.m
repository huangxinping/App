/**
 *  DSRootModel
 *  ShareMerge
 *
 *  Created by huangxp on 2014-10-09.
 *
 *  根模型，创造序列化、自动描述入口
 *
 *  Copyright (c) www.sharemerge.com All rights reserved.
 */

#import "DSRootModel.h"
#import <NSObject-NSCoding/NSObject+NSCoding.h>
#import <NSObject+AutoDescription/NSObject+AutoDescription.h>
#import "Archiver.h"

@implementation DSRootModel

- (NSString *)description
{
    return [self autoDescription];
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [self autoEncodeWithCoder:coder];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        [self autoDecode:aDecoder];
    }

    return self;
}

@end
