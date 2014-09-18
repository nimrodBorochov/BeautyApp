//
//  BAPRegisterServiceManager.m
//  BeautyApp
//
//  Created by nimrod borochov on 9/18/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPRegisterServiceManager.h"
#import "JSONModelLib.h"
#import "BAPRegisterFeed.h"

static NSString* const POST_REGISTER_METHOD_PATH = @"/register";

@implementation BAPRegisterServiceManager

- (void)GetUserAppIdForFirstName:(NSString *)firstName
                        lastName:(NSString *)lastName
                           eMail:(NSString *)eMail
                         address:(NSString *)address
                           phone:(NSString *)phone
                    successBlock:(BAPSuccessBlock)successBlock
                     failerBlock:(BAPFailerBlock)failerBlock
{
    NSDictionary *dic = @{
                          @"first_name"  : firstName ,
                          @"last_name"   : lastName,
                          @"email"       : eMail,
                          @"address"     : address,
                          @"phone_number" : phone,
                          };
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
    
    NSString *jsonString = nil;
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSString* urlString = [NSString stringWithFormat:@"%@%@%@", URL_HOST, BASE_PATH, POST_REGISTER_METHOD_PATH];
    
    // Set the post metode
    [JSONHTTPClient postJSONFromURLWithString:urlString bodyString:jsonString completion:^(id json, JSONModelError *err)
     {
         if (err)
         {
             if (failerBlock)
             {
                 failerBlock(err);
             }
             NSLog(@"Error post json - %@", err);
         }
         else
         {
             NSError* error;
             
             BAPRegisterFeed* jsonObject = [[BAPRegisterFeed alloc]initWithDictionary:json error:&error];
             
             if (error)
             {
                 if (failerBlock)
                 {
                     failerBlock(error);
                 }
             }
             else
             {
                 if(successBlock)
                 {
                     successBlock(jsonObject);
                 }
             }
         }
     }];
}

@end
