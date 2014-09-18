//
//  BAPGetValidateAddressForAddress.m
//  BeautyApp
//
//  Created by nimrod borochov on 9/16/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPGetValidateAddressForAddress.h"
#import "JSONModelLib.h"
#import "BAPValidateAddressFeed.h"

static NSString* const POST_VALIDATE_ADRRESS_METHOD_PATH = @"/getvalidaddress";

@implementation BAPGetValidateAddressForAddress

- (void)getValidateAdrressForAdrressString:(NSString *)adrressString
                              successBlock:(BAPSuccessBlock)successBlock
                               failerBlock:(BAPFailerBlock)failerBlock
{
    NSDictionary* jsonDic = @{
                            @"address": adrressString,
                            };
    
    NSError* error;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:jsonDic options:0 error:&error];
    
    NSString* jsonString = nil;
    if (! jsonData)
    {
        NSLog(@"Got an error: %@", error);
    }
    else
    {
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }

    NSString* urlString = [NSString stringWithFormat:@"%@%@%@", URL_HOST, BASE_PATH, POST_VALIDATE_ADRRESS_METHOD_PATH];
    
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
             
             
             BAPValidateAddressFeed* jsonObject = [[BAPValidateAddressFeed alloc]initWithDictionary:json error:&error];
             
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
