//
//  BAPRegisterFeed.h
//  BeautyApp
//
//  Created by nimrod borochov on 9/18/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "JSONModel.h"
#import "BAPRegisterModel.h"

@interface BAPRegisterFeed : JSONModel

@property (strong, nonatomic) BAPRegisterModel* registerModel;

@end
