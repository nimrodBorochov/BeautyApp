//
//  BACBeauticianRatingModel.h
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 23/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "JSONModel.h"

// Defined a protocol for ather classes to use as object
@protocol BAPBeauticianRatingModel @end

@interface BAPBeauticianRatingModel : JSONModel

@property (nonatomic) double dblRate;
@property (nonatomic) int intRaters;

@end
