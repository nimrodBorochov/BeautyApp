//
//  BACWhenSelectionV.h
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 14/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WhenSelectionViewDelegate <NSObject>
- (void)userSelectedWhenOption:(NSString *)option;
- (void)userSelectedOtherWhenOption;
@end

@interface BAPWhenSelectionV : UIView

- (id)initWithFrame:(CGRect)frame Selection:(NSString *)selection;

// Delegate property
@property (nonatomic, assign) id<WhenSelectionViewDelegate> delegate;

@end