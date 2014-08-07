//
//  BACLocationSelectionV.h
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 14/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <UIKit/UIKit.h>

// Declear On protocol to delegate v to controller
@protocol LocationSelectionViewDelegate <NSObject>
- (void)userSelectLoctionOption:(NSString *)option;
- (void)userSelecteOtherHowOption;
@end

@interface BAPLocationSelectionV : UIView

- (id)initWithFrame:(CGRect)frame Selection:(NSString *)selection;

// Delegate property
@property (nonatomic, assign) id<LocationSelectionViewDelegate> delegate;

@end