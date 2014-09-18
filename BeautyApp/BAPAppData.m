//
//  BAPAppData.m
//  BeautyApp
//
//  Created by nimrod borochov on 9/17/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPAppData.h"

static BAPAppData* _appDataSharedObjectInstance = nil;
static dispatch_once_t once_token = 0;

@interface BAPAppData ()

@property (strong, nonatomic) NSString* strUserAppId;

@end

@implementation BAPAppData


+ (instancetype)sharedManager
{
    dispatch_once(&once_token, ^{
        if (_appDataSharedObjectInstance == nil)
        {
            _appDataSharedObjectInstance = [[BAPAppData alloc]init];
        }
    });
    
    return _appDataSharedObjectInstance;
}

- (id)init
{
    if (self = [super init])
    {
        //code
    }
    
    return self;
}

@end
