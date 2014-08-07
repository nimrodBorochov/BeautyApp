//
//  BACBusinessRating.h
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 17/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BAPBusinessRating : NSObject

@property (strong, nonatomic) NSNumber* numBusinessRateAverage;
@property (strong, nonatomic) NSNumber* numBusinessRaters;

- (id)initWithBusinessRateAverage:(NSNumber *)rateAverage raters:(NSNumber *)raters;

@end
