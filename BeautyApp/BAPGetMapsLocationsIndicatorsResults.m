//
//  BACGetMapsLocationsIndicatorsResults.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 23/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPGetMapsLocationsIndicatorsResults.h"

@implementation BAPGetMapsLocationsIndicatorsResults

// Mapping the JSON server property like self property

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:
            @{  @"Response"  :   @"arrMapsLocationsIndicatorsModel"  }];
}

@end