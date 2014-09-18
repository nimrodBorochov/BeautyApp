//
//  BAPRegistrationVC.m
//  BeautyApp
//
//  Created by nimrod borochov on 8/27/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPRegistrationVC.h"
#import "BAPSecondRegistrationVC.h"
#import "BAPValidateAddressFeed.h"
#import "BAPGetValidateAddressForAddress.h"

static float CONSTRAINT_CONTAINER_HEIGHT_FOR_1_RESULT = 80;
static float CONSTRAINT_CONTAINER_HEIGHT_FACTOR = 44;

@interface BAPRegistrationVC ()<UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtUserFirstName;
@property (weak, nonatomic) IBOutlet UITextField *txtUserLastName;
@property (weak, nonatomic) IBOutlet UITextField *txtUserEMail;
@property (weak, nonatomic) IBOutlet UITextField *txtUserAdress;

@property (weak, nonatomic) IBOutlet UIView *containerTableValidateAddress;
@property (weak, nonatomic) IBOutlet UITableView *tableValidateAddress;
@property (weak, nonatomic) IBOutlet UIView *dimView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintContainerHeight;
@property (strong, nonatomic) BAPValidateAddressFeed* validateAddressFeed;
@end

@implementation BAPRegistrationVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupVC];
}

- (void)setupVC
{
    // Add Tags To TextField
    self.txtUserFirstName.tag = 1;
    self.txtUserFirstName.delegate = self;
    self.txtUserLastName.tag = 2;
    self.txtUserLastName.delegate = self;
    self.txtUserEMail.tag = 3;
    self.txtUserEMail.delegate = self;
    self.txtUserAdress.tag = 4;
    self.txtUserAdress.delegate = self;
    
    // us as datasurce and delegat of table
    self.tableValidateAddress.dataSource = self;
    self.tableValidateAddress.delegate = self;
    
    // Add UITapGestureRecognizer to dimView
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                         action:@selector(closeView)];
    [self.dimView addGestureRecognizer:tap];
    
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
        
        BAPGetValidateAddressForAddress* getValidateAddressForAddress = [BAPGetValidateAddressForAddress new];
        
        [getValidateAddressForAddress getValidateAdrressForAdrressString:self.txtUserAdress.text successBlock:^(id jsonObject) {
            
            self.validateAddressFeed = jsonObject;
            
            [self showTable];
            
        } failerBlock:^(NSError *error) {
            
            NSLog(@"error loading jason: %@", error);
            
        }];
        
    }
    
}

- (void)showTable
{
    NSUInteger results = self.validateAddressFeed.arrValidateAddress.count;
    if (results == 0)
    {
        [self showAlartWithTitle:@"לא נמצא כתובת מתאימה"];
    }
    else
    {
        if (results >= 5)
        {
            self.constraintContainerHeight.constant = CONSTRAINT_CONTAINER_HEIGHT_FOR_1_RESULT + (CONSTRAINT_CONTAINER_HEIGHT_FACTOR * 5);
        }
        else
        {
            self.constraintContainerHeight.constant = CONSTRAINT_CONTAINER_HEIGHT_FOR_1_RESULT + (CONSTRAINT_CONTAINER_HEIGHT_FACTOR * results);
        }
        
        self.dimView.hidden = NO;
        self.containerTableValidateAddress.hidden = NO;
        
        
        [self.tableValidateAddress reloadData];
        
        // Scrool Table To Top
        [self.tableValidateAddress scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
        
        [UIView animateWithDuration:0.5 animations:^{
            
            self.dimView.alpha = 0.5;
            
            self.containerTableValidateAddress.alpha = 1;
            
        }];
    }
    
}
#pragma mark - Table methods


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.validateAddressFeed.arrValidateAddress.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier;
    
    cellIdentifier = @"rowCell";
    [self.tableValidateAddress registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    cell.textLabel.textAlignment = NSTextAlignmentRight;

    cell.textLabel.text = self.validateAddressFeed.arrValidateAddress[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BAPSecondRegistrationVC* secondRegistrationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPSecondRegistrationVC"];
    
    secondRegistrationVC.strUserFirstName = self.txtUserFirstName.text;
    secondRegistrationVC.strLastName = self.txtUserLastName.text;
    secondRegistrationVC.strUserEMail = self.txtUserEMail.text;
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    secondRegistrationVC.strUserAdreess = cell.textLabel.text;
    
    [self presentViewController:secondRegistrationVC animated:NO completion:nil];
}

- (void)closeView
{
    [UIView animateWithDuration:0.5 animations:^{
        
        self.dimView.alpha = 0;
        self.containerTableValidateAddress.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        self.containerTableValidateAddress.hidden = YES;
        self.dimView.hidden = YES;
        
    }];
}




@end
