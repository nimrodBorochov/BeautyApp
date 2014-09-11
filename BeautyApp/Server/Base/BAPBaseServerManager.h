//
//  BAPBaseServerManager.h
//  BeautyApp
//
//  Created by nimrod borochov on 8/12/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <Foundation/Foundation.h>

//static NSString* const URL_HOST  = @"http://pictureit.co.il/BeautyApp";
static NSString* const URL_HOST  = @"http://192.168.1.50";
static NSString* const BASE_PATH = @"/BeautyUpService.asmx";

typedef void (^BAPSuccessBlock)(id jsonObject);
typedef void (^BAPFailerBlock)(NSError* error);

@interface BAPBaseServerManager : NSObject

@end