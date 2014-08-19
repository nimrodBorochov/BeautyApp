//
//  BACBeauticianRatingModel.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 23/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBeauticianRatingModel.h"

@implementation BAPBeauticianRatingModel

// Mapping the JSON properties like self properties
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:
            @{
              @"rateCalculated"   :   @"dblRate",
              @"ratersCounter"    :   @"intRaters"
              }];
}

@end
