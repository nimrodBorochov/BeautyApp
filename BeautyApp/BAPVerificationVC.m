//
//  BAPVerificationVC.m
//  BeautyApp
//
//  Created by nimrod borochov on 8/28/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPVerificationVC.h"
#import "BAPWalkthroughVC.h"

@interface BAPVerificationVC ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtVerificationCode;

@end

@implementation BAPVerificationVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.txtVerificationCode.delegate = self;
}

- (IBAction)btnContinueTapped:(id)sender
{
    ///Todo: Check Verification for Continue
    
    BAPWalkthroughVC* walkthroughVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPWalkthroughVC"];;
    [self presentViewController:walkthroughVC animated:NO completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end
