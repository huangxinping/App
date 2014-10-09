//
//  SharedActivityIndicatorView.h
//  App
//
//  Created by huangxinping on 9/23/14.
//  Copyright (c) 2014 ShareMerge. All rights reserved.
//

#import "MONActivityIndicatorView.h"

@interface SharedActivityIndicatorView : MONActivityIndicatorView
{
}
SINGLETON_FOR_HEADER(SharedActivityIndicatorView)

- (void)startActivity;

- (void)stopActivity;

@end
