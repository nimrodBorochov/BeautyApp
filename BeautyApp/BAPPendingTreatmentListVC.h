//
//  BAPTreatmentListVC.h
//  BeautyApp
//
//  Created by nimrod borochov on 9/7/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBaseVC.h"

@protocol PendingTreatmentListDelegate <NSObject>

-(void)userDidSubmitReservation;

@end

@interface BAPPendingTreatmentListVC : BAPBaseVC

@property (nonatomic, assign)id<PendingTreatmentListDelegate> delegate;

@end
