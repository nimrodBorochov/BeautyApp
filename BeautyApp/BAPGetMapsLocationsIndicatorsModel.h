//
//  BACGetMapsLocationsIndicatorsFeed.h
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 21/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "JSONModel.h"

// Define a protocol for other classes to use as object
@protocol BACGetMapsLocationsIndicatorsModel @end

@interface BAPGetMapsLocationsIndicatorsModel : JSONModel

@property (strong, nonatomic) NSString* strIndicatorId;
@property (strong, nonatomic) NSString* strIndicatorLatitude;
@property (strong, nonatomic) NSString* strIndicatorLongitude;
@property (strong, nonatomic) NSString* strIndicatorType;

@end
