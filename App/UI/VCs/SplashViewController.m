/**
 *  RootViewController.h
 *  ShareMerge
 *
 *  Created by huangxp on 2014-03-01.
 *
 *  闪屏视图控制器
 *
 *  Copyright (c) www.sharemerge.com All rights reserved.
 */

/** @file */    // Doxygen marker

#import "SplashViewController.h"
#import <Colours/Colours.h>
#import <AutoLayoutShorthand/AutoLayoutShorthand.h>
#import <AutoLayoutKit/AutoLayoutKit.h>
#import <FoundationExtension/FoundationExtension.h>
#import <JDStatusBarNotification/JDStatusBarNotification.h>
#import <RegExCategories/RegExCategories.h>

#define DEFAULT_IMAGE_320X480   @"LaunchImage"
#define DEFAULT_IMAGE_640X960   @"LaunchImage@2x"
#define DEFAULT_IMAGE_640X1136  @"LaunchImage-568h@2x"
#define DEFAULT_IMAGE_1024X768  @"LaunchImage-Landscape~ipad"
#define DEFAULT_IMAGE_2048X1536 @"LaunchImage-700-Landscape@2x~ipad"
#define DEFAULT_IMAGE_768X1024  @"LaunchImage-700-Portrait~ipad"
#define DEFAULT_IMAGE_1536X2048 @"LaunchImage-700-Portrait@2x~ipad"

@interface SplashViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *splashImageView;

@end

@implementation SplashViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	self.view.backgroundColor = [UIColor coolPurpleColor];

	[self.splashImageView als_addConstraints:@{
	     @"left ==": als_superview,
	     @"width ==": @(320),
	     @"top ==": als_superview,
	     @"height >=": @(568),
	 }];
    
    [ALKConstraints layout:self.splashImageView do:^(ALKConstraints *c) {
        [c make:ALKCenterX equalTo:self.view s:ALKCenterX];
        [c make:ALKCenterY equalTo:self.view s:ALKCenterY];
        [c set:ALKWidth to:30.f];
        [c set:ALKHeight to:30.f];
    }];
    
    [ALKConstraints layout:self.splashImageView do:^(ALKConstraints *c) {
        [c centerIn:self.view];
        [c setSize:CGSizeMake(30.f, 30.f)];
    }];
    
    NSString *key = @"dsfont";
    NSURL *URL = [[@"http://127.0.0.1/api/%@" format:key] URL];
    NSLog(@"%@",URL);
    
    [JDStatusBarNotification showWithStatus:@"hello app" dismissAfter:2.0];
    
    BOOL isMatch = [@"I have 2 dogs." isMatch:RX(@"\\d+")];
    NSLog(@"%d",isMatch);
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];

	if (IS_IPHONE) {
		if (IS_IPHONE_5_SCREEN) {
			[self.splashImageView setImage:[UIImage imageNamed:DEFAULT_IMAGE_640X1136]];
		}
		else {
			[self.splashImageView setImage:[UIImage imageNamed:DEFAULT_IMAGE_640X960]];
		}
	}
	else {
		UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
		switch (orientation) {
			case UIInterfaceOrientationPortrait:
			case UIInterfaceOrientationPortraitUpsideDown:
			{
				[self.splashImageView setImage:[UIImage imageNamed:DEFAULT_IMAGE_1536X2048]];
				break;
			}

			case UIInterfaceOrientationLandscapeLeft:
			case UIInterfaceOrientationLandscapeRight:
			{
				[self.splashImageView setImage:[UIImage imageNamed:DEFAULT_IMAGE_2048X1536]];
			}

			default:
				break;
		}
	}

	SM_BLOCK_RETAIN_CIRCLE typeof(self) weakSelf = self;

	[UIView animateWithDuration:2.0f animations: ^{
	    weakSelf.splashImageView.alpha = 0.0f;
	} completion: ^(BOOL finished) {
	    [weakSelf performSegueWithIdentifier:EMBED_ROOT sender:self];
	    [[UIApplication sharedApplication] setStatusBarHidden:NO];
	}];
}

- (BOOL)prefersStatusBarHidden {
	return YES;
}

@end
