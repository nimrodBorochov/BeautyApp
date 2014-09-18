//
//  BAPGetBeauticianSerchByPostSearchBeautician.m
//  BeautyApp
//
//  Created by nimrod borochov on 9/14/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPGetBeauticianSerchByPostSearchBeautician.h"
#import "JSONModelLib.h"
#import "BAPBeauticiansArrayFeed.h"

static NSString* const POST_SEARCH_BEAUTICAIN = @"/postsearchbeautician";

@implementation BAPGetBeauticianSerchByPostSearchBeautician

- (void)getBeauticiansArrayBySearchName:(NSString *)name
                               location:(NSString *)location
                                   type:(NSString *)type
                             treatments:(NSString *)treatment
                           successBlock:(BAPSuccessBlock)successBlock
                            failerBlock:(BAPFailerBlock)failerBlock
{
    
    
    NSString* strPost = [NSString stringWithFormat:@"{\"name\":\"%@\",\"location\":\"%@\",\"type\":\"%@\",\"treatment\":\"%@\"}", name, location, type, treatment];
    
    NSString* urlString = [NSString stringWithFormat:@"%@%@%@", URL_HOST, BASE_PATH, POST_SEARCH_BEAUTICAIN];
    
    // Set the post metode
    [JSONHTTPClient postJSONFromURLWithString:urlString bodyString:strPost completion:^(id json, JSONModelError *err)
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
