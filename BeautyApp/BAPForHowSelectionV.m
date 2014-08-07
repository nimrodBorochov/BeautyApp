//
//  BACForHowSelectionV.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 14/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPForHowSelectionV.h"

static NSString *const FOR_ME_HEB = @"עבורי";
static NSString *const FOR_GROUP_HEB = @"קבוצה";
static NSString *const OTHER_HEB = @"אחר";

@interface BAPForHowSelectionV ()<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIView *vForMe;
@property (weak, nonatomic) IBOutlet UIImageView *ivCheckBoxForMe;
@property (weak, nonatomic) IBOutlet UIView *vForGroup;
@property (weak, nonatomic) IBOutlet UIImageView *ivCheckBoxForGroup;
@property (weak, nonatomic) IBOutlet UIView *vForOther;
@property (weak, nonatomic) IBOutlet UIImageView *ivCheckBoxForOther;

@property (nonatomic, strong) NSString* strSelectedOption;

@end

@implementation BAPForHowSelectionV

- (id)initWithFrame:(CGRect)frame Selection:(NSString *)selection
{
    self = [super initWithFrame:frame];
    
    self = [[NSBundle mainBundle] loadNibNamed:@"BAPForHowSelectionV" owner:self options:nil].firstObject;
    
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
    UITapGestureRecognizer *tapOnForMe = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ForMeTapped:)];
    
    [self.vForMe addGestureRecognizer:tapOnForMe];
    
    tapOnForMe.delegate = self;
    
    UITapGestureRecognizer *tapOnForGroup = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ForGroupTapped:)];
    
    [self.vForGroup addGestureRecognizer:tapOnForGroup];
    
    tapOnForGroup.delegate = self;
    
    UITapGestureRecognizer *tapOnForOther = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ForOtherTapped:)];
    
    [self.vForOther addGestureRecognizer:tapOnForOther];
    
    tapOnForOther.delegate = self;
    
}

- (void)updateCheckBoxImage
{
    if ([self.strSelectedOption isEqualToString:FOR_ME_HEB])
    {
        self.ivCheckBoxForMe.image = [UIImage imageNamed:@"checkBoxMarked"];
    }
    else if ([self.strSelectedOption isEqualToString:FOR_GROUP_HEB])
    {
        self.ivCheckBoxForGroup.image = [UIImage imageNamed:@"checkBoxMarked"];
    }
    else if ([self.strSelectedOption isEqualToString:OTHER_HEB])
    {
        self.ivCheckBoxForOther.image = [UIImage imageNamed:@"checkBoxMarked"];
    }
}

- (void)ForMeTapped:(UITapGestureRecognizer *)recognizer
{
    // Update UI
    self.ivCheckBoxForMe.image = [UIImage imageNamed:@"checkBoxMarked"];
    self.ivCheckBoxForGroup.image = [UIImage imageNamed:@"checkBox"];
    self.ivCheckBoxForOther.image = [UIImage imageNamed:@"checkBox"];
    
    // Send delegate event
    [self.delegate userSelecteForHowOption:FOR_ME_HEB];
    
}

- (void)ForGroupTapped:(UITapGestureRecognizer *)recognizer
{
    // Update UI
    self.ivCheckBoxForMe.image = [UIImage imageNamed:@"checkBox"];
    self.ivCheckBoxForGroup.image = [UIImage imageNamed:@"checkBoxMarked"];
    self.ivCheckBoxForOther.image = [UIImage imageNamed:@"checkBox"];
    
    // Send delegate event
    [self.delegate userSelecteForHowOption:FOR_GROUP_HEB];
}

- (void)ForOtherTapped:(UITapGestureRecognizer *)recognizer
{
    // Update UI
    self.ivCheckBoxForMe.image = [UIImage imageNamed:@"checkBox"];
    self.ivCheckBoxForGroup.image = [UIImage imageNamed:@"checkBox"];
    self.ivCheckBoxForOther.image = [UIImage imageNamed:@"checkBoxMarked"];
    
    // Send delegate event
    [self.delegate userSelecteOtherHowOption];
}
@end