//
//  BACBeauticianModel.h
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 23/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "JSONModel.h"
#import "BAPBeauticianAdressModel.h"
#import "BAPBeauticianRatingModel.h"
#import "BAPBeauticianTreatmentsModel.h"
#import "BAPBeauticianDegreesModel.h"

// Defined a protocol for ather classes to use as object
@protocol BAPBeauticianModel @end

@interface BAPBeauticianModel : JSONModel

@property (strong, nonatomic) NSString* strType;
@property (assign, nonatomic) int intBeauticianId;
@property (strong, nonatomic) NSString* strBeauticianUserId;
@property (strong, nonatomic) NSString* strBeauticianName;
@property (strong, nonatomic) NSString* strBeauticianType;
@property (strong, nonatomic) NSString* strBeauticianEmail;
@property (assign, nonatomic) double dblBeauticianLatitude;
@property (assign, nonatomic) double dblBeauticianLongitude;
@property (strong, nonatomic) NSString* strBeauticianDescription;
@property (strong, nonatomic) NSString* strBeauticianImageURL;
@property (strong, nonatomic) BAPBeauticianTreatmentsModel* beauticianTreatmentsModel;
@property (strong, nonatomic) BAPBeauticianDegreesModel* beauticianDegreesModel;
@property (strong, nonatomic) BAPBeauticianAdressModel* beauticianAdressModel;
@property (strong, nonatomic) BAPBeauticianRatingModel* beauticianRatingModel;

@end
