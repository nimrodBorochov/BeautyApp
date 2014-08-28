//
//  BAPRegistrationVC.m
//  BeautyApp
//
//  Created by nimrod borochov on 8/27/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPRegistrationVC.h"

@interface BAPRegistrationVC ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtUserFirstName;
@property (weak, nonatomic) IBOutlet UITextField *txtUserLastName;
@property (weak, nonatomic) IBOutlet UITextField *txtUserEMail;
@property (weak, nonatomic) IBOutlet UITextField *txtUserAdress;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintButtomFiledsView;
@end

@implementation BAPRegistrationVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTextFieldsTag];
}

- (void)setupTextFieldsTag
{
    self.txtUserFirstName.tag = 1;
    self.txtUserFirstName.delegate = self;
    self.txtUserLastName.tag = 2;
    self.txtUserLastName.delegate = self;
    self.txtUserEMail.tag = 3;
    self.txtUserEMail.delegate = self;
    self.txtUserAdress.tag = 4;
    self.txtUserAdress.delegate = self;
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
    }
    return NO; // We do not want UITextField to insert line-breaks.
}

- (IBAction)keyboardReturnTapped:(UITextField *)sender
{
    [self textFieldShouldReturn:sender];
}

- (IBAction)btnContinueTapped:(id)sender
{
    // Creates Variable to chek if there is a text to search
    NSString *textValueUserFirstName = [self.txtUserFirstName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *textValueUserLastName = [self.txtUserLastName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *textValueUserEMail = [self.txtUserEMail.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *textValueUserAdress = [self.txtUserAdress.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([textValueUserFirstName length] == 0 || [textValueUserLastName length] == 0 || [textValueUserEMail length] == 0 || [textValueUserAdress length] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"חסר מידע" message: @"יש למלא את כל השדות!" delegate: nil cancelButtonTitle:@"חזור" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        
    }
    
}

@end
