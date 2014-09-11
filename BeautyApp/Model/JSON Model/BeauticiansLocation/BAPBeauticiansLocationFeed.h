//
//  BAPBeauticiansLocationFeed.h
//  BeautyApp
//
//  Created by nimrod borochov on 8/12/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "JSONModel.h"
#import "BAPBeauticianLocationModel.h"

@interface BAPBeauticiansLocationFeed : JSONModel
    
// Feed property
// Use BAPBeauticianLocationModel protocol tell the model that this property contains a list of objects of the  BAPBeauticianLocationModel class
@property (strong, nonatomic) NSArray<BAPBeauticianLocationModel>* arrBeauticiansLocation;

@end
