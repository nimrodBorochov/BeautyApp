//
//  BAPGetOrderIdByPostReservation.h
//  BeautyApp
//
//  Created by nimrod borochov on 9/11/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBaseServerManager.h"

@interface BAPGetOrderIdByPostReservation : BAPBaseServerManager

- (void)getOrderIdForUserId:(NSString *)uid
             reservationFor:(NSString *)forwho
            reservationDate:(NSTimeInterval)reservationDate
        reservationLocation:(NSString *)reservationLocation
        reservationComments:(NSString *)reservationComments
      reservationTreatments:(NSArray *)treatments
               successBlock:(BAPSuccessBlock)successBlock
                failerBlock:(BAPFailerBlock)failerBlock;

@end
