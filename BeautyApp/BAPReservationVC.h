//
//  BACReservationVC.h
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 14/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBaseReservationVC.h"

@protocol ReservationDelegate <NSObject>

-(void)userTappedSubmitReservation;

@end

@interface BAPReservationVC : BAPBaseReservationVC

@property (nonatomic, assign)id<ReservationDelegate> delegate;

@end
