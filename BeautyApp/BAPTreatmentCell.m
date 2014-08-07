//
//  BACTreatmentTVC.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 14/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPTreatmentCell.h"

@interface BAPTreatmentCell ()

@property (weak, nonatomic) IBOutlet UIImageView *ivChekBoxInTreatmentCell;


@property (nonatomic) int intNumOfTreatmentAks;


@end

@implementation BAPTreatmentCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _intNumOfTreatmentAks = 0;
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}
- (IBAction)btnPlusInTreatmentCellTapped:(id)sender
{
    self.intNumOfTreatmentAks++;
    self.lblNumberOfTreatmentInAsk.text = [NSString stringWithFormat:@"%d", self.intNumOfTreatmentAks];
    self.ivChekBoxInTreatmentCell.image = [UIImage imageNamed:@"checkBoxMarked"];
}

- (IBAction)btnMinusInTreatmentCellTapped:(id)sender
{
    if (self.intNumOfTreatmentAks == 0)
    {
        return;
    }
    
    self.intNumOfTreatmentAks--;
    self.lblNumberOfTreatmentInAsk.text = [NSString stringWithFormat:@"%d", self.intNumOfTreatmentAks];
    if (self.intNumOfTreatmentAks == 0)
    {
        self.ivChekBoxInTreatmentCell.image = [UIImage imageNamed:@"checkBox"];
    }
}
- (IBAction)btnInfoInTreatmentCellTapped:(id)sender
{
    [self.delegate didTappedTreatmentInfoWithTitle:self.lblTitleInTreatmentCell.text];
}

@end
