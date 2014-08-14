//
//  BAPBeauticianLocationModel.m
//  BeautyApp
//
//  Created by nimrod borochov on 8/12/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBeauticianLocationModel.h"

@implementation BAPBeauticianLocationModel

// Mapping the JSON properties like self properties
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:
            @{
              @"__type"         :       @"strType",
              @"id"            :       @"strBeauticianLocationID",
              @"latitude"       :       @"numBeauticianLocationLatitude",
              @"longitude"      :       @"numBeauticianLocationLongitude"
              }];
}

@end