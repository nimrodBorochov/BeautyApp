//
//  BAPRegisterModel.m
//  BeautyApp
//
//  Created by nimrod borochov on 9/18/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPRegisterModel.h"

@implementation BAPRegisterModel

// Mapping the JSON property like self property
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:
            @{  @"uid"   :  @"strUserAppId"   }];
}

@end
