//
//  BAPVerificationVC.m
//  BeautyApp
//
//  Created by nimrod borochov on 8/28/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPSecondRegistrationVC.h"
#import "BAPRegisterFeed.h"
#import "BAPRegisterServiceManager.h"
#import "BAPAppData.h"
#import "BAPVerificationVC.h"


@interface BAPSecondRegistrationVC ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtUserPhoneNumber;

@property (strong, nonatomic) BAPRegisterFeed* registerFeed;

@end

@implementation BAPSecondRegistrationVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.txtUserPhoneNumber.delegate = self;
}

- (IBAction)btnContinueTapped:(id)sender
{
    NSString *textValueUserPhoneNumber = [self.txtUserPhoneNumber.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if ([textValueUserPhoneNumber length] == 0)
    {
        [self showAlartWithTitle:@"יש למלא מספר טלפון!"];
    }
    else
    {
        BAPRegisterServiceManager* registerServiceManager = [BAPRegisterServiceManager new];
        
        ///DOTO: appData thing
//        BAPAppData* appData = [BAPAppData init];
        
        
        [registerServiceManager GetUserAppIdForFirstName:self.strLastName lastName:self.strLastName eMail:self.strUserEMail address:self.strUserAdreess phone:self.txtUserPhoneNumber.text successBlock:^(id jsonObject) {
            
            self.registerFeed = jsonObject;
            
            
            BAPVerificationVC* verificationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPVerificationVC"];
            
            verificationVC.strUserAppId = self.registerFeed.registerModel.strUserAppId;
            
            verificationVC.strUserPhoneNimber = self.txtUserPhoneNumber.text;
            
            [self presentViewController:verificationVC animated:NO completion:nil];

        } failerBlock:^(NSError *error) {
            
            NSLog(@"error loading jason: %@", error);
            
            [self showAlartWithTitle:@"מספר לא טוף"];
            
        }];
        
    }
    
    //
//    BAPWalkthroughVC* walkthroughVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPWalkthroughVC"];;
//    [self presentViewController:walkthroughVC animated:NO completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end
