//
//  BAPGetBeauticianSerchByPostSearchBeautician.h
//  BeautyApp
//
//  Created by nimrod borochov on 9/14/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBaseServerManager.h"

@interface BAPGetBeauticianSerchByPostSearchBeautician : BAPBaseServerManager

- (void)getBeauticiansArrayBySearchName:(NSString *)name
                               location:(NSString *)location
                                   type:(NSString *)type
                             treatments:(NSString *)treatment
                           successBlock:(BAPSuccessBlock)successBlock
                            failerBlock:(BAPFailerBlock)failerBlock;

@end
