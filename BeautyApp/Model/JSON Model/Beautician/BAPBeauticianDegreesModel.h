//
//  BAPBeauticianDegreesModel.h
//  BeautyApp
//
//  Created by nimrod borochov on 8/17/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "JSONModel.h"

// Defined a protocol for ather classes to use as object
@protocol BAPBeauticianDegreesModel @end

@interface BAPBeauticianDegreesModel : JSONModel

@property (strong, nonatomic) NSString* strBeauticianDegreesDesc;

@end
