//
//  SplashViewController.m
//  HLMZiniMini
//
//  Created by huangxinping on 3/13/14.
//  Copyright (c) 2014 sharemerge. All rights reserved.
//

#import "SplashViewController.h"

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
