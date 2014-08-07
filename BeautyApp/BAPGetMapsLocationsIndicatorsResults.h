//
//  BACGetMapsLocationsIndicatorsResults.h
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 23/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "JSONModel.h"
#import "BAPGetMapsLocationsIndicatorsModel.h"

@interface BAPGetMapsLocationsIndicatorsResults : JSONModel

// Model Property
// Use BACGetMapsLocationsIndicatorsModel.h protocol tell the model that this property contains a list of objects of the  BACGetMapsLocationsIndicatorsModel.h class
@property (strong, nonatomic) NSArray<BACGetMapsLocationsIndicatorsModel>* arrMapsLocationsIndicatorsModel;

@end