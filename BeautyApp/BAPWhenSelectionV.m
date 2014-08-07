//
//  BACWhenSelectionV.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 14/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPWhenSelectionV.h"

static NSString *const TODAY_HEB = @"היום";
//static NSString *const OTHER_HEB = @"אחר";
static NSString *const WHEN_HEB = @"מתי";

@interface BAPWhenSelectionV ()<UIGestureRecognizerDelegate>

// Outlets properties
@property (weak, nonatomic) IBOutlet UIView *vToday;
@property (weak, nonatomic) IBOutlet UIImageView *ivCheckBoxToday;
@property (weak, nonatomic) IBOutlet UIView *vOtherDay;
@property (weak, nonatomic) IBOutlet UIImageView *ivCheckBoxOtherDay;

@property (nonatomic, strong) NSString* strSelectedOption;

@end

@implementation BAPWhenSelectionV

- (id)initWithFrame:(CGRect)frame Selection:(NSString *)selection
{
    self = [super initWithFrame:frame];
    
    self = [[NSBundle mainBundle] loadNibNamed:@"BAPWhenSelectionV" owner:self options:nil].firstObject;
    
    _strSelectedOption = selection;
    
    if (self) {
        if (self.strSelectedOption)
        {
            [self updateCheckBoxImage];
        }
    }

    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self addTapGestureToView];
}

- (void)addTapGestureToView
{
    UITapGestureRecognizer *tapOnToday = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(todayTapped:)];
    
    [self.vToday addGestureRecognizer:tapOnToday];
    
    tapOnToday.delegate = self;
    
    UITapGestureRecognizer *tapOnOtherDay = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OtherDayTapped:)];
    
    [self.vOtherDay addGestureRecognizer:tapOnOtherDay];
    
    tapOnOtherDay.delegate = self;
}

- (void)todayTapped:(UITapGestureRecognizer *)recognizer
{
    // Update UI
    self.ivCheckBoxToday.image = [UIImage imageNamed:@"checkBoxMarked"];
    self.ivCheckBoxOtherDay.image = [UIImage imageNamed:@"checkBox"];
    
    // Send delegate event
    [self.delegate userSelectedWhenOption:TODAY_HEB];
}

- (void)OtherDayTapped:(UITapGestureRecognizer *)recognizer
{
    // Update UI
    self.ivCheckBoxToday.image = [UIImage imageNamed:@"checkBox"];
    self.ivCheckBoxOtherDay.image = [UIImage imageNamed:@"checkBoxMarked"];
    
    // Send delegate event
    [self.delegate userSelectedOtherWhenOption];
}

- (void)updateCheckBoxImage
{
    if ([self.strSelectedOption isEqualToString:TODAY_HEB])
    {
        self.ivCheckBoxToday.image = [UIImage imageNamed:@"checkBoxMarked"];
    }
    else if (![self.strSelectedOption isEqualToString:WHEN_HEB])
    {
        self.ivCheckBoxOtherDay.image = [UIImage imageNamed:@"checkBoxMarked"];
    }
}



@end
