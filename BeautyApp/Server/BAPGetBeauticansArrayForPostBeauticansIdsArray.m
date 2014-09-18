//
//  BAPGetBeauticansArrayByPostBeauticansIds.m
//  BeautyApp
//
//  Created by nimrod borochov on 8/31/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPGetBeauticansArrayForPostBeauticansIdsArray.h"
#import "JSONModelLib.h"
#import "BAPBeauticiansArrayFeed.h"

static NSString* const POST_ARRAY_BEAUTICIANS_METHOD_PATH = @"/postarraybeauticianbyid";

@implementation BAPGetBeauticansArrayForPostBeauticansIdsArray

- (void)getBeauticiansArrayForBeauticansIdsArray:(NSArray *)beauticansIdsArray
                                    successBlock:(BAPSuccessBlock)successBlock
                                     failerBlock:(BAPFailerBlock)failerBlock
{
    
    
//    NSString* strBeauticansIdsArray = [beauticansIdsArray description];
    
    NSDictionary *postDic = @{
                          @"ids" : beauticansIdsArray ,
                          };
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:postDic options:0 error:&error];
    
    NSString *jsonString = nil;
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
 
    NSString* urlString = [NSString stringWithFormat:@"%@%@%@", URL_HOST, BASE_PATH, POST_ARRAY_BEAUTICIANS_METHOD_PATH];
    
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
             
             BAPBeauticiansArrayFeed* jsonObject = [[BAPBeauticiansArrayFeed alloc]initWithDictionary:json error:&error];
             
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
