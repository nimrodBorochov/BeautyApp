//
//  BACBusinessAdress.h
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 17/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BAPBusinessAdress : NSObject

@property (nonatomic, strong) NSString* strBusinessCity;
@property (nonatomic, strong) NSString* strBusinessStreetName;
@property (nonatomic) double numBusinessLongitude;
@property (nonatomic) double numBusinessLatitude;

- (id)initWithBusinessCity:(NSString *)city streetName:(NSString *)streetName longitude:(double)longitude latitude:(double)latitude;

@end
