//
//  BAPOrderTreatmenModel.h
//  BeautyApp
//
//  Created by nimrod borochov on 8/18/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "JSONModel.h"

// Defined a protocol for ather classes to use as object
@protocol BAPOrderTreatmenModel @end

@interface BAPOrderTreatmenModel : JSONModel

@property (strong, nonatomic) NSString* strOrderId;

@end
