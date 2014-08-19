//
//  BAPBeauticiansArrayFeed.m
//  BeautyApp
//
//  Created by nimrod borochov on 8/18/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBeauticiansArrayFeed.h"

@implementation BAPBeauticiansArrayFeed

// Mapping the JSON property like self property
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:
            @{  @"d"   :  @"arrBeauticiansModel"   }];
}

@end
