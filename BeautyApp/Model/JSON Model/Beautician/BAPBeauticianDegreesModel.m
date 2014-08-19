//
//  BAPBeauticianDegreesModel.m
//  BeautyApp
//
//  Created by nimrod borochov on 8/17/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBeauticianDegreesModel.h"

@implementation BAPBeauticianDegreesModel

// Mapping the JSON properties like self properties
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:
            @{
              @"degreedesc"       :   @"strBeauticianDegreesDesc"
              }];
}

@end
