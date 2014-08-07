//
//  BACWalkthroughVC.h
//  BeautyApp_Client
//
//  Created by nimrod borochov on 7/30/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BAPWalkthroughContentVC.h"


@interface BAPWalkthroughVC : UIViewController<UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController* pageViewController;

@property (strong, nonatomic) NSArray *walkthroughImages;

@end
