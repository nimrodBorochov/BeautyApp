//
//  BAPMessagesCell.m
//  BeautyApp
//
//  Created by nimrod borochov on 9/2/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPMessagesCell.h"
#import "BAPOrderNotificationModel.h"

@interface BAPMessagesCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblbeauticianName;
@property (weak, nonatomic) IBOutlet UILabel *lblBeauticianFullAdress;
@property (weak, nonatomic) IBOutlet UILabel *lblDateOfMessages;

@end

@implementation BAPMessagesCell

- (void)setupCellWithOrderNotification:(BAPOrderNotificationModel *)orderNotification
{
    self.lblbeauticianName.text = orderNotification.strONBeauticianName;
    self.lblBeauticianFullAdress.text = orderNotification.strONBeauticianFullAdress;
    
    NSDate* dateOfMessages = [[NSDate alloc]initWithTimeIntervalSince1970:orderNotification.timeIntervalGetOrder];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yy - HH:mm"];
    
    NSString *formattedDateString = [dateFormatter stringFromDate:dateOfMessages];
    
    self.lblDateOfMessages.text = formattedDateString;
}
@end
