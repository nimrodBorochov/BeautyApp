//
//  BAPValidateAddressFeed.m
//  BeautyApp
//
//  Created by nimrod borochov on 9/16/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPValidateAddressFeed.h"

@implementation BAPValidateAddressFeed

// Mapping the JSON property like self property
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:
            @{  @"d"   :  @"arrValidateAddress"   }];
}

@end
