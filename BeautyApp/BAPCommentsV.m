//
//  BACCommentsV.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 14/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPCommentsV.h"

@interface BAPCommentsV ()<UITextViewDelegate>


@property (weak, nonatomic) IBOutlet UITextView *tvComments;
@property (weak, nonatomic) IBOutlet UILabel *lblTitleOfCommentsV;


@end

@implementation BAPCommentsV

- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)title
{
    self = [super initWithFrame:frame];
    
    self = [[NSBundle mainBundle] loadNibNamed:@"BAPCommentsV" owner:self options:nil].firstObject;
    
    // Update view title
    self.lblTitleOfCommentsV.text = title;
    
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // Make self as UITextViewDelegate
    self.tvComments.delegate = self;
}

- (void) textViewDidBeginEditing:(UITextView *)textView
{
    // Send delegate event
    [self.delegate userBeginEditing];
}

#pragma mark - Action

- (IBAction)btnReturnCommentsTapped:(id)sender
{
    // Close the Keyboard
    [self.tvComments resignFirstResponder];
    
    // Send delegate event
    [self.delegate userTappedReturnBtn];
}

- (IBAction)btnSubmitCommentsTapped:(id)sender
{
    // Creates Variable to chek if there is a text to search
    NSString *textValue = [self.tvComments.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    // Close the Keyboard
    [self.tvComments resignFirstResponder];
    
    if([textValue length] != 0)
    {
        // Send delegate event
        [self.delegate userTappedSubmitComment:self.tvComments.text];
    }
    else
    {
        // Send delegate event
        [self.delegate userTappedReturnBtn];
    }
    
}
@end