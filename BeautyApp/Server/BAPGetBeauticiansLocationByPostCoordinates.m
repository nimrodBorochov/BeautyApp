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
#import <MapKit/MapKit.h>

static NSString* const POST_COORDINATES_METHOD_PATH = @"/postlatitudelongitude";

@implementation BAPGetBeauticiansLocationByPostCoordinates

- (void)getBeauticiansLocationForLatitude:(double)latitude
                                longitude:(double)longitude
                             successBlock:(BAPSuccessBlock)successBlock
                              failerBlock:(BAPFailerBlock)failerBlock
{
    // Post string
    NSString* strPost = [NSString stringWithFormat:@"{\"latitude\" :%f,\"longitude\":%f}", latitude, longitude];
    
    NSString* urlString = [NSString stringWithFormat:@"%@%@%@", URL_HOST, BASE_PATH, POST_COORDINATES_METHOD_PATH];
    
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
