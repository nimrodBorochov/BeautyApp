//
//  BACBeauticianAdressModel.h
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 23/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "JSONModel.h"

// Defined a protocol for ather classes to use as object
@protocol BAPBeauticianAdressModel @end

@interface BAPBeauticianAdressModel : JSONModel

@property (strong, nonatomic) NSString* strBeauticianStreet;
@property (strong, nonatomic) NSString* strBeauticianCity;

@end
