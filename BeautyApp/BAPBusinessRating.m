//
//  BACBusinessRating.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 17/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBusinessRating.h"

@implementation BAPBusinessRating

- (id)initWithBusinessRateAverage:(NSNumber *)rateAverage raters:(NSNumber *)raters
{
    
    self = [super  init];
    
    if (self)
    {
        _numBusinessRateAverage = rateAverage;
        _numBusinessRaters = raters;
    }
    
    return self;
}

@end
