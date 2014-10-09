//
//  SharedActivityIndicatorView.m
//  App
//
//  Created by huangxinping on 9/23/14.
//  Copyright (c) 2014 ShareMerge. All rights reserved.
//

#import "SharedActivityIndicatorView.h"

@interface SharedActivityIndicatorView ()<MONActivityIndicatorViewDelegate>

@end

SINGLETON_FOR_CLASS(SharedActivityIndicatorView)
@implementation SharedActivityIndicatorView
SINGLETON_FOR_FUNCTION(SharedActivityIndicatorView)

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self)
    {
    }

    return self;
}

- (id)init
{
    if ((self = [super init]))
    {
        self.delegate = self;
        self.numberOfCircles = 6;
        self.radius = 5;
        self.internalSpacing = 3;
    }

    return self;
}

- (void)startActivity
{
    [self stopActivity];
    [self startAnimating];
    self.center = [UIApplication sharedApplication].keyWindow.center;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

- (void)stopActivity
{
    [self stopAnimating];
    [self removeFromSuperview];
}

#pragma mark - MONActivityIndicatorViewDelegate Methods
- (UIColor *)activityIndicatorView:(MONActivityIndicatorView *)activityIndicatorView circleBackgroundColorAtIndex:(NSUInteger)index
{
    return [UIColor colorWithRed:0.110 green:0.604 blue:0.663 alpha:1.000];
}

@end
