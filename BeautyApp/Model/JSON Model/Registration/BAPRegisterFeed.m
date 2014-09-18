//
//  BAPRegisterFeed.m
//  BeautyApp
//
//  Created by nimrod borochov on 9/18/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPRegisterFeed.h"

@implementation BAPRegisterFeed

// Mapping the JSON property like self property
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:
            @{  @"d"   :  @"registerModel"   }];
}

@end
