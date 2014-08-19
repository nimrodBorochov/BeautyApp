//
//  BAPBeauticianFeed.h
//  BeautyApp
//
//  Created by nimrod borochov on 8/18/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "JSONModel.h"
#import "BAPBeauticianModel.h"

@interface BAPBeauticianFeed : JSONModel
// Feed property
// Use BAPBeauticianLocationModel protocol tell the model that this property contains a list of objects of the  BAPBeauticianLocationModel class
@property (strong, nonatomic) BAPBeauticianModel* beauticianModel;

@end
