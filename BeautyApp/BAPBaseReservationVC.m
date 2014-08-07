//
//  BACBaseReservationVC.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 15/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBaseReservationVC.h"




@interface BAPBaseReservationVC ()<CommentViewDelegat>


@end

@implementation BAPBaseReservationVC



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initDimView];
}

- (void)initDimView
{
    self.dimView = [UIView new];
    self.dimView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.dimView.backgroundColor = [UIColor blackColor];
    self.dimView.alpha = 0;
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                         action:@selector(closeView)];
    [self.dimView addGestureRecognizer:tap];
    
}

- (void)openCommentViewWithTitle:(NSString *)title
{
    [self dimerViewAction];
    
    self.commentsV = [[BAPCommentsV alloc]initWithFrame:CGRectZero andTitle:title];
    
    self.commentsV.delegate = self;
    
    self.commentsV.translatesAutoresizingMaskIntoConstraints = NO;
    self.commentsV.alpha = 0;
    [self.view addSubview:self.commentsV];
    
    [self.view addWidth:self.commentsV.frame.size.width andHeight:self.commentsV.frame.size.height toView:self.commentsV];
    self.constraintCommentViewY = [NSLayoutConstraint constraintWithItem:self.commentsV
                                                               attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.dimView
                                                               attribute:NSLayoutAttributeCenterY
                                                              multiplier:1.0 constant:0.0];
    [self.view addConstraint:self.constraintCommentViewY];
    
    self.constraintCommentViewX = [NSLayoutConstraint constraintWithItem:self.commentsV
                                                               attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.dimView
                                                               attribute:NSLayoutAttributeCenterX
                                                              multiplier:1.0 constant:0.0];
    [self.view addConstraint:self.constraintCommentViewX];
    
    [self.view layoutIfNeeded];
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.commentsV.alpha = 1;
        self.dimView.alpha = 0.5;
    }];
    
}


- (void)dimerViewAction
{
    [self.view addSubview:self.dimView];
    [self.view fillWithView:self.dimView];
}

- (void)userBeginEditing
{
    ///ABSTRAKT///
}

- (void)userTappedReturnBtn
{
    ///ABSTRAKT///
}

- (void)userTappedSubmitComment:(NSString *)comment
{
    ///ABSTRAKT///
}

- (void)closeView
{
    ///ABSTRAKT///
}


@end
