    //
//  BAPTeamPepoleAmount.m
//  BeautyApp
//
//  Created by nimrod borochov on 9/8/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPGroupPeopleAmountV.h"
#import "UIView+Layout.h"

static NSString *const GROUP_HEB = @"קבוצה";

static int const PICKER_START_NUMBER = 2;
static int const PICKER_END_NUMBER = 100;
static int const PICKER_ROW_HEIGHT = 80;
static int const PICKER_FONT_SIZE = 35;

@interface BAPGroupPeopleAmountV()<UIPickerViewDataSource, UIPickerViewDelegate, UIGestureRecognizerDelegate>


@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (nonatomic, strong) NSString* strRowTitle;
@end

@implementation BAPGroupPeopleAmountV


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    self = [[NSBundle mainBundle] loadNibNamed:@"BAPGroupPeopleAmountV" owner:self options:nil].firstObject;
    
    if (self) {
        
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        
       UITapGestureRecognizer* tapPicker = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickerTapped:)];
        [self.pickerView addGestureRecognizer:tapPicker];
        
        tapPicker.delegate = self;
        
        self.strRowTitle = @"2";
    }
    
    return self;
}

#pragma mark - Picker DataSource methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return PICKER_END_NUMBER - PICKER_START_NUMBER;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    self.strRowTitle = [NSString stringWithFormat:@"%d", row + PICKER_START_NUMBER];
    
    NSLog(@"number: %@", self.strRowTitle);
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return PICKER_ROW_HEIGHT;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel* titleView = (UILabel*)view;
    if (!titleView){
        titleView = [[UILabel alloc] init];
        // Setup label properties - frame, font, colors etc
        [titleView setFont:[UIFont systemFontOfSize:PICKER_FONT_SIZE]];
        
        titleView.textAlignment = NSTextAlignmentCenter;

    }
    // Fill the label text here
    
    titleView.text = [NSString stringWithFormat:@"%d", row + PICKER_START_NUMBER];
    
    return titleView;
}

#pragma mark - Action method

-(void)pickerTapped:(id)sender
{
    NSString* strGroupAmount = [GROUP_HEB stringByAppendingString:[NSString stringWithFormat:@": %@", self.strRowTitle]];
    
    [self.delegate userSelectGroupPeopleAmount:strGroupAmount];
}

@end
