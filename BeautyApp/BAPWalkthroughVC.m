//
//  BACWalkthroughVC.m
//  BeautyApp_Client
//
//  Created by nimrod borochov on 7/30/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPWalkthroughVC.h"
#import "UIView+Layout.h"
#import "BAPMainVC.h"

@interface BAPWalkthroughVC ()

@property (weak, nonatomic) IBOutlet UIView *containerWalktroughPageControler;

@end

@implementation BAPWalkthroughVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self checkLaunch];
    
         _walkthroughImages = @[@"WalkthroughOne", @"WalkthroughTow", @"WalkthroughTree", @"WalkthroughFour", @"WalkthroughFive"];
    
    [self setupWalkthrough];
}

- (void)checkLaunch
{
    // Do any additional setup after loading the view.
    NSUserDefaults * standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    BOOL islaunchInPast = [standardUserDefaults boolForKey:@"islaunchInPast"];
    
    if (!islaunchInPast)
    {
        [standardUserDefaults setBool:YES forKey:@"islaunchInPast"];
        
    }
    else
    {
        // Creating navigatio controller to show main view
        UINavigationController* navigationMain = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPNavigationMain"];
        
        // Present to BACMainVC with tha navigation
        [self presentViewController:navigationMain animated:YES completion:nil];
    }
}

- (void)setupWalkthrough
{
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    BAPWalkthroughContentVC* startingWalkthroughVC = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingWalkthroughVC];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
    
    [self.containerWalktroughPageControler addSubview:_pageViewController.view];
    
    [self.containerWalktroughPageControler fillWithView:self.pageViewController.view];
}


#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((BAPWalkthroughContentVC*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((BAPWalkthroughContentVC*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.walkthroughImages count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (BAPWalkthroughContentVC *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.walkthroughImages count] == 0) || (index >= [self.walkthroughImages count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    BAPWalkthroughContentVC *walkthroughContentVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPWalkthroughContentVC"];
    walkthroughContentVC.imageFile = self.walkthroughImages[index];
    walkthroughContentVC.pageIndex = index;
    
    return walkthroughContentVC;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.walkthroughImages count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (IBAction)btnExitWalkthroughTapped:(id)sender
{
    // Creating navigatio controller to show main view
    UINavigationController* navigationMain = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPNavigationMain"];
    
    // Present to BACMainVC with tha navigation
    [self presentViewController:navigationMain animated:YES completion:nil];
}


@end
