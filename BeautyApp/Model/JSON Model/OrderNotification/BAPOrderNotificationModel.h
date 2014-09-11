//
//  BAPOrderNotificationModel.h
//  BeautyApp
//
//  Created by nimrod borochov on 9/3/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "JSONModel.h"

@interface BAPOrderNotificationModel : JSONModel

//-(id)init;

@property (strong, nonatomic) NSString* strOrderId;
@property (strong, nonatomic) NSString* strONBeauticianImageUrl;
@property (strong, nonatomic) NSString* strONBeauticianId;
@property (strong, nonatomic) NSString* strONBeauticianName;
@property (strong, nonatomic) NSString* strONBeauticianFullAdress;
@property (       nonatomic) int intONBeauticianRatersAmount;
@property (       nonatomic) float fltONBeauticianRateAvrg;
@property (       nonatomic) NSTimeInterval timeIntervalGetOrder;
@property (strong, nonatomic) NSString* strONTreatmentLocation;
@property (strong, nonatomic) NSString* strONTreatmentNots;
@property (       nonatomic) int intONPrice;

@end
