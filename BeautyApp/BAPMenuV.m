//
//  BACMenuV.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 27/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPMenuV.h"

@interface BAPMenuV()

@end

@implementation BAPMenuV

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    self = [[NSBundle mainBundle] loadNibNamed:@"BAPMenuV" owner:self options:nil].firstObject;
    
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
}

- (IBAction)btnPersonalInfoTapped:(id)sender
{
    [self.delegate userTappdPersonalInfo];
}

- (IBAction)btnTreatmentHistoryTapped:(id)sender
{
    [self.delegate userTappdTreatmentHistory];
}

- (IBAction)btnExplanationTapped:(id)sender
{
    [self.delegate userTappdExplanation];
}

- (IBAction)btnRegulationsTapped:(id)sender
{
    [self.delegate userTappdRegulations];
}

@end
