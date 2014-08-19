//
//  BAPTreatmentsModel.h
//  BeautyApp
//
//  Created by nimrod borochov on 8/14/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "JSONModel.h"

// Defined a protocol for ather classes to use as object
@protocol BAPBeauticianTreatmentsModel @end

@interface BAPBeauticianTreatmentsModel : JSONModel

@property (assign, nonatomic) int intTreatmentID;
@property (strong, nonatomic) NSString* strTreatmentName;

@end
