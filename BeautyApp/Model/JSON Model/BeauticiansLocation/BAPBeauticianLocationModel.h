//
//  BAPBeauticianLocationModel.h
//  BeautyApp
//
//  Created by nimrod borochov on 8/12/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "JSONModel.h"

// Defined a protocol for ather classes to use as object
@protocol BAPBeauticianLocationModel @end

@interface BAPBeauticianLocationModel : JSONModel

@property (strong, nonatomic) NSString* strType;
@property (assign, nonatomic) int intBeauticianLocationID;
@property (assign, nonatomic) double dblBeauticianLocationLatitude;
@property (assign, nonatomic) double dblBeauticianLocationLongitude;

@end
