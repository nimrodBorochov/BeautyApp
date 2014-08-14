//
//  BAMapViewAnnotation.m
//  BeautyApp
//
//  Created by Nimrod Borochov on 30/06/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPMapViewAnnotation.h"

@implementation BAPMapViewAnnotation


- (id)initWithIdentity:(NSString *)identity AndCoordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    _identity = identity;
    _coordinate = coordinate;
    
    return self;
}
@end
