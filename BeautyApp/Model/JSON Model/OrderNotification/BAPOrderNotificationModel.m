//
//  BAPOrderNotificationModel.m
//  BeautyApp
//
//  Created by nimrod borochov on 9/3/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPOrderNotificationModel.h"

@implementation BAPOrderNotificationModel

-(id)init
{
    self =   [super init];
    
    if(self)
    {
        _strOrderId = @"34545650";
        _strONBeauticianImageUrl = @"";
        _strONBeauticianId = @"1eb445c2";
        _strONBeauticianName = @"Dana Cohen";
        _strONBeauticianFullAdress = @"רמת גן  סירקין 19";
        _intONBeauticianRatersAmount = 3;
        _fltONBeauticianRateAvrg = 4;
        _timeIntervalGetOrder =  1409748358;
        _strONTreatmentLocation = @"אצל הקוסמטיקאית";
        _strONTreatmentNots = @"";
        _intONPrice = 250;        
    }
    return self;
}

@end
