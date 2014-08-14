//
//  BAPGetBeauticiansLocationByPostCoordinates.h
//  BeautyApp
//
//  Created by nimrod borochov on 8/12/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBaseServerManager.h"

@interface BAPGetBeauticiansLocationByPostCoordinates : BAPBaseServerManager

- (void)getBeauticiansLocationForLatitude:(double)latitude
                                longitude:(double)longitude
                             successBlock:(BAPSuccessBlock)successBlock
                              failerBlock:(BAPFailerBlock)failerBlock;

@end
