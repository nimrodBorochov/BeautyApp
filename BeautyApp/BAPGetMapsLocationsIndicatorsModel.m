//
//  BACGetMapsLocationsIndicatorsFeed.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 21/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPGetMapsLocationsIndicatorsModel.h"

@implementation BAPGetMapsLocationsIndicatorsModel

// Mapping the JSON properties like self properties
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:
            @{
              @"id"         :   @"strIndicatorId",
              @"latitude"   :   @"strIndicatorLatitude",
              @"longitude"  :   @"strIndicatorLongitude",
              @"type"       :   @"strIndicatorType"
              }];
}

@end
