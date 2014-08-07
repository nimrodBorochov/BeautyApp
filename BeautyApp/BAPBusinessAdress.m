//
//  BACBusinessAdress.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 17/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBusinessAdress.h"

@implementation BAPBusinessAdress

- (id)initWithBusinessCity:(NSString *)city streetName:(NSString *)streetName longitude:(double)longitude latitude:(double)latitude
{
    self = [super init];
    
    if (self)
    {
        _strBusinessCity = city;
        _strBusinessStreetName = streetName;
        _numBusinessLongitude = longitude;
        _numBusinessLatitude = latitude;
    }
    
    return self;
}

@end
