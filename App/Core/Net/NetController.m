/**
 *  NetController.h
 *  ShareMerge
 *
 *  Created by huangxp on 2014-03-02.
 *
 *  网络控制器
 *
 *  Copyright (c) www.sharemerge.com All rights reserved.
 */

/** @file */    // Doxygen marker

#import "NetController.h"
#import "SMHTTPRequestDelegate.h"

@interface NetController () <SMHTTPRequestDelegate> {
}

@end


@implementation NetController

- (id)init
{
    self = [super init];

    if (self)
    {
    }

    return self;
}

- (void)dealloc
{
}

- (void)httpRequestMagicWithType:(NSString *)url requestType:(SMRequestType)rt useCache:(BOOL)useCache activityText:(NSString *)activityText params:(NSDictionary *)params netRequestType:(NetRequestType)nrt
{
    [SMBlockRequestInstance makeRequest:rt
                              urlBuffer:url
                               useCache:useCache
                                timeOut:HOST_CONNECTION_TIMEOUT
                           activityText:activityText
                     activityOpenCancel:NO
                       activityOpenMask:NO
                        parametersBlock: ^NSDictionary *{
        __block NSMutableDictionary *p = [NSMutableDictionary dictionaryWithDictionary:params];
        return p;
    }

                             startBlock: ^UIView *{
        return activityText ? [UIApplication sharedApplication].keyWindow : nil;
    }

                              stopBlock: ^(id object) {
                                  if ([object isKindOfClass:[NSString class]])
                                  {
                                  if ([self.delegate
                                  respondsToSelector:@selector(netController:netRequestType:requestResult:)])
                                  {
                                  [self.delegate
                                   netController:self
                                                    netRequestType:nrt
                                    requestResult:object];
                                  }
                                  }
                                  else
                                  {
                                  if ([self.delegate
                                  respondsToSelector:@selector(netController:netRequestType:requestError:)])
                                  {
                                  [self.delegate
                                   netController:self
                                                    netRequestType:nrt
                                     requestError:object];
                                  }
                                  }
                              }

                       cancelRetryBlock: ^{
                       }];
}

- (void)fetchExampleAPIWithOS:(NSString *)os uuid:(NSString *)uuid
{
    [self httpRequestMagicWithType:EXAMPLE_API(os, uuid)
                       requestType:REQUEST_GET
                          useCache:NO
                      activityText:SMLocalization(@"capability.network.wait")
                            params:nil
                    netRequestType:NetRequestType_Example];
}

@end
