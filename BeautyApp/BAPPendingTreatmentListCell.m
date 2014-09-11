//
//  BAPTratmentListCell.m
//  BeautyApp
//
//  Created by nimrod borochov on 9/7/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPPendingTreatmentListCell.h"

@interface BAPPendingTreatmentListCell()

@property (weak, nonatomic) IBOutlet UILabel *lblBeauticianFullName;
@property (weak, nonatomic) IBOutlet UILabel *lblBeauticianFullAdress;
@property (weak, nonatomic) IBOutlet UILabel *lblTreatmentName;
@property (weak, nonatomic) IBOutlet UILabel *lblTreatmentDate;


@end

@implementation BAPPendingTreatmentListCell

- (void)setupCellWithOrderNotification:(BAPOrderNotificationModel *)orderNotification
{
    self.lblBeauticianFullName.text = orderNotification.strONBeauticianName;
    self.lblBeauticianFullAdress.text = orderNotification.strONBeauticianFullAdress;
    
    NSDate* dateOfMessages = [[NSDate alloc]initWithTimeIntervalSince1970:orderNotification.timeIntervalGetOrder];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yy - HH:mm"];
    
    NSString *formattedDateString = [dateFormatter stringFromDate:dateOfMessages];
    
    self.lblTreatmentDate.text = formattedDateString;
    
    ///TODO: by code
    self.lblTreatmentName.text= @"";
}


@end
