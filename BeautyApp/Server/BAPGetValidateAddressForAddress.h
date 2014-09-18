//
//  BAPGetValidateAddressForAddress.h
//  BeautyApp
//
//  Created by nimrod borochov on 9/16/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBaseServerManager.h"

@interface BAPGetValidateAddressForAddress : BAPBaseServerManager

- (void)getValidateAdrressForAdrressString:(NSString *)adrressString
                              successBlock:(BAPSuccessBlock)successBlock
                               failerBlock:(BAPFailerBlock)failerBlock;

@end
