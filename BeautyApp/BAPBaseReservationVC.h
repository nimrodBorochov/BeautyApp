//
//  BACBaseReservationVC.h
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 15/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBaseVC.h"
#import "UIView+Layout.h"
#import "BAPCommentsV.h"

static NSString *const HOW = @"how";
static NSString *const WHEN = @"when";
static NSString *const LOCATION = @"location";
static NSString *const COMMENT = @"comment";
static NSString *const COMMENT_HEB = @"הערות";
static NSString *const OTHER_HEB = @"אחר";

@interface BAPBaseReservationVC : BAPBaseVC

// UI code Properties
@property (strong, nonatomic) NSLayoutConstraint* constraintCommentViewY;
@property (strong, nonatomic) NSLayoutConstraint* constraintCommentViewX;
@property (strong, nonatomic) UIView* dimView;

@property (strong, nonatomic) BAPCommentsV* commentsV;

- (void)dimerViewAction;
- (void)openCommentViewWithTitle:(NSString *)title;

@end
