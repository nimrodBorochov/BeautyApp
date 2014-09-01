//
//  BAPGetBeauticansArrayByPostBeauticansIds.h
//  BeautyApp
//
//  Created by nimrod borochov on 8/31/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBaseServerManager.h"

@interface BAPGetBeauticansArrayForPostBeauticansIdsArray : BAPBaseServerManager

- (void)getBeauticiansArrayForBeauticansIdsArray:(NSArray *)beauticansIdsArray
                                    successBlock:(BAPSuccessBlock)successBlock
                                     failerBlock:(BAPFailerBlock)failerBlock;

@end
