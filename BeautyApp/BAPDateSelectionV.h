//
//  BACDateSelectionV.h
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 16/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DateSelectionDelegate <NSObject>
-(void)userTappedReturnBtn;
-(void)userTappedSubmitDateString:(NSString*)StrDate date:(NSDate *)date;

@end

@interface BAPDateSelectionV : UIView

@property (nonatomic, assign)id<DateSelectionDelegate> delegate;

@end
