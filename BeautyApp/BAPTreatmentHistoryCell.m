//
//  BACTreatmentHistoryCell.m
//  BeautyApp_Client
//
//  Created by nimrod borochov on 7/30/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPTreatmentHistoryCell.h"

@interface BAPTreatmentHistoryCell()

@property (weak, nonatomic) IBOutlet UILabel *lblTreatmentHistoryDate;
@property (weak, nonatomic) IBOutlet UILabel *lblTreatmentHistoryBeauticianName;
@property (weak, nonatomic) IBOutlet UITextView *tvTreatmentHistoryTreatments;
@property (weak, nonatomic) IBOutlet UILabel *lblTreatmentHistoryLocation;
@property (weak, nonatomic) IBOutlet UILabel *lblTreatmentHistoryPrice;

@end


@implementation BAPTreatmentHistoryCell

- (void)setUpCellWithDate:(NSString *)date beauticianName:(NSString *)beauticianName treatments:(NSString *)treatments location:(NSString *)location price:(NSString *)price
{
    self.lblTreatmentHistoryDate.text = date;
    self.lblTreatmentHistoryBeauticianName.text = beauticianName;
    self.tvTreatmentHistoryTreatments.text = treatments;
    self.lblTreatmentHistoryLocation.text = location;
    self.lblTreatmentHistoryPrice.text = price;
}

@end
