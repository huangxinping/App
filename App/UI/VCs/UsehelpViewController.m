//
//  UsehelpViewController.m
//  App
//
//  Created by huangxinping on 9/22/14.
//  Copyright (c) 2014 ShareMerge. All rights reserved.
//

#import "UsehelpViewController.h"
#import "ICETutorialController.h"

@interface UsehelpViewController ()<ICETutorialControllerDelegate>

@property (nonatomic,strong) ICETutorialController *viewController;

@end

@implementation UsehelpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
	}
	return self;
}

- (NSString*)convertImageNameToDevice:(NSString*)imageName {
    if (IS_IPHONE_5_SCREEN) {
        return [imageName stringByAppendingFormat:@"-568h@2x.jpg"];
    }
    else if ([UIDevice retinaDisplaySupported])
    {
        return  [imageName stringByAppendingFormat:@"@2x.jpg"];
    }
    return [imageName stringByAppendingFormat:@".jpg"];
}

- (void)viewDidLoad
{
	[super viewDidLoad];

	// Init the pages texts, and pictures.
	ICETutorialPage *layer1 = [[ICETutorialPage alloc] initWithTitle:@""
	                           subTitle:@""
	                           pictureName:[self convertImageNameToDevice:@"usehelp_0"]
	                           duration:3.0];
	ICETutorialPage *layer2 = [[ICETutorialPage alloc] initWithTitle:@""
	                           subTitle:@""
	                           pictureName:[self convertImageNameToDevice:@"usehelp_1"]
	                           duration:3.0];
	ICETutorialPage *layer3 = [[ICETutorialPage alloc] initWithTitle:@""
	                           subTitle:@""
	                           pictureName:[self convertImageNameToDevice:@"usehelp_2"]
	                           duration:3.0];
	NSArray *tutorialLayers = @[layer1, layer2, layer3];

	// Set the common style for the title.
	ICETutorialLabelStyle *titleStyle = [[ICETutorialLabelStyle alloc] init];
	[titleStyle setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17.0f]];
	[titleStyle setTextColor:[UIColor whiteColor]];
	[titleStyle setLinesNumber:1];
	[titleStyle setOffset:180];
	[[ICETutorialStyle sharedInstance] setTitleStyle:titleStyle];

	// Set the subTitles style with few properties and let the others by default.
	[[ICETutorialStyle sharedInstance] setSubTitleColor:[UIColor whiteColor]];
	[[ICETutorialStyle sharedInstance] setSubTitleOffset:150];

	// Init tutorial.
	self.viewController = [[ICETutorialController alloc] initWithPages:tutorialLayers
	                                         delegate:self];
	[self.view addSubview:self.viewController.view];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

#pragma mark - ICETutorialController delegate
- (void)tutorialController:(ICETutorialController *)tutorialController scrollingFromPageIndex:(NSUInteger)fromIndex toPageIndex:(NSUInteger)toIndex {
	NSLog(@"Scrolling from page %lu to page %lu.", (unsigned long)fromIndex, (unsigned long)toIndex);
}

- (void)tutorialControllerDidReachLastPage:(ICETutorialController *)tutorialController {
	NSLog(@"Tutorial reached the last page.");
	static BOOL show = NO;
	if (show) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"usehelp"];
        [[NSUserDefaults standardUserDefaults] synchronize];
		[self performSegueWithIdentifier:EMBED_ROOT sender:self];
	}
	show = YES;
}

- (void)tutorialController:(ICETutorialController *)tutorialController didClickOnLeftButton:(UIButton *)sender {
	NSLog(@"Button 1 pressed.");
}

- (void)tutorialController:(ICETutorialController *)tutorialController didClickOnRightButton:(UIButton *)sender {
	NSLog(@"Button 2 pressed.");
	NSLog(@"Auto-scrolling stopped.");
}
@end
