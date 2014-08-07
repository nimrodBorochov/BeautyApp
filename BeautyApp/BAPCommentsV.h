//
//  BACCommentsV.h
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 14/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <UIKit/UIKit.h>

// Declear On protocol to delegate v to controller
@protocol CommentViewDelegat <NSObject>
-(void)userBeginEditing;
-(void)userTappedReturnBtn;
-(void)userTappedSubmitComment:(NSString*)comment;
@end

@interface BAPCommentsV : UIView

// Public Metode
- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)title;

// Delegate property
@property (assign, nonatomic)id<CommentViewDelegat> delegate;

@end
