//
//  BAPTreatmentsModel.m
//  BeautyApp
//
//  Created by nimrod borochov on 8/14/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBeauticianTreatmentsModel.h"

@implementation BAPBeauticianTreatmentsModel

// Mapping the JSON properties like self properties
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:
            @{
              @"treatmentID"     :   @"intTreatmentID",
              @"treatmentName"       :   @"strTreatmentName"
              }];
}

@end
