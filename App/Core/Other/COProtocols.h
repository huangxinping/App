//
//  COProtocols.h
//  App
//
//  Created by huangxinping on 9/15/14.
//  Copyright (c) 2014 ShareMerge. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RACSignal;

@protocol RootViewControllerProtocol <NSObject>

- (void)monitoringNetwork;

@end

@protocol CarBrandViewControllerProtocol <NSObject>

@property (strong, nonatomic) NSNumber *twiceSelect;

@end