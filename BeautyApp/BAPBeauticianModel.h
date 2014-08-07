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

@interface BAPBeauticianModel : JSONModel

@property (strong, nonatomic) NSString* strBeauticianId;
@property (strong, nonatomic) NSString* strBeauticianImageURL;
@property (strong, nonatomic) NSString* strBeauticianName;
@property (strong, nonatomic) BAPBeauticianAdressModel* beauticianAdressModel;
@property (strong, nonatomic) BAPBeauticianRatingModel* beauticianRatingModel;
@property (strong, nonatomic) NSArray* arrBeauticianDegrees;
@property (strong, nonatomic) NSString* strDescription;
@property (strong, nonatomic) NSArray* arrBeauticiantreaTreatments;

@end
