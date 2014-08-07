//
//  BACWalkthroughContentVC.h
//  BeautyApp_Client
//
//  Created by nimrod borochov on 7/30/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BAPWalkthroughContentVC : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *ivWalkThrogh;
@property (nonatomic) NSUInteger pageIndex;
@property (strong, nonatomic) NSString* imageFile;

@end
