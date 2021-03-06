//
//  BAPGetBeauticiansLocationByPostCoordinates.m
//  BeautyApp
//
//  Created by nimrod borochov on 8/12/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPGetBeauticiansLocationByPostCoordinates.h"
#import "JSONModelLib.h"
#import "BAPBeauticiansLocationFeed.h"

static NSString* const POST_COORDINATES_METHOD_PATH = @"/postlatitudelongitude";

@implementation BAPGetBeauticiansLocationByPostCoordinates

- (void)getBeauticiansLocationForLatitude:(double)latitude
                                longitude:(double)longitude
                             successBlock:(BAPSuccessBlock)successBlock
                              failerBlock:(BAPFailerBlock)failerBlock
{
    NSString* strLatitude = [NSString stringWithFormat:@"%lf", latitude];
    NSString* strLongitude = [NSString stringWithFormat:@"%lf", longitude];
    
    NSDictionary *dic = @{
                                @"latitude" : strLatitude ,
                                @"longitude" : strLongitude,
                                };
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
    
    NSString *jsonString = nil;
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSString* urlString = [NSString stringWithFormat:@"%@%@%@", URL_HOST, BASE_PATH, POST_COORDINATES_METHOD_PATH];
    
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
             
             
             BAPBeauticiansLocationFeed* jsonObject = [[BAPBeauticiansLocationFeed alloc]initWithDictionary:json error:&error];
             
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
