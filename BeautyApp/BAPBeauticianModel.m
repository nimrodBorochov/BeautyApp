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
              @"beautician_id"         : @"strBeauticianUserId",
              @"name"       : @"strBeauticianName",
              @"type"       : @"strBeauticianType",
              @"email"      : @"strBeauticianEmail",
              @"latitude"    : @"dblBeauticianLatitude",
              @"longitude"   : @"dblBeauticianLongitude",
              @"description" : @"strBeauticianDescription",
              @"photo"       : @"strBeauticianImageURL",
              @"treatments"  : @"arrBeauticianTreatments",
              @"degrees"     : @"arrBeauticianDegrees",
              @"address"     : @"beauticianAdressModel",
              @"rating"      : @"beauticianRatingModel"
              }];
}
@end
