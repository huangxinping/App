/**
 *  UIEngine+Post.h
 *  ShareMerge
 *
 *  Created by huangxp on 2014-03-01.
 *
 *  UI引擎发送
 *
 *  Copyright (c) www.sharemerge.com All rights reserved.
 */

/** @file */    // Doxygen marker

#import "UIEngine.h"

typedef void (^UIEngineCompletionBlock)(id object);
typedef void (^UIEngineFailureBlock)(NSError *error);


@interface UIEngine (Post)

/**
 *  桥接快车
 *
 *  @param name         数据提取名称
 *  @param params       参数
 *  @param observer     观察者
 *  @param callback     回掉
 *  @param overrideSame 是否重叠回掉中的通知
 *
 *
 *  例子：
 *      [[UIEngine defaultUIEngine] bridgeExpressWithName:ExampleObserver
                                                   params:@{
                                                                @"os": [[UIDevice systemName] urlEncodedString],
                                                                @"uuid":[@"A2A9DA84-7B56-4A51-99DD-374A8F9457AA" urlEncodedString]
                                                            }
                                              addObserver:self
                                                 callback:@{
                                                                NetExampleSuccess: NSStringFromSelector(@selector(requestSuccess:)),
                                                                NetExampleFailure: NSStringFromSelector(@selector(requestFailure:))
                                                            }
                                             overrideSame:YES];
 *
 *
 *
 *
 */
- (void)bridgeExpressWithName:(NSString *)name params:(NSDictionary *)params addObserver:(id)observer callback:(NSDictionary *)callback overrideSame:(BOOL)overrideSame;

@end
