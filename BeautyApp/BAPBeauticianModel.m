//
//  BACBeauticianModel.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 23/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBeauticianModel.h"

@implementation BAPBeauticianModel

// Mapping the JSON properties like self properties
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:
            @{
              @"id"             :   @"strBeauticianId",
              @"photo"          :   @"strBeauticianImageURL",
              @"name"           :   @"strBeauticianName",
              @"address"        :   @"beauticianAdressModel",
              @"rating"         :   @"beauticianRatingModel",
              @"degrees"        :   @"arrBeauticianDegrees",
              @"description"    :   @"strDescription",
              @"treatments"     :   @"arrBeauticiantreaTreatments"
              }];
}

@end
