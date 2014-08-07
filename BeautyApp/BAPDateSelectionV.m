//
//  BACDateSelectionV.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 16/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPDateSelectionV.h"

@interface BAPDateSelectionV ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation BAPDateSelectionV

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    self = [[NSBundle mainBundle] loadNibNamed:@"BAPDateSelectionV" owner:self options:nil].firstObject;
    
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.datePicker.minimumDate = [NSDate date];
    
}

- (IBAction)btnReturnDatePikTapped:(id)sender
{
    [self.delegate userTappedReturnBtn];
}

- (IBAction)btnSubmitDatePikTapped:(id)sender
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd / MM / yyyy"];
    NSString *strDate = [dateFormatter stringFromDate:self.datePicker.date];
    
    [self.delegate userTappedSubmitDate:strDate];
}


@end
