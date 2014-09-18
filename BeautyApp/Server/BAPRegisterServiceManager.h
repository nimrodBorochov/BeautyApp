//
//  BAPRegisterServiceManager.h
//  BeautyApp
//
//  Created by nimrod borochov on 9/18/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBaseServerManager.h"

@interface BAPRegisterServiceManager : BAPBaseServerManager

- (void)GetUserAppIdForFirstName:(NSString *)firstName
                        lastName:(NSString *)lastName
                           eMail:(NSString *)eMail
                         address:(NSString *)address
                           phone:(NSString *)phone
                    successBlock:(BAPSuccessBlock)successBlock
                     failerBlock:(BAPFailerBlock)failerBlock;

@end
