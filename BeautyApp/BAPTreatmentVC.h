//
//  BACTreatmentVC.h
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 14/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBaseReservationVC.h"

@protocol TreatmentVCDelegate <NSObject>
- (void)didTappedSubmitTreatments:(NSString *)treatments;

@end

@interface BAPTreatmentVC : BAPBaseReservationVC

@property (nonatomic, assign)id<TreatmentVCDelegate> delegate;

@end
