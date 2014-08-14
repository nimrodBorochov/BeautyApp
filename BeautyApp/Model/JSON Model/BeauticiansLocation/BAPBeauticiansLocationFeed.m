//
//  BAPBeauticiansLocationFeed.m
//  BeautyApp
//
//  Created by nimrod borochov on 8/12/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBeauticiansLocationFeed.h"

@implementation BAPBeauticiansLocationFeed

// Mapping the JSON property like self property
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:
            @{  @"d"   :  @"arrBeauticiansLocation"   }];
}

@end
