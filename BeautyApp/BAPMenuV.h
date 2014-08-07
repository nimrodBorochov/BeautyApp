//
//  BACMenuV.h
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 27/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BACMenuDelegate <NSObject>
- (void)userTappdPersonalInfo;
- (void)userTappdTreatmentHistory;
- (void)userTappdExplanation;
- (void)userTappdRegulations;

@end

@interface BAPMenuV : UIView

@property (nonatomic, assign) id<BACMenuDelegate> delegate;

@end
