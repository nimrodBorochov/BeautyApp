//
//  BACForHowSelectionV.h
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 14/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ForHowSelectionViewDelegate <NSObject>
- (void)userSelecteForHowOption:(NSString *)option;
- (void)userSelecteOtherHowOption;
@end

@interface BAPForHowSelectionV : UIView

- (id)initWithFrame:(CGRect)frame Selection:(NSString *)selection;

@property (nonatomic, assign) id<ForHowSelectionViewDelegate> delegate;

@end

