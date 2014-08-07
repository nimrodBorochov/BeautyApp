//
//  BABusiness.m
//  BeautyApp
//
//  Created by Nimrod Borochov on 24/06/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBusiness.h"

@implementation BAPBusiness

- (id)initWithID:(NSString *)Identity name:(NSString *)name image:(UIImage *)image adress:(BAPBusinessAdress *)adress rating:(BAPBusinessRating *)rating beauticianDegrees:(NSString*)beauticianDegrees beauticianFirstCertificate:(NSString *)beauticianFirstCertificate beauticianSecondCertificate:(NSString *)beauticianSecondCertificate services:(BAPBusinessServices *)services
{
    self = [super init];
    
    if (self)
    {
        _strBusinessID = Identity;
        _strBusinessName = name;
        _imageOfBusines = image;
        _businessAdress = adress;
        _businessRating = rating;
        _strBeauticianDegrees = beauticianDegrees;
        _strBeauticianFirstCertificate = beauticianFirstCertificate;
        _strBeauticianSecondCertificate = beauticianSecondCertificate;
        _businessServices = services;
        _strBusinessFullAdress = [_businessAdress.strBusinessCity stringByAppendingString:_businessAdress.strBusinessStreetName];
    }
    
    return self;
}
@end