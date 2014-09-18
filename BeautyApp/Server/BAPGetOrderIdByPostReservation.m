//
//  BAPGetOrderIdByPostReservation.m
//  BeautyApp
//
//  Created by nimrod borochov on 9/11/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPGetOrderIdByPostReservation.h"
#import "JSONModelLib.h"
#import "BAPOrderTreatmenFeed.h"
#import "BAPTreatmentCell.h"

static NSString* const POST_ORDER_METHOD_PATH =@"/postordertreatment";

@implementation BAPGetOrderIdByPostReservation

- (void)getOrderIdForUserId:(NSString *)uid
             reservationFor:(NSString *)forwho
            reservationDate:(NSTimeInterval)reservationDate
        reservationLocation:(NSString *)reservationLocation
        reservationComments:(NSString *)reservationComments
      reservationTreatments:(NSArray *)treatments
               successBlock:(BAPSuccessBlock)successBlock
                failerBlock:(BAPFailerBlock)failerBlock
{
    BOOL isFirstTreatmentCell = YES;
    NSString* strTreatments = @"[";
    
    /// TODO: take care about the treatments code, it will be treatment model (codestyle)
    int index = 1;
    for (BAPTreatmentCell* treatmentCell in treatments)
    {
        
        if (!isFirstTreatmentCell)
        {
            strTreatments = [strTreatments stringByAppendingString:@","];
        }
            strTreatments = [strTreatments stringByAppendingString:[NSString stringWithFormat:@"{\"treatments_id\":%d,\"amount\":%d}", index, [treatmentCell.lblNumberOfTreatmentInAsk.text intValue]]];
        isFirstTreatmentCell = NO;
        index++;
    }
    
     strTreatments = [strTreatments stringByAppendingString:@"]"];
    
    // Post string
    NSString* strPost = [NSString stringWithFormat:@"{\"uid\":\"%@\",\"forwho\":\"%@\",\"date\":\"%f\",\"location\":\"%@\",\"comments\":\"%@\",\"treatments\":%@}", uid, forwho, reservationDate, reservationLocation, reservationComments, strTreatments];
    
    
//    NSDictionary *postDic = @{
//                              @"ids" : beauticansIdsArray ,
//                              };
//    NSError *error;
//    
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:postDic options:0 error:&error];
//    
//    NSString *jsonString = nil;
//    if (! jsonData) {
//        NSLog(@"Got an error: %@", error);
//    } else {
//        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    }
//    
//    NSString* urlString = [NSString stringWithFormat:@"%@%@%@", URL_HOST, BASE_PATH, POST_ARRAY_BEAUTICIANS_METHOD_PATH];
//    
//    // Set the post metode
//    [JSONHTTPClient postJSONFromURLWithString:urlString bodyString:jsonString completion:^(id json, JSONModelError *err)
    
    NSString* urlString = [NSString stringWithFormat:@"%@%@%@", URL_HOST, BASE_PATH, POST_ORDER_METHOD_PATH];
    
    // Set the post method
    [JSONHTTPClient postJSONFromURLWithString:urlString bodyString:strPost completion:^(id json, JSONModelError *err) {
       
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
            
            BAPOrderTreatmenFeed* jsonObject = [[BAPOrderTreatmenFeed alloc]initWithDictionary:json error:&error];
            
            if (error)
            {
                if (failerBlock)
                {
                    failerBlock(error);
                }
            }
            else
            {
                if (successBlock)
                {
                    successBlock(jsonObject);
                }
            }
        }
    }];
}

@end
