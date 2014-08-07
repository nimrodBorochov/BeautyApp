//
//  BACLocationSelectionV.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 14/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPLocationSelectionV.h"

static NSString *const IN_MY_HOUSE_HEB = @"בביתי";
static NSString *const AT_BEAUTICIAN_HEB = @"אצל הקוסמטיקאית";
static NSString *const OTHER_HEB = @"אחר";


@interface BAPLocationSelectionV ()<UIGestureRecognizerDelegate>

// Outlets properties
@property (weak, nonatomic) IBOutlet UIView *vInMyHouse;
@property (weak, nonatomic) IBOutlet UIImageView *ivCheckBoxInMyHouse;
@property (weak, nonatomic) IBOutlet UIView *vAtBeautician;
@property (weak, nonatomic) IBOutlet UIImageView *ivAtBeautician;
@property (weak, nonatomic) IBOutlet UIView *vOther;
@property (weak, nonatomic) IBOutlet UIImageView *ivOther;

@property (nonatomic, strong) NSString* strSelectedOption;

@end


@implementation BAPLocationSelectionV

- (id)initWithFrame:(CGRect)frame Selection:(NSString *)selection
{
    self = [super initWithFrame:frame];
    
    self = [[NSBundle mainBundle] loadNibNamed:@"BAPLocationSelectionV" owner:self options:nil].firstObject;
    
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
    UITapGestureRecognizer *tapInMyHouse = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(inMyHouseTapped)];
    
    [self.vInMyHouse addGestureRecognizer:tapInMyHouse];
    
    tapInMyHouse.delegate = self;
    
    UITapGestureRecognizer *tapAtBeautician = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(atBeauticianTapped)];
    
    [self.vAtBeautician addGestureRecognizer:tapAtBeautician];
    
    tapAtBeautician.delegate = self;
    
    UITapGestureRecognizer *tapOther = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(otherTapped)];
    
    [self.vOther addGestureRecognizer:tapOther];
    
    tapOther.delegate = self;
}

- (void)inMyHouseTapped
{
    // Update UI
    self.ivCheckBoxInMyHouse.image = [UIImage imageNamed:@"checkBoxMarked"];
    self.ivAtBeautician.image = [UIImage imageNamed:@"checkBox"];
    self.ivOther.image = [UIImage imageNamed:@"checkBox"];
    
    // Send delegate event
    [self.delegate userSelectLoctionOption:IN_MY_HOUSE_HEB];
}

- (void)atBeauticianTapped
{
    // Update UI
    self.ivCheckBoxInMyHouse.image = [UIImage imageNamed:@"checkBox"];
    self.ivAtBeautician.image = [UIImage imageNamed:@"checkBoxMarked"];
    self.ivOther.image = [UIImage imageNamed:@"checkBox"];
    
    // Send delegate event
    [self.delegate userSelectLoctionOption:AT_BEAUTICIAN_HEB];
}

- (void)otherTapped
{
    // Update UI
    self.ivCheckBoxInMyHouse.image = [UIImage imageNamed:@"checkBox"];
    self.ivAtBeautician.image = [UIImage imageNamed:@"checkBox"];
    self.ivOther.image = [UIImage imageNamed:@"checkBoxMarked"];
    
    // Send delegate event
    [self.delegate userSelecteOtherHowOption];
}

- (void)updateCheckBoxImage
{
    if ([self.strSelectedOption isEqualToString:IN_MY_HOUSE_HEB])
    {
        self.ivCheckBoxInMyHouse.image = [UIImage imageNamed:@"checkBoxMarked"];
    }
    else if ([self.strSelectedOption isEqualToString:AT_BEAUTICIAN_HEB])
    {
        self.ivAtBeautician.image = [UIImage imageNamed:@"checkBoxMarked"];
    }
    else if ([self.strSelectedOption isEqualToString:OTHER_HEB])
    {
        self.ivOther.image = [UIImage imageNamed:@"checkBoxMarked"];
    }
}

@end


