//
//  BABusiness.h
//  BeautyApp
//
//  Created by Nimrod Borochov on 24/06/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BAPBusinessServices.h"
#import "BAPBusinessAdress.h"
#import "BAPBusinessRating.h"

@interface BAPBusiness : NSObject

@property (nonatomic, strong) NSString* strBusinessID;
@property (nonatomic, strong) NSString* strBusinessName;
@property (nonatomic, strong) UIImage* imageOfBusines;
@property (nonatomic, strong) BAPBusinessAdress* businessAdress;
@property (nonatomic, strong) BAPBusinessRating* businessRating;
@property (nonatomic, strong) NSString* strBeauticianDegrees;
@property (nonatomic, strong) NSString* strBeauticianFirstCertificate;
@property (nonatomic, strong) NSString* strBeauticianSecondCertificate;
@property (nonatomic, strong) BAPBusinessServices* businessServices;

@property (nonatomic, strong) NSString* strBusinessFullAdress;

- (id)initWithID:(NSString *)Identity name:(NSString *)name image:(UIImage *)image adress:(BAPBusinessAdress *)adress rating:(BAPBusinessRating *)rating beauticianDegrees:(NSString*)beauticianDegrees beauticianFirstCertificate:(NSString *)beauticianFirstCertificate beauticianSecondCertificate:(NSString *)beauticianSecondCertificate services:(BAPBusinessServices *)services;

@end